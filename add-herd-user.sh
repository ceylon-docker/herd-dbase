#!/bin/bash

set -e

if [ $# -lt 5 ]
then
    echo "Usage: add-herd-user <UserName> <FirstName> <LastName> <EMail> <BCryptHashedPassword> [<IsAdmin:true/false>] [<DBHost>] [<DBPort>"
    exit
fi

USER=$1
FIRST=$2
LAST=$3
EMAIL=$4
HASH=$5

ADMIN=$6
ADMIN=${ADMIN:-false}

DB=$7
DB=${DB:-localhost}

PORT=$8
PORT=${PORT:-5432}o

SQL="INSERT INTO user_table (id, email, firstname, admin, lastname, isbcrypt, password, status, username) VALUES ((select nextval('hibernate_sequence')), '${EMAIL}', '${FIRST}', ${ADMIN}, '${LAST}', true, '${HASH}', 'REGISTERED', '${USER}');"
psql -qt -h ${DB} -p ${PORT} -U ceylon-herd -c "${SQL}"

echo "Created user ${USER}"

