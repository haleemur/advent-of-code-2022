# Advent of Code 2022

_in postgresql sql `select` statements_

## Why?

Solving the advent of code challenges in sql poses some specific problems, that practitioners are unlikely to encounter in day to day usage of the database. Solutions so far (today is day 5) have involved analytical expressions, recursive CTEs & table generating functions.

## Getting Started - Installation

To use this project you only need to have docker installed. The database (postgresql) will be launched in a container.

You can connect to the database server using you preferred database client, as long as it supports postgresql.

First launch the container

```
docker-compose up -d
```

Then connect to the database.

#### connecting from the host machine

The connection details are below. You can connect using any client that supports postgresql

- Username: `postgres`
- Password: `postgres`
- Port: `5432`
- Host: `localhost`

#### connecting through ssh access of the docker container.

It is also possible to go into the running docker container and connect to the database using `psql`.

```
/advent-of-code-2022$ $ docker exec -it aoc-postgresql-db-1 /bin/sh
/ # psql -U postgres
psql (14.1)
Type "help" for help.

postgres=#
```

## Project Structure.

```
- ./aoc2022_data
- ./src
docker-compose.yml
README.md
```

The sample data provided by the advent of code are copy-pasted into text files in the folder `aoc2022_data`.

Each day's puzzle solution is added to the `src` directory. So, for day-01, the solution code would be in the directory `src/day01`.

Advent of Code has two challenges per day, based on the same data set. For each day, there are 3 source files.

1. `setup.sql`: table definitions & copy statement is written here
2. `part01.sql`: sql query that generates solution to part 01
3. `part02.sql`: sql query that generates solution to part 02

_note that the local directories `aoc2022_data` & `src` are bound into the docker container. So, when the local files are edited & saved, they are available from within the docker container_

## Running the examples

#### Using `psql`

It is possible to execute an sql script through `psql`.

#### connecting through ssh access of the docker container

Since the src & data directories are mounted on the server, it is possible to do the following

```
/ # psql -U postgres
psql (14.1)
Type "help" for help.

postgres=# \i src/day01/setup.sql
DROP TABLE
CREATE TABLE
COPY 2251
```

This executes the set up script for day 1's challenge.

It is then possible to run the code for parts 1 & 2 as follows:

```
postgres=# \i src/day01/part01.sql
postgres=# \i src/day01/part02.sql
```

#### connecting from the host machine through port 5432

```
advent-of-code-2022$ psql postgresql://postgres:postgres@localhost:5432/postgres

psql (12.12 (Ubuntu 12.12-0ubuntu0.20.04.1), server 14.1)
WARNING: psql major version 12, server major version 14.
         Some psql features might not work.
Type "help" for help.

postgres=# \i src/day01/setup.sql
DROP TABLE
CREATE TABLE
COPY 2251
```

## Contributions

If you have an alternate (maybe better) way of solving the challenges, feel free to make an issue & open an MR!
