# PostgreSQL projects

En este repositorio se recopilan los `dumps` de las bases de datos desarrolladas en `SQL` de los proyectos NO guiados de `freeCodeCamp`. 


Las bases de datos se han desarrollado usando un `contenedor` de `Docker` con una imagen de `PostgreSQL`, y constan de una serie de requisitos que el usuario debe cumplir sin ningún tipo de ayuda para superar el desafío y completar los proyectos.

------------

#### Resumen:
- **celestial-bodies-database**: En este proyecto se construye una base de datos de cuerpos celestiales con varias tablas, cada una de las cuales tiene información sobre un conjunto en específico del universo (galaxias, planetas, estrellas, etc). La creación de la estructura y la adición de valores se realiza exclusivamente con `SQL`.


- **salon-appointment-scheduler**: En este ocasión, se realiza una base de datos de un salón de citas. Primero se crea manualmente con `SQL` la estructura y las tablas de la base de datos, y posteriormente, mediante un `script` de `Python` se automatiza la inserción de nombres de clientes, números de teléfono y horas de todas las citas en las tablas de la base de datos dependiendo de lo que el usuario responda por pantalla a las preguntas que realiza el `script`.


- **world-cup-database**: En este proyecto se crea una base de datos de los mundiales de fútbol de la `FIFA` con `SQL`. Posteriormente, mediante un `script` de `Python`, se automatiza la inserción de valores en las dos tablas creadas usando un archivo `.csv` con toda la información de los partidos. Por último, se realizan varias consultas en la base de datos con otro `script` en `Python` para responder a las preguntas propuestas.
