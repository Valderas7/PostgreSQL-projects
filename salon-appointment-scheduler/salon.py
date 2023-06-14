# Librerías
import pandas as pd
import psycopg2

# Conexión con la base de datos
conn = psycopg2.connect(database = "salon",
                        host = "127.0.0.1",
                        user = "valderas",
                        password = "********",
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

    # Si se encuentra el servicio se guarda en la variable, y si no se encuentra, la variable vale 'None
    try:
        service = cursor.fetchone()[0]
    except:
        service = None

    # Si el servicio solicitado no se encuentra presente, se muestra por pantalla el mensaje de error y se
    # imprime de nuevo el menú
    if service is None:
        print("\nI could not find that service. What would you like today?")

    # En caso contrario, el servicio solicitado SÍ está disponible, y por tanto, se pregunta por el número de
    # teléfono y se consulta la tabla 'customers' de la base de datos para encontrar el ID del cliente con
    # dicho número de teléfono
    else:
        print("\nWhat's your phone number?")
        CUSTOMER_PHONE = input()
        id_query = cursor.execute('SELECT customer_id FROM customers WHERE phone = %s', (CUSTOMER_PHONE, ))

        # Si se encuentra el ID se guarda en la variable, y si no se encuentra, la variable vale 'None'
        try:
            id_customer = cursor.fetchone()[0]
        except:
            id_customer = None

        # Si no se encuentra ID del cliente una vez el teléfono es dado, se muestra por pantalla el mensaje de
        # error y se pregunta por el nombre al cliente, para insertar tanto el teléfono como el nombre del
        # nuevo cliente en la tabla 'customers' de la base de datos
        if id_customer is None:
            print("\nI don't have a record for that phone number, what's your name?")
            CUSTOMER_NAME = input()
            insert_name = cursor.execute('INSERT INTO customers (phone, name) VALUES (%s, %s)',
                                         (CUSTOMER_PHONE, CUSTOMER_NAME))

            # Se confirma la inserción de valores
            conn.commit()

            # Si la inserción del teléfono y el nombre han sido correctas, entonces se intenta consultar el ID
            # de nuevo en la base de datos
            if insert_name is None:
                id_query = cursor.execute('SELECT customer_id FROM customers WHERE phone = %s',
                                          (CUSTOMER_PHONE,))

                # Una vez se consulta el ID del nuevo cliente, se guarda en la variable de abajo
                id_customer = cursor.fetchone()[0]

                # Una vez reconocido el cliente se pregunta por la hora en la que se desea la cita y se
                # inserta en la tabla de 'appointments'
                print("\nWhat time would you like your {}, {}?".format(service, CUSTOMER_NAME))
                SERVICE_TIME = input()
                insert_appointment = cursor.execute('INSERT INTO appointments (customer_id, service_id, time) '
                                                    'VALUES (%s, %s, %s)', (id_customer, SERVICE_ID_SELECTED,
                                                                            SERVICE_TIME))

                # Se confirma la inserción de valores
                conn.commit()

                # Si la inserción de la cita ha sido correcta, entonces se muestra el mensaje de la cita por
                # pantalla
                if insert_appointment is None:
                    print("\nI have put you down for a {} at {}, {}.\n".format(service, SERVICE_TIME,
                                                                           CUSTOMER_NAME))

        # En este bucle, es que el 'ID' del cliente si se encontró al preguntar el teléfono. En este caso,
        # se consulta el nombre en la tabla 'customers' que coincide con el 'ID' del cliente
        else:
            query_name = cursor.execute('SELECT name FROM customers WHERE customer_id = %s',
                                          (id_customer,))

            # Una vez se consulta el nombre del cliente, se guarda en la variable de abajo
            CUSTOMER_NAME = cursor.fetchone()[0]

            # Una vez reconocido el cliente se pregunta por la hora en la que se desea la cita y se
            # inserta en la tabla de 'appointments'
            print("\nWhat time would you like your {}, {}?".format(service, CUSTOMER_NAME))
            SERVICE_TIME = input()
            insert_appointment = cursor.execute('INSERT INTO appointments (customer_id, service_id, time) '
                                                'VALUES (%s, %s, %s)', (id_customer, SERVICE_ID_SELECTED,
                                                                        SERVICE_TIME))

            # Se confirma la inserción de valores
            conn.commit()

            # Si la inserción de la cita ha sido correcta, entonces se muestra el mensaje de la cita por
            # pantalla
            if insert_appointment is None:
                print("\nI have put you down for a {} at {}, {}.\n".format(service, SERVICE_TIME,
                                                                         CUSTOMER_NAME))