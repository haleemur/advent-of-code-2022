DROP TABLE IF EXISTS day08_trees;

CREATE TABLE day08_trees (
    id int PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    treerow text
);

COPY day08_trees (treerow) FROM '/aoc2022_data/day08.txt';
