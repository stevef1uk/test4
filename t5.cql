CREATE TABLE demo.demo1 (
			id int PRIMARY KEY,
			testtimestamp  timestamp,
			testbigint     bigint,
			testblob       blob,
			testbool       boolean,
			testfloat      float,
			testdouble     double,
			testint        int,
			testlist       list<text>,
			testset        set<int>,
			testmap        map<text, text> );
