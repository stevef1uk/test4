CREATE TYPE demo.simple3 (
       id int,
       floter float
    );

CREATE TYPE demo.simples (
       id int,
       dummy text,
       mediate TIMESTAMP,
       embedded FROZEN<simple3>
    );

CREATE TABLE demo.employee1 (
    id int PRIMARY KEY,
    tSimple simples
) 
