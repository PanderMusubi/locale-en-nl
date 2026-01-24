#!/usr/bin/sh

# This will add the locale en_NL.

if [ `id -u` -ne 0 ]; then
    echo "ERROR: Please run this script as root"
    exit 1
fi

# check locale
if [ -d /usr/share/i18n/locales/ ]; then
    cp -f en_NL /usr/share/i18n/locales/
else
    echo "ERROR: No /usr/share/i18n/locales/ directory, install package locales or glibc-i18ndata"
    exit 1
fi

# update Xlib database (see https://xyne.dev/projects/locale-en_xx/#usage)
for locale_file in \
    /usr/share/X11/locale/locale.dir \
    /usr/share/X11/locale/compose.dir
do
    if [[ -f $locale_file ]] && ! grep -q en_NL $locale_file; then
        # Take the lines with en_NZ and put before it the same line but with en_NL
        perl -i -p -e "s{^(.+?\s)en_NZ\.(.+)$}{\1en_NL.\2\n$&}" $locale_file
        echo "en_NL added to $locale_file"
    fi
done

# register locale
if [ -f /etc/locale.gen ]; then
    if [ `grep ^en_NL /etc/locale.gen|wc -l` -eq 0 ]; then
        echo "en_NL.UTF-8 UTF-8" >> /etc/locale.gen
    fi

    # regenerate locales
    locale-gen
elif [ -x /usr/bin/localedef ]; then
    # OpenSuse does not have locale-gen
    /usr/bin/localedef -f UTF-8 -i en_NL en_NL.UTF-8
else
    echo "ERROR: Do not know how to register locale"
    exit 1
fi

# list locale
locale -a|grep en_NL
