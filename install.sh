#!/usr/bin/env sh

if [ "$EUID" -ne 0 ]
    then echo "ERROR: Please run this script as root"
    exit
fi

# Copy English locale for the Netherlands
cp -f en_NL /usr/share/i18n/locales/

# Register English locale for the Netherlands
if [ `grep ^en_NL /etc/locale.gen|wc -l` -eq 0 ]
then
    echo "en_NL.UTF-8 UTF-8" >> /etc/locale.gen
fi

# Regenerate locales
locale-gen

# List English locale for the Netherlands
locale -a|grep en_NL
