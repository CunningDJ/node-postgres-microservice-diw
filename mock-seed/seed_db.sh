#!/usr/bin/env bash

## This will seed mock data into the database.

# Directory of this script
sd=`dirname $0`

POSTGRES_USERNAME=postgres
DB_NAME=node_postgres_microservice_db

echo "Seeding Database with Mock Data."

export PGPASSWORD
printf "Enter password: "
read -s PGPASSWORD

echo "Seeding user_profile..."
psql -U $POSTGRES_USERNAME -b $DB_NAME -f $sd/seed__user_profile.sql

echo "Seeding article..."
psql -U $POSTGRES_USERNAME -b $DB_NAME -f $sd/seed__article.sql

echo "Done."
