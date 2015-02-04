#/bin/sh

# ------------------------------------------------------------------
# [Thomas Legris] Sssh Import
# Import remote data contained in the list variable
# ------------------------------------------------------------------

VERSION=0.0.1
SUBJECT=SI
USAGE="Usage: $0 user ip pass path folder_list

# --------------------
if [ $# -eq 0 ] ; then
    echo $USAGE
    exit 1;
fi

for i in $5; 
do
  echo "Process $i"
  mkdir $i
  sshpass -p '$3' scp "$1@$2:/$i/$4" $i
done 
exit 0
