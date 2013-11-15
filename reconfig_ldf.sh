#! /bin/bash

#### reconfig_ldf.sh
#### [...]/reconfig_ldf.sh

#### Created by Laurence D. Finston (LDF) Wed Nov 13 12:34:04 CET 2013
#### Copied from 'reconfig.sh'.  This version contains site-specific code
#### for my PC.  LDF 2013.11.13.

#### Usage:  reconfig_ldf.sh [ARG_0 [ARG_1]]
####
#### Arguments:
####             ARG_0:  If 0, build shared libraries.  Otherwise, don't build shared libraries.
####             ARG_1:  If present, call 'make' after 'configure'.

if test $# -gt 0 
then
   if test $1 -ne 0 
   then
      echo "Not building shared libraries"
      CONF_STATIC="--disable-shared " 
   else
      echo "Building shared libraries"
   fi
   else
      echo "Building shared libraries"
fi

#### This is for use on 'pcfinston', in order to be able to compile with GCC 4.8.2.
#### LDF 2013.11.10.
####
#### configure CXX=/home/lfinsto/gcc-4.8.2/bin/g++ LDFLAGS="-L/home/lfinsto/gcc-4.8.2/lib64/../lib64" \
#####    --prefix=`pwd` $CONF_STATIC LIBS="-lgsl -lgslcblas -lm"

LIBRARY_FLAGS="-L/home/lfinsto/glibc-install/lib64 "
LIBRARY_FLAGS+="-L/home/lfinsto/glibc-install/lib -L/home/lfinsto/gcc-4.8.2/lib64/../lib64" 

configure $CONF_STATIC CPPFLAGS="-I/home/lfinsto/glibc-install/include" \
   LDFLAGS="$LIBRARY_FLAGS" --prefix=`pwd` $CONF_STATIC LIBS="-lgsl -lgslcblas -lm"

#configure --prefix=`pwd` $CONF_STATIC LIBS="-lgsl -lgslcblas -lm"

if test $# -gt 1
then
   echo "Calling make"
   make

   if test $1 -ne 0 
   then
      echo "Did not build shared libraries"
   else
      echo "Built shared libraries"
   fi
elif test $# -gt 0 
then
   if test $1 -ne 0 
   then
      echo "Not building  shared libraries"
   else
      echo "Building shared libraries"
   fi
   else
      echo "Building shared libraries"
fi

exit 0
