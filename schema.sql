CREATE TABLE manufacturers
(
	id integer not null
		constraint manufacturers_pk
			primary key autoincrement,
	title text not null
);
CREATE TABLE assemblies_parts
(
	assembly_id integer not null,
	part_id integer not null
);
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
CREATE TABLE "assemblies"
(
	id integer not null
		constraint assemblies_pk
			primary key autoincrement,
	title text
);
CREATE TABLE "parts"
(
	id integer not null
		constraint parts_pk
			primary key autoincrement,
	title text
);
