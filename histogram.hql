drop table Pixels;
drop table Red;
drop table Blue;
drop table Green;

create table Pixels(
	R int,
	B int,
	G int)
	row format delimited fields terminated by ',' stored as textfile;
	load data local inpath '${hiveconf:P}' overwrite into table Pixels;

CREATE TABLE Red AS
SELECT
1 as color,
R as intensity,
COUNT(*) as count
FROM Pixels GROUP BY R;

CREATE TABLE Blue AS
SELECT
2 as color,
B as intensity,
COUNT(*) as count
FROM Pixels GROUP BY B;

CREATE TABLE Green AS
SELECT
3 as color,
G as intensity,
COUNT(*) as count
FROM Pixels GROUP BY G;

SELECT * FROM Red UNION ALL SELECT * FROM Blue UNION ALL SELECT * FROM Green;