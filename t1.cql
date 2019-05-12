CREATE TABLE demo.accounts (
    id int,
    name text,
    status text
    PRIMARY KEY (id, name)
) WITH CLUSTERING ORDER BY (name ASC)
