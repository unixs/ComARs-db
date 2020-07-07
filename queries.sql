-- # Запросы

-- ## Выборка данных

-- ### Все предлагаемые компьютеры
select * from computers;

-- ### Все ноутбуки
select * from computers
    where is_notebook = true;

-- ### Десктопы дороже 3000 и дешевле 5000
select * from computers
    where is_notebook = false
        and cost between 3000 and 5000;

-- ### Получение всей информации о компьютерах из предыдущего запроса
select m.title as manufacturer, c.*
    from (select c.title as title, cost, a.title as assembly,
            group_concat(p.title) as parts, manufacturer_id
        from computers c
            left join assemblies a on c.assembly_id = a.id
            left join assemblies_parts ap on a.id = ap.assembly_id
            left join parts p on ap.part_id = p.id
        where is_notebook = true
            and cost between 3000 and 5000
        group by c.id) c
left join manufacturers m on c.manufacturer_id = m.id
order by cost;

-- ## Вставка данных

-- ### Добавление производеителя
insert into manufacturers (title)
    values ('Электроника'), ('SONY');

-- ### Добавление новой сборки для некоторого компьютера на базе одной из имеющихся
begin transaction;
    -- SQLite не поддерживает переменные
    create temporary table vars (
        name text,
        val integer
    );

    -- Создаём новую сборку
    insert into assemblies (title) values ('special');
    -- Запоминаем ID новой сборки
    insert into vars select 'assembly', (select last_insert_rowid());
    -- Запоминаем ID последней добавленной запчасти
    insert into vars select 'lastpart', (select max(id) from parts);
    -- Добавляем новые запчасти
    insert into parts (title) values ('корпус с окошками'), ('кулер корпусный'), ('безперебойник');
    -- Копируем из старой сборки все запчасти в новую
    insert into assemblies_parts select (select val from vars where name = 'assembly'), part_id from
        (select part_id from
                (select * from computers c left join assemblies a on c.assembly_id = a.id order by cost desc limit 1) c
                left join assemblies_parts ap on c.assembly_id = ap.assembly_id);
    -- Добавляем новые запчасти к новой сборке
    insert into assemblies_parts select (select id from assemblies where ROWID = (select val from vars where name = 'assembly')), part_id from
        (select id as part_id from parts where id > (select val from vars where name = 'lastpart'));
    -- Копируем компьютер c новыми номером сборки и ценой
    insert into computers (assembly_id, manufacturer_id, title, is_notebook, cost)
        select (select id from assemblies where ROWID = (select val from vars where name = 'assembly')), manufacturer_id, title, is_notebook, 8900
            from computers where title = 'DEC11';

    drop table vars;
commit;

-- ### Понижение цены сборки компьютера
update computers set cost = cost - 1000 where title = 'SK123';

-- ### Удаление компьютера из ассортимента
begin transaction;
    -- Снизу вверх по иерархии зависимостей удадяем все зависимости и базовую сущность
    delete from assemblies_parts where assembly_id = (select assembly_id from computers where title = 'Байкал 1');
    delete from assemblies where id = (select assembly_id from computers where title = 'Байкал 1');
    delete from computers where title = 'Байкал 1';
commit;

-- ## Эффективность

-- ### Добавляем индекс в таблицу связи сборок и запчастей

create index if not exists assemblies_parts_idx
    ON assemblies_parts (assembly_id, part_id);
