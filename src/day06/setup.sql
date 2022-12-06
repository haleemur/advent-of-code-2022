DROP TABLE IF EXISTS day06_packet_sequence;

CREATE TABLE day06_packet_sequence (
    datastream TEXT
);

COPY day06_packet_sequence FROM '/aoc2022_data/day06.txt';
