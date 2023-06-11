# Librerías
import pandas as pd
import psycopg2

# Conexión con la base de datos
conn = psycopg2.connect(database = "salon",
                        host = "127.0.0.1",
                        user = "valderas",
                        password = "jonmamon",
                        port = "5432")

# Ejecutar consultas en la base de datos conectada
cursor = conn.cursor()

# Mensaje de bienvenida
print("~~~~~ MY SALON ~~~~~\n\nWelcome to My Salon, how can I help you?\n")

# Bucle
while 1:

    # Muestra los servicios disponibles por pantalla consultando la tabla de servicios
    services_query = cursor.execute('SELECT * FROM services')
    services = cursor.fetchall()

    # Por cada servicio de la consulta, se muestra uno debajo del otro
    for service in services:
        print(str(service[0]) + ') ' + str(service[1]))

    # Se pregunta por el servicio que se quiere solicitar
    SERVICE_ID_SELECTED = input()
    services_query = cursor.execute('SELECT name FROM services WHERE service_id = %s', SERVICE_ID_SELECTED)
    try:
        service = cursor.fetchone()[0]
    except:
        service = None

    # Si el servicio solicitado no se encuentra presente, se muestra por pantalla
    if service is None:
        print("\nI could not find that service. What would you like today?")

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