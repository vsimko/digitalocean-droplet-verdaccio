#!/bin/sh

echo "You are gonna add a new user to the verdaccio npm registry."
echo -n "Enter Username: "

until [ -n "$USERNAME" ]; do
    read USERNAME
done

CWD=`dirname "$0"`

DATA=$(printf "${USERNAME}:`openssl passwd -apr1`\n")
PWDHASH=$(echo $DATA | cut -d: -f 2)
[ -z "$PWDHASH" ] && exit 1

DATE=$(date -Iseconds)
echo "$DATA:added by $USER on $DATE" >> "$CWD/htpasswd"

echo
echo "User '$USERNAME' created successfully in:" $(realpath "$CWD/htpasswd")
echo