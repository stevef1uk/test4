CREATE TYPE demo.simple (
       dummy text
    );

    CREATE TYPE demo.city (
    id int,
    citycode text,
    cityname text,
    test_int int,
    lastUpdatedAt TIMESTAMP,
    myfloat float,
    events set<int>,
    mymap  map<text, text>,
    address_list set<frozen<simple>>
);

CREATE TABLE demo.employee (
    id int,
    address_set set<frozen<city>>,
    my_List list<frozen<simple>>,
    name text,
    mediate TIMESTAMP,
    second_ts TIMESTAMP,
    tevents set<int>,
    tmylist list<float>,
    tmymap  map<text, text>,
   PRIMARY KEY (id, mediate, second_ts )
 ) 
