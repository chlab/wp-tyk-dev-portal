#!/bin/bash

TMP_STAGING=".tmp_staging"

function cleanup {
    # delete temporary copy of staging area
    rm -rf $TMP_STAGING
}

trap "cleanup" EXIT


FILENAME=$0
if [ -h $FILENAME ] ; then
    FILENAME=`readlink -e $FILENAME`
fi
DIR=`dirname $FILENAME`

# stolen from template file
if git rev-parse --verify HEAD >/dev/null
then
    against=HEAD
else
    # Initial commit: diff against an empty tree object
    against=78ddbc21cc3256effcb93b2743ceab459277e44b
fi

# this is the magic: 
# retrieve all files in staging area that are added, modified or renamed
# but no deletions etc
FILES=$(git diff-index --name-only --cached --diff-filter=ACMR $against -- )

if [ "$FILES" == "" ]; then
    exit 0
fi

# create temporary copy of staging area
if [ -e $TMP_STAGING ]; then
    rm -rf $TMP_STAGING
fi
mkdir $TMP_STAGING

# match files against whitelist
FILES_TO_CHECK=""
for FILE in $FILES
do
    echo "$FILE" | egrep -q "\.php"
    RETVAL=$?
    if [ "$RETVAL" -eq "0" ]
    then
        FILES_TO_CHECK="$FILES_TO_CHECK $FILE"
    fi
done

if [ "$FILES_TO_CHECK" == "" ]; then
    exit 0
fi

# Copy contents of staged version of files to temporary staging area
# because we only want the staged version that will be commited and not
# the version in the working directory
STAGED_FILES=""
for FILE in $FILES_TO_CHECK
do
  ID=$(git diff-index --cached $against $FILE | cut -d " " -f4)

  # create staged version of file in temporary staging area with the same
  # path as the original file so that the phpcs ignore filters can be applied
  mkdir -p "$TMP_STAGING/$(dirname $FILE)"
  git cat-file blob $ID > "$TMP_STAGING/$FILE"
  STAGED_FILES="$STAGED_FILES $TMP_STAGING/$FILE"
done

$DIR/phpcodesniffer.sh $STAGED_FILES
exit_code=$?

exit $exit_code
