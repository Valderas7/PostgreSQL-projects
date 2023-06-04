# Librerías
import psycopg2

# Conexión con la base de datos
conn = psycopg2.connect(database = "worldcup",
                        host = "127.0.0.1",
                        user = "valderas",
                        password = "********",
                        port = "5432")

# Ejecutar consultas en la base de datos conectada
cursor = conn.cursor()

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo

echo -e "\nAverage number of goals in all games from the winning teams:"
echo

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo

echo -e "\nAverage number of goals in all games from both teams:"
echo

echo -e "\nMost goals scored in a single game by one team:"
echo

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo

echo -e "\nWinner of the 2018 tournament team name:"
echo