#!/bin/bash

sudo su

cp -f en_NL /usr/share/i18n/locales/

if [ `grep '^en_NL /etc/locale.gen'|wc -l` -eq 0 ]
then
    echo "en_NL.UTF-8 UTF-8" >> /etc/locale.gen
fi

locale-gen

exit

locale -a|grep en_NL
