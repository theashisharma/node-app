#!/bin/bash

# Start PostgreSQL service
service postgresql start

# Define database, user, and password
POSTGRES_DB="testdb"
POSTGRES_USER="postgres"
POSTGRES_PASSWORD="123"

# Change the password for the postgres user
psql -U postgres -c "ALTER USER postgres WITH PASSWORD '123';"

# Check if the database exists, and create it if it doesn't
if ! psql -U postgres -lqt | cut -d \| -f 1 | grep -qw $POSTGRES_DB; then
    psql -U postgres -c "CREATE DATABASE $POSTGRES_DB;"
fi

# Create the user if it doesn't exist
if ! psql -U postgres -t -c "\du" | cut -d \| -f 1 | grep -qw $POSTGRES_USER; then
    psql -U postgres -c "CREATE USER $POSTGRES_USER WITH PASSWORD '$POSTGRES_PASSWORD';"
fi

# Grant all privileges on the database to the user
psql -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE $POSTGRES_DB TO $POSTGRES_USER;"