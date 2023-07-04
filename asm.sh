#!/bin/bash
DIR=$1

rm ./bin/*

if [ "$1" = "" ]
then
  echo "Usage: $0 <DIRECTORY REQUIRED>"
  exit
fi

for FILE in $DIR/*.o; do
  f=$(basename -- "$FILE")
  f=(${f%.o})
  llvm-objdump-15 -d $FILE > "./bin/$f.s"
done

for FILE in ./bin/*.s; do
  python3 parse_asm.py \
    $FILE
done

python3 acum_asm.py \
  "./bin/all.txt"
