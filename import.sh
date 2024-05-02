#!/bin/bash

HOST="localhost"
PORT="27017"
USERNAME="esspee"
PASSWORD=""
DB_NAME="bigdata_project"

CSV_DIR="/root/BDT+T/food_CSVs"

for file in $CSV_DIR/*.csv; do
    filename=$(basename -- "$file")
    filename_no_ext="${filename%.*}"
    mongoimport --host $HOST --port $PORT --username $USERNAME --password $PASSWORD --db $DB_NAME --authenticationDatabase=admin --collection $filename_no_ext --type csv --headerline --file "$file"
    echo "Imported $file"
done
