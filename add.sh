#!/usr/bin/sh

# This will add the locale en_NL.

if [ `id -u` -ne 0 ]; then
    echo "ERROR: Must be runned as root"
    exit 1
fi

# add locale
if [ -d /usr/share/i18n/ ]; then
    cp -f en_NL /usr/share/i18n/locales/
else
    echo "ERROR: No /usr/share/i18n/ directory, install glibc-i18ndata"
    exit 1
fi

# register locale
if [ -f /etc/locale.gen ]; then
    if [ `grep ^en_NL /etc/locale.gen|wc -l` -eq 0 ]; then
        echo "en_NL.UTF-8 UTF-8" >> /etc/locale.gen
    fi

    # regenerate locales
    locale-gen

elif [ -x /usr/bin/localedef ]; then
    /usr/bin/localedef -f UTF-8 -i en_NL en_NL.UTF-8
else
    echo "ERROR: Do not know how to register locale"
    exit 1
fi

# list locale
locale -a|grep en_NL
