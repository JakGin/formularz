# Backend

- On
- To .env file add the following:
  DATABASE_URL="postgresql://postgres:password@localhost:5432/mydb?schema=public"

# DB commands

1. psql -d postgres -U postgres   --- connect to database postgres as a postgres (admin) 
2. \du                            --- list all databases
3. \c <db_name>                   --- connect to database
4. \d                             --- list all tables and sequences in a database