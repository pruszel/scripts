#!/bin/bash
##
 # backup MySQL databases in /var/backups
 # --------------------------------------------------------
 # can be to used to dump single database like so:
 #    $ backup-databases.sh -u 'root' -p 'password' -d 'database_name'
 # or, dump all databases (omit -d argument)
 #    $ backup-databases.sh -u 'root' -p 'password'
##
TIMESTAMP=`date +\%Y-\%m-\%d_\%H-\%M-\%S`

# Get database connection info from stdin
while getopts ":u:p:d:" opt; do
    case $opt in
        u) DBUSER="$OPTARG"
        ;;
        p) DBPASS="$OPTARG"
        ;;
        d) DATABASE="$OPTARG"
        ;;
        \?) echo "Invalid option -$OPTARG" >&2
        ;;
    esac
done

if [[ -z "$DBUSER" ]] || [[ -z "$DBPASS" ]]; then
  echo "cannot connect to database: username and password not specified."
  exit
fi

# check backups directory exists. if not, create it
DEST_DIR='/var/backups/db'
if [ ! -d "$DEST_DIR" ]; then
    mkdir -p $DEST_DIR;
fi

if [[ ! -z "$DATABASE" ]]; then
    mysqldump --opt --user=$DBUSER --password=$DBPASS --host=localhost --lock-tables=false --add-drop-table --databases $DATABASE > $DEST_DIR/$DATABASE.$TIMESTAMP.sql
else
    mysqldump --opt --user=$DBUSER --password=$DBPASS --host=localhost --lock-tables=false --add-drop-table --all-databases > $DEST_DIR/backup.$TIMESTAMP.sql
fi
