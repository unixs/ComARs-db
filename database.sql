PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE manufacturers
(
	id integer not null
		constraint manufacturers_pk
			primary key autoincrement,
	title text not null
);
INSERT INTO "manufacturers" VALUES(1,'РосТех');
INSERT INTO "manufacturers" VALUES(2,'Сколково');
INSERT INTO "manufacturers" VALUES(3,'HP');
INSERT INTO "manufacturers" VALUES(4,'Dell');
INSERT INTO "manufacturers" VALUES(5,'Lenovo');
INSERT INTO "manufacturers" VALUES(6,'micro-soft');
INSERT INTO "manufacturers" VALUES(7,'MSI');
INSERT INTO "manufacturers" VALUES(8,'НПО Вектор');
INSERT INTO "manufacturers" VALUES(9,'Acer');
INSERT INTO "manufacturers" VALUES(10,'Digma');
CREATE TABLE assemblies
(
	id integer not null
		constraint assemblies_pk
			primary key autoincrement,
	title int
);
INSERT INTO "assemblies" VALUES(1,'Для ГУВД');
INSERT INTO "assemblies" VALUES(2,'Для розницы');
INSERT INTO "assemblies" VALUES(3,'На ветрину');
INSERT INTO "assemblies" VALUES(4,'Дешёвый вариант');
INSERT INTO "assemblies" VALUES(5,'Для промо акции');
INSERT INTO "assemblies" VALUES(6,'Новогодний');
INSERT INTO "assemblies" VALUES(7,'Оптовый');
INSERT INTO "assemblies" VALUES(8,'Учебный');
INSERT INTO "assemblies" VALUES(9,'Социальный');
INSERT INTO "assemblies" VALUES(10,'Дорогой');
CREATE TABLE parts
(
	id integer not null
		constraint parts_pk
			primary key autoincrement,
	title int
);
INSERT INTO "parts" VALUES(1,'проц');
INSERT INTO "parts" VALUES(2,'крутой проц');
INSERT INTO "parts" VALUES(3,'крутанский проц');
INSERT INTO "parts" VALUES(4,'материнка');
INSERT INTO "parts" VALUES(5,'материнка с турбонаддувом');
INSERT INTO "parts" VALUES(6,'кулер на проц');
INSERT INTO "parts" VALUES(7,'кулер на проц с фонариками');
INSERT INTO "parts" VALUES(8,'набор свистелок и перделок');
INSERT INTO "parts" VALUES(9,'герлянда ёлочная в подарок');
INSERT INTO "parts" VALUES(10,'память шустрая');
INSERT INTO "parts" VALUES(11,'много памяти');
INSERT INTO "parts" VALUES(12,'очень много памяти');
INSERT INTO "parts" VALUES(13,'очень-очень много памяти');
INSERT INTO "parts" VALUES(14,'памяти столько чтобы хром не вылетал');
INSERT INTO "parts" VALUES(15,'материнка геймерская');
INSERT INTO "parts" VALUES(16,'видяха чтобы моник работал');
INSERT INTO "parts" VALUES(17,'видяха геймерская');
INSERT INTO "parts" VALUES(18,'видяха для майнинга');
INSERT INTO "parts" VALUES(19,'клава обычная');
INSERT INTO "parts" VALUES(20,'клава с подсветкой');
INSERT INTO "parts" VALUES(21,'клава с канализацией для кофе');
INSERT INTO "parts" VALUES(22,'мышка');
INSERT INTO "parts" VALUES(23,'мышка оптическая');
INSERT INTO "parts" VALUES(24,'мышка безпроводная');
INSERT INTO "parts" VALUES(25,'резак');
INSERT INTO "parts" VALUES(26,'дивиди резак');
INSERT INTO "parts" VALUES(27,'монитор лучевой в подарок');
INSERT INTO "parts" VALUES(28,'моник геймерский гнутый');
INSERT INTO "parts" VALUES(29,'моник хороший');
INSERT INTO "parts" VALUES(30,'память');
CREATE TABLE assemblies_parts
(
	assembly_id integer not null,
	part_id integer not null
);
INSERT INTO "assemblies_parts" VALUES(1,1);
INSERT INTO "assemblies_parts" VALUES(1,4);
INSERT INTO "assemblies_parts" VALUES(1,6);
INSERT INTO "assemblies_parts" VALUES(1,16);
INSERT INTO "assemblies_parts" VALUES(1,27);
INSERT INTO "assemblies_parts" VALUES(1,19);
INSERT INTO "assemblies_parts" VALUES(1,22);
INSERT INTO "assemblies_parts" VALUES(1,30);
INSERT INTO "assemblies_parts" VALUES(2,2);
INSERT INTO "assemblies_parts" VALUES(2,5);
INSERT INTO "assemblies_parts" VALUES(2,7);
INSERT INTO "assemblies_parts" VALUES(2,17);
INSERT INTO "assemblies_parts" VALUES(2,29);
INSERT INTO "assemblies_parts" VALUES(2,19);
INSERT INTO "assemblies_parts" VALUES(2,23);
INSERT INTO "assemblies_parts" VALUES(2,10);
INSERT INTO "assemblies_parts" VALUES(3,2);
INSERT INTO "assemblies_parts" VALUES(3,4);
INSERT INTO "assemblies_parts" VALUES(3,6);
INSERT INTO "assemblies_parts" VALUES(3,17);
INSERT INTO "assemblies_parts" VALUES(3,28);
INSERT INTO "assemblies_parts" VALUES(3,20);
INSERT INTO "assemblies_parts" VALUES(3,24);
INSERT INTO "assemblies_parts" VALUES(3,12);
INSERT INTO "assemblies_parts" VALUES(4,3);
INSERT INTO "assemblies_parts" VALUES(4,5);
INSERT INTO "assemblies_parts" VALUES(4,6);
INSERT INTO "assemblies_parts" VALUES(4,18);
INSERT INTO "assemblies_parts" VALUES(4,29);
INSERT INTO "assemblies_parts" VALUES(4,21);
INSERT INTO "assemblies_parts" VALUES(4,22);
INSERT INTO "assemblies_parts" VALUES(4,30);
INSERT INTO "assemblies_parts" VALUES(5,2);
INSERT INTO "assemblies_parts" VALUES(5,4);
INSERT INTO "assemblies_parts" VALUES(5,7);
INSERT INTO "assemblies_parts" VALUES(5,15);
INSERT INTO "assemblies_parts" VALUES(5,27);
INSERT INTO "assemblies_parts" VALUES(5,20);
INSERT INTO "assemblies_parts" VALUES(5,24);
INSERT INTO "assemblies_parts" VALUES(5,10);
INSERT INTO "assemblies_parts" VALUES(6,1);
INSERT INTO "assemblies_parts" VALUES(6,5);
INSERT INTO "assemblies_parts" VALUES(6,7);
INSERT INTO "assemblies_parts" VALUES(6,18);
INSERT INTO "assemblies_parts" VALUES(6,28);
INSERT INTO "assemblies_parts" VALUES(6,19);
INSERT INTO "assemblies_parts" VALUES(6,22);
INSERT INTO "assemblies_parts" VALUES(6,30);
INSERT INTO "assemblies_parts" VALUES(7,2);
INSERT INTO "assemblies_parts" VALUES(7,5);
INSERT INTO "assemblies_parts" VALUES(7,7);
INSERT INTO "assemblies_parts" VALUES(7,16);
INSERT INTO "assemblies_parts" VALUES(7,29);
INSERT INTO "assemblies_parts" VALUES(7,21);
INSERT INTO "assemblies_parts" VALUES(7,24);
INSERT INTO "assemblies_parts" VALUES(7,14);
INSERT INTO "assemblies_parts" VALUES(8,1);
INSERT INTO "assemblies_parts" VALUES(8,4);
INSERT INTO "assemblies_parts" VALUES(8,6);
INSERT INTO "assemblies_parts" VALUES(8,16);
INSERT INTO "assemblies_parts" VALUES(8,29);
INSERT INTO "assemblies_parts" VALUES(8,20);
INSERT INTO "assemblies_parts" VALUES(8,22);
INSERT INTO "assemblies_parts" VALUES(8,12);
INSERT INTO "assemblies_parts" VALUES(9,2);
INSERT INTO "assemblies_parts" VALUES(9,5);
INSERT INTO "assemblies_parts" VALUES(9,6);
INSERT INTO "assemblies_parts" VALUES(9,17);
INSERT INTO "assemblies_parts" VALUES(9,28);
INSERT INTO "assemblies_parts" VALUES(9,21);
INSERT INTO "assemblies_parts" VALUES(9,23);
INSERT INTO "assemblies_parts" VALUES(9,13);
INSERT INTO "assemblies_parts" VALUES(10,2);
INSERT INTO "assemblies_parts" VALUES(10,5);
INSERT INTO "assemblies_parts" VALUES(10,6);
INSERT INTO "assemblies_parts" VALUES(10,18);
INSERT INTO "assemblies_parts" VALUES(10,27);
INSERT INTO "assemblies_parts" VALUES(10,19);
INSERT INTO "assemblies_parts" VALUES(10,24);
INSERT INTO "assemblies_parts" VALUES(10,10);
INSERT INTO "assemblies_parts" VALUES(10,26);
INSERT INTO "assemblies_parts" VALUES(10,27);
INSERT INTO "assemblies_parts" VALUES(10,12);
INSERT INTO "assemblies_parts" VALUES(6,27);
INSERT INTO "assemblies_parts" VALUES(6,27);
INSERT INTO "assemblies_parts" VALUES(9,25);
INSERT INTO "assemblies_parts" VALUES(6,9);
INSERT INTO "assemblies_parts" VALUES(1,9);
INSERT INTO "assemblies_parts" VALUES(1,9);
INSERT INTO "assemblies_parts" VALUES(1,9);
CREATE TABLE computers
(
    id              integer not null
        constraint computers_pk
            primary key autoincrement,
    manufacturer_id int     not null,
    title           text    not null,
    cost            real    not null,
    is_notebook     boolean default 0 not null,
    assembly_id     integer not null
);
INSERT INTO "computers" VALUES(1,1,'Байкал 1',1000.0,0,1);
INSERT INTO "computers" VALUES(2,2,'SK123',5522.0,1,2);
INSERT INTO "computers" VALUES(3,3,'AA42',1123.0,0,3);
INSERT INTO "computers" VALUES(4,3,'CP05',1232.0,0,4);
INSERT INTO "computers" VALUES(5,4,'DEC11',1233.0,0,5);
INSERT INTO "computers" VALUES(6,1,'Байкал 2',2000.0,1,6);
INSERT INTO "computers" VALUES(7,6,'KU89',7774.0,0,7);
INSERT INTO "computers" VALUES(8,5,'SP89',5468.0,0,8);
INSERT INTO "computers" VALUES(9,7,'MERS600',3214.0,0,9);
INSERT INTO "computers" VALUES(10,8,'Фёдор78',3000.0,1,10);
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('parts',30);
INSERT INTO "sqlite_sequence" VALUES('manufacturers',10);
INSERT INTO "sqlite_sequence" VALUES('assemblies',10);
INSERT INTO "sqlite_sequence" VALUES('computers',10);
COMMIT;
