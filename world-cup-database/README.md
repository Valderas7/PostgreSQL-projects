# World Cup Database

Estos son todos los requisitos completados para terminar el proyecto:

> Complete the tasks below:
> - [x] You should create a database named `worldcup`
> - [x] You should connect to your `worldcup` database and then create `teams` and `games` tables
> - [x] Your teams table should have a `team_id` column that is a type of `SERIAL` and is the primary key, and a `name` column that has to be `UNIQUE`
> - [x] Your games table should have a `game_id` column that is a type of `SERIAL` and is the primary key, a `year` column of type `INT`, and a `round` column of type `VARCHAR`
> - [x] Your games table should have `winner_id` and `opponent_id` foreign key columns that each reference `team_id` from the `teams` table
> - [x] Your games table should have `winner_goals` and `opponent_goals` columns that are type `INT`
> - [x] All of your columns should have the `NOT NULL` constraint
> - [x] When you run your `insert_data.py` script, it should add each unique team to the `teams` table. There should be 24 rows
> - [x] When you run your `insert_data.py` script, it should insert a row for each line in the `games.csv` file (other than the top line of the file). There should be 32 rows. Each row should have every column filled in with the appropriate info. Make sure to add the correct ID's from the `teams` table (you cannot hard-code the values)
> - [x] You should correctly complete the queries in the `queries.py` file. Fill in each command to get the output of what is suggested with the command above it. Only use a single line like the first query. The output should match what is in the `expected_output.txt` file exactly, take note of the number of decimal places in some of the query results