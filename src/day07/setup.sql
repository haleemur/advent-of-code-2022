DROP TABLE IF EXISTS day07_filesystem;

CREATE TABLE day07_filesystem (
    id int PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    shell_output text
);

COPY day07_filesystem (shell_output) FROM '/aoc2022_data/day07.txt';
