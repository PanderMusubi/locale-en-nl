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

# list locale
locale -a|grep en_NL
