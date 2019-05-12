CREATE TYPE demo.simplely3 (
       id int,
       floter float,
    name text,
    ascii1 ascii,
    bint1 bigint,
    blob1 blob,
    bool1 boolean,
    dec1 decimal,
    double1 double,
    flt1 float,
    inet1 inet,
    int1 int,
    text1 text,
    time1 timestamp,
    time2 timeuuid,
    mydate1 date,
    uuid1 uuid,
    varchar1 varchar,
    events set<int>,
    mylist list<float>,
    myset set<text>,
    adec list<decimal>,
    );

CREATE TABLE demo.employee2 (
    id int PRIMARY KEY,
    mapy map <text, frozen<simplely3>>

); 
