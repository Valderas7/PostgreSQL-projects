# Librerías
import psycopg2

# Conexión con la base de datos
conn = psycopg2.connect(database = "worldcup",
                        host = "127.0.0.1",
                        user = "valderas",
                        password = "********",
                        port = "5432")

# Permite eecutar consultas en la base de datos conectada
cursor = conn.cursor()

# Ejecuta la consulta solicitada y la muestra por pantalla
print("\nTotal number of goals in all games from winning teams:")
winner_goals = cursor.execute("SELECT SUM(winner_goals) FROM games")
print(cursor.fetchone()[0])

# Ejecuta la consulta solicitada y la muestra por pantalla
print("\nTotal number of goals in all games from both teams combined:")
total_goals = cursor.execute("SELECT SUM(winner_goals + opponent_goals) FROM games")
print(cursor.fetchone()[0])

# Ejecuta la consulta solicitada y la muestra por pantalla
print("\nAverage number of goals in all games from the winning teams:")
avg_winner_goals = cursor.execute("SELECT AVG(winner_goals) FROM games")
print(cursor.fetchone()[0])

# Ejecuta la consulta solicitada y la muestra por pantalla
print("\nAverage number of goals in all games from the winning teams rounded to two decimal places:")
avg_winner_goals_rounded = cursor.execute("SELECT ROUND(AVG(winner_goals), 2) FROM games")
print(cursor.fetchone()[0])

# Ejecuta la consulta solicitada y la muestra por pantalla
print("\nAverage number of goals in all games from both teams:")
avg_goals_rounded = cursor.execute("SELECT AVG(winner_goals + opponent_goals) FROM games")
print(cursor.fetchone()[0])

# Ejecuta la consulta solicitada y la muestra por pantalla
print("\nMost goals scored in a single game by one team:")
max_goals = cursor.execute("SELECT MAX(winner_goals) FROM games")
print(cursor.fetchone()[0])

# Ejecuta la consulta solicitada y la muestra por pantalla
print("\nNumber of games where the winning team scored more than two goals:")
winner_goals_two_more = cursor.execute("SELECT COUNT(*) FROM games WHERE winner_goals > 2")
print(cursor.fetchone()[0])

# Ejecuta la consulta solicitada y la muestra por pantalla
print("\nWinner of the 2018 tournament team name:")
winner_2018_team = cursor.execute("SELECT name FROM teams JOIN games ON teams.team_id = games.winner_id "
                                  "WHERE year = 2018 AND round = 'Final'")
print(cursor.fetchone()[0])

# Ejecuta la consulta solicitada y la muestra por pantalla
print("\nList of teams who played in the 2014 'Eighth-Final' round:")
eightfinal_2014_teams = cursor.execute("SELECT name FROM teams JOIN games ON (teams.team_id = games.winner_id OR "
                                       "teams.team_id = games.opponent_id) WHERE year = 2014 AND "
                                       "round = 'Eighth-Final' ORDER BY name")
print(cursor.fetchall())

# Ejecuta la consulta solicitada y la muestra por pantalla
print("\nList of unique winning team names in the whole data set:")
unique_winning_teams = cursor.execute("SELECT DISTINCT (name) FROM teams JOIN games ON "
                                      "(teams.team_id = games.winner_id) ORDER BY name")
print(cursor.fetchall())

# Ejecuta la consulta solicitada y la muestra por pantalla
print("\nYear and team name of all the champions:")
year_and_champions = cursor.execute("SELECT year, name FROM games JOIN teams ON teams.team_id = games.winner_id "
                                    "WHERE round = 'Final' ORDER BY year")
print(cursor.fetchall())

# Ejecuta la consulta solicitada y la muestra por pantalla
print("\nList of teams that start with 'Co':")
co_teams = cursor.execute("SELECT name FROM teams WHERE name LIKE 'Co%'")
print(cursor.fetchall())