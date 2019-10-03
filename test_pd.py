"""
9/19/19

Christian Bull

python = 3,6.8

this will be a test file for the psycopg2 lib for postgres
note that this lib only supports up to python 3.6, so make sure
to run the scripts using that version
testing pandas functionality
"""

import pandas as pd
import psycopg2
from auth import auth

# creates a db connection
try:
    conn = psycopg2.connect("dbname=dvdrental user=postgres host=localhost password={}".format(auth()))

    print('connected')

except:
    pass

# creates a df off sql query and connection
# df = pd.read_sql_query('SELECT * FROM country', con=conn)

# this will read from a file
df = pd.read_sql((open("./scripts/test.sql", "r").read()), con=conn)

print(df.head())

# exports that df to a csv
df.to_csv(path_or_buf='../test_csv.csv')
