-- 1) Компьютеры одного производителя
select * from computers where manufacturer_id = 1;


-- 2) Ноутбуки с информацией о производителе
select * from computers c, manufacturers m
    where m.id = c.manufacturer_id
        and c.is_notebook = true;


-- 3) Расширенный запрос информации о сборках компьютеров
select * from computers c, manufacturers m, assemblies a
    where c.manufacturer_id = m.id
        and c.assembly_id = a.id;


-- 4)
select * from computers c, computers c2;


-- 5) Компьютеры с именем производителя содержащим подцепочку символов
select * from computers where manufacturer_id in (
    select id from manufacturers m where m.title like '%ll%'
    );

-- Компьютеры состоящие более чем из 10и частей
select * from computers c where exists (
    select * from (
    select count(part_id) as cnt from assemblies_parts ap
        where ap.assembly_id = c.assembly_id) where cnt > 10
                                );

-- SQLite не поддерживает ALL в выражениях WHERE
-- SQLite не поддерживает ANY в выражениях WHERE

-- Производителя для которых есть 2 и более компьютера
select * from manufacturers m where exists(
    select * from (
        select count(*) as cnt from computers c where c.manufacturer_id = m.id)
    where cnt >= 2
);

-- Производителя для которых есть 2 и более компьютера (вариант с IN)
select * from manufacturers m where id in (
    select mid from (
        select count(*) as cnt, manufacturer_id as mid
            from computers c
        group by manufacturer_id)
    where cnt >= 2
);

-- 6) Компьютеры двух производителей
select * from computers where manufacturer_id = 1
union
select * from computers where manufacturer_id = 2;
-- Компьютеры производителя упомянутого во всех группах
select * from computers where manufacturer_id in (1, 3)
intersect
select * from computers where manufacturer_id in (3);
-- Датчики неупомянутого хотя бы в одной группе производителя
select * from computers where manufacturer_id in (1, 3)
except
select * from computers where manufacturer_id in (3);

-- 7), 9), 10) Информация о товарах
create view info as
select m.title as manufacturer, c.*
    from (select c.title as title, cost, a.title as assembly,
            group_concat(p.title) as parts, manufacturer_id
        from computers c
            left join assemblies a on c.assembly_id = a.id
            left join assemblies_parts ap on a.id = ap.assembly_id
            left join parts p on ap.part_id = p.id
        where is_notebook = true
            and cost between 1000 and 5000
        group by c.id) c
left join manufacturers m on c.manufacturer_id = m.id
order by cost;
-- Информация о товарах с заданной ценой
select * from info where cost > 1000;

-- 8) Компьютеры с производителями
select * from computers c
    join manufacturers m on c.manufacturer_id = m.id;
-- Компьютеры умноженные на самих себя
select * from computers c
    cross join computers c2;
-- SQLite не осуществляет NATURAL JOIN без указания направления объединения
-- Датчики с ценами
select * from computers c
    left outer join manufacturers m on m.id = c.manufacturer_id;
-- Компьютеры с изменением цены
select * from computers
    natural left outer join cost_history;
-- SQLite не реализует правых объединений, т.к. они практически идентичны левым


-- 11) Имеются ли в наличии ноутбуки или компьютеры со средней ценой менее 3500
select avg(cost) as avg_cost, is_notebook from computers c
    left join manufacturers m on c.manufacturer_id = m.id
    group by is_notebook
    having avg_cost < 3500;


-- 12) Компьютеры включающие некоторую часть
select * from computers c where id in (
    select c2.id from parts p
        left join assemblies_parts ap on p.id = ap.part_id
        left join computers c2 on ap.assembly_id = c2.assembly_id
    where c2.id = c.id and p.id = 1
    );
-- Компьютеры не включающие некоторую часть
select * from computers c where id not in (
    select c2.id from parts p
        left join assemblies_parts ap on p.id = ap.part_id
        left join computers c2 on ap.assembly_id = c2.assembly_id
    where c2.id = c.id and p.id = 1
    );


-- 13)
create trigger if not exists assembly_check
    before update on assemblies
for each row
    begin
        update assemblies_parts set assembly_id = NEW.id where assembly_id = OLD.id;
        update computers set assembly_id = NEW.id where assembly_id = OLD.id;
    end;


-- 14) SQLite не поддерживает IF-THEN в триггерах


-- 15)
create trigger if not exists task_14
    before update on computers
for each row
when OLD.cost != NEW.cost
    begin
        insert into cost_history (id, old_cost, new_cost) values (OLD.id, OLD.cost, NEW.cost);
    end;


-- 16) Пример индекса
create index computers_manufacturer_id_index
	on computers (manufacturer_id);


-- 17) Пример внешнего индекса сщ ссылкой на ключевой столбец таблицы производителей
create table computers
(
    id              integer not null
        constraint computers_pk
            primary key autoincrement,
    manufacturer_id int     not null
        references manufacturers
            on update cascade on delete restrict,
    title           text    not null,
    cost            real    not null,
    is_notebook     boolean default 0 not null,
    assembly_id     integer not null
);