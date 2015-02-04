#/bin/sh

# ------------------------------------------------------------------
# [Thomas Legris] Which Files Contain My Pattern ?
# Given a path and a pattern, search for that pattern and return corresponding files
# ------------------------------------------------------------------

VERSION=0.0.1
SUBJECT=WFCMP
USAGE="Usage: $0 path/ file_regex pattern [filter_program]"

# --------------------
if [ $# -eq 0 ] ; then
    echo $USAGE
    exit 1;
fi

if [ $# -eq 3 ] ; then
  4="cat"
fi

# --------------------
# Small header text
echo "Files $2 from $1 containing $3 through $4"

find $1 -type f -name "$2" | while read file ;
do
  if $4 $file | grep --quiet $3
    then 
    echo $file
  fi
done

exit 0
