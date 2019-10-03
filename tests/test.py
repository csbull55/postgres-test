"""
9/19/19

Christian Bull

python = 3,6.8

this will be a test file for the psycopg2 lib for postgres
note that this lib only supports up to python 3.6, so make sure
to run the scripts using that version
"""

import psycopg2
from auth import auth

# creates a db connection
try:
    conn = psycopg2.connect("dbname=dvdrental user=postgres host=localhost password={}".format(auth()))

    # opens a cursor so execute db commands
    cur = conn.cursor()

    print('connected')
except:
    print('Unable to connect :(')

# executes command, this is a basic test
# cur.execute("""SELECT * from language""")

# this reads the query from a file
cur.execute(open("./scripts/test.sql", "r").read())


# throws the results of the query into the rows var
rows = cur.fetchall()

# creates list of rows
query = [row for row in rows]

print(query)
