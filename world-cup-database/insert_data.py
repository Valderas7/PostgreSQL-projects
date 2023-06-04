# Librerías
import pandas as pd
import psycopg2

# Se leen los datos del archivo 'csv'
data = pd.read_csv('games.csv')

# Listas para recopilar todos los equipos ganadores y perdedores
winners = [winner for winner in data.winner]
losers = [loser for loser in data.opponent]

# Lista que filtra los valores únicos de las listas de los equipos ganadores y perdedores
unique_teams = [*set(winners + losers)]

# Conexión con la base de datos
conn = psycopg2.connect(database = "worldcup",
                        host = "127.0.0.1",
                        user = "valderas",
                        password = "*******",
                        port = "5432")

# Ejecutar consultas en la base de datos conectada
cursor = conn.cursor()

# Se ejecuta la consulta. Por cada equipo en el 'array' se añade a la tabla con su índice correspondiente
for index, unique_team in enumerate(unique_teams):
    cursor.execute('INSERT INTO teams (team_id, name) VALUES (%s, %s)', (index + 1, unique_team))

# Se itera sobre cada fila del 'dataframe' y se consulta la tabla 'teams', para poder recopilar los 'team_id'
# de los equipos ganadores y perdedores de cada fila, para poder insertarlos posteriormente en la tabla 'games'
for index, row in data.iterrows():
    winner_query = cursor.execute('SELECT team_id FROM teams WHERE name = %s', (row['winner'],))
    winner_id = cursor.fetchall()

    loser_query = cursor.execute('SELECT team_id FROM teams WHERE name = %s', (row['opponent'],))
    loser_id = cursor.fetchall()

    cursor.execute('INSERT INTO games (game_id, year, round, winner_id, opponent_id, winner_goals, opponent_goals) '
                   'VALUES (%s, %s, %s, %s, %s, %s, %s)', (index + 1, row['year'], row['round'], winner_id[0],
                                                           loser_id[0], row['winner_goals'],
                                                           row['opponent_goals']))

#Se confirma la última transacción realizada para que aparezca en la base de datos la consulta realizada
conn.commit()



