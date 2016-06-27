#!/bin/bash

libs=$HOME/.agda/libraries
libfile=`pwd`/criterion.agda-lib

if [ ! -f $libfile ]; then
  echo "Couldn't find $libfile. Make sure to run the install script from the"
  echo "directory with the criterion.agda-lib file."
elif [ ! -f $libs ]; then
  echo No library file found. Doing nothing.
elif (grep criterion.agda-lib $libs > /dev/null); then
  echo Seems to already be installed. Doing nothing.
else
  echo Adding $libfile to $libs
  echo $libfile >> $libs
fi

