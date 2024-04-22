#!/usr/bin/sh

# This will add the locale en_NL.

if [ `id -u` -ne 0 ]; then
    echo "ERROR: Please run this script as root"
    exit 1
fi

# add locale
if [ -d /usr/share/i18n/locales/ ]; then
    cp -f en_NL /usr/share/i18n/locales/
else
    echo "ERROR: No /usr/share/i18n/locales/ directory, install package locales or glibc-i18ndata"
    exit 1
fi

# register locale
if [ -f /etc/locale.gen ]; then
    if [ `grep ^en_NL /etc/locale.gen|wc -l` -eq 0 ]; then
        echo "en_NL.UTF-8 UTF-8" >> /etc/locale.gen
    fi

    # regenerate locales
    locale-gen

# update Xlib database (see https://xyne.dev/projects/locale-en_xx/#usage)
file=/usr/share/X11/locale/locale.dir
if [ -f $file ] && [ `grep en_NL $file|wc -l` -eq 0 ]; then
    echo >> $file
    echo "en_US.UTF-8/XLC_LOCALE en_NL.UTF-8" >> $file
    echo "en_US.UTF-8/XLC_LOCALE: en_NL.UTF-8" >> $file
fi
file=/usr/share/X11/locale/compose.dir
if [ -f $file ] && [ `grep en_NL $file|wc -l` -eq 0 ]; then
    echo >> $file
    echo "en_US.UTF-8/Compose en_NL.UTF-8" >> $file
    echo "en_US.UTF-8/Compose: en_NL.UTF-8" >> $file
fi

# regenerate locales
locale-gen
#TODO where to use the following lines?
#elif [ -x /usr/bin/localedef ]; then
#    /usr/bin/localedef -f UTF-8 -i en_NL en_NL.UTF-8
#else
#    echo "ERROR: Do not know how to register locale"
#    exit 1
#fi

# list locale
locale -a|grep en_NL
