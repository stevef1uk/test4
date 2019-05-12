CREATE TYPE demo.simple (
   dummy text
);

CREATE TYPE demo.city (
    id int,
    citycode text,
    cityname text,
    test_int int,
    lastUpdatedAt TIMESTAMP,
    myfloat float
    events set<int>,
    mymap  map<int, text>
    address_list set<frozen<simple>>,
);

CREATE TABLE demo.employee (
    id int,
    address_set set<frozen<city>>,
    my_List list<frozen<simple>>,
    name text,
    mediate TIMESTAMP,
    second_ts timestamp,
    tevents set<int>,
    tmylist list<float>
    tmymap  map<int, text>
   PRIMARY KEY (id, mediate, second_ts )
 ) WITH CLUSTERING ORDER BY (mediate ASC, second_ts ASC)
