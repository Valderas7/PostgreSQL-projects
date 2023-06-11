# Celestial Bodies Database

Estos son todos los requisitos completados para terminar el proyecto:

> Complete the tasks below:
> - [x] You should create a database named `universe`
> - [x] Be sure to connect to your database with \c universe. Then, you should add tables named `galaxy`, `star`, `planet`, and `moon`
> - [x] Each table should have a primary key
> - [x] Each primary key should automatically increment
> - [x] Each table should have a `name` column
> - [x] You should use the `INT` data type for at least two columns that are not a primary or foreign key
> - [x] You should use the `NUMERIC` data type at least once
> - [x] You should use the `TEXT` data type at least once
> - [x] You should use the `BOOLEAN` data type on at least two columns
> - [x] Each `star` should have a foreign key that references one of the rows in `galaxy`
> - [x] Each `planet` should have a foreign key that references one of the rows in `star`
> - [x] Each `moon` should have a foreign key that references one of the rows in `planet`
> - [x] Your database should have at least five tables
> - [x] Each table should have at least three rows
> - [x] The `galaxy` and `star` tables should each have at least six rows
> - [x] The `planet` table should have at least 12 rows
> - [x] The `moon` table should have at least 20 rows
> - [x] Each table should have at least three columns
> - [x] The `galaxy`, `star`, `planet` and `moon` tables should each have at least five columns
> - [x] At least two columns per table should not accept `NULL` values
> - [x] At least one column from each table should be required to be `UNIQUE`
> - [x] All columns named name should be of type `VARCHAR`
> - [x] Each primary key column should follow the naming convention table `_name_id`. For example, the `moon` table should have a primary key column named `moon_id`
> - [x] Each foreign key column should have the same name as the column it is referencing
