#!/usr/bin/env bash

VAGRANT_INJECT="/etc/profile.d/vagrant_inject.sh"

if [ -e "$VAGRANT_INJECT" ]
then
  rm -rf $VAGRANT_INJECT
  unset GETPHP54
  unset GETRVM
  unset GETPIP
fi

if [ "$1" = "yes" ]
then
  echo "export GETPHP54='yes'" >> $VAGRANT_INJECT
  PHP54=yes
else
  echo "export GETPHP54='no'" >> $VAGRANT_INJECT
  PHP54=no
fi

if [ "$2" = "yes" ]
then
  echo "export GETRVM='yes'" >> $VAGRANT_INJECT
  RVM=yes
else
  echo "export GETRVM='no'" >> $VAGRANT_INJECT
  RVM=no
fi

if [ "$3" = "yes" ]
then
  echo "export GETPIP='yes'" >> $VAGRANT_INJECT
  PIP=yes
else
  echo "export GETPIP='no'" >> $VAGRANT_INJECT
  PIP=no
fi

echo "Installing PHP 5.4: $PHP54"
echo "Installing RVM: $RVM"
echo "Installing PIP: $PIP"
