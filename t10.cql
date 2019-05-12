CREATE TYPE demo.simplely3 (
       id int,
       floter float
    );

CREATE TABLE demo.employee2 (
    id int PRIMARY KEY,
    mapy map <text, frozen<simplely3>>

); 
