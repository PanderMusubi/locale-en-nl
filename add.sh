#!/usr/bin/sh

# This will add the locale en_NL.

if [ `id -u` -ne 0 ]; then
    echo "ERROR: Please run this script as root"
    exit 1
fi

# add locale
cp -f en_NL /usr/share/i18n/locales/

# register locale
if [ `grep ^en_NL /etc/locale.gen|wc -l` -eq 0 ]; then
    echo "en_NL.UTF-8 UTF-8" >> /etc/locale.gen
fi

# regenerate locales
locale-gen

# list locale
locale -a|grep en_NL
