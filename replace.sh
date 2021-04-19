#!/usr/bin/sh

# WARNING: This replaces en_US and influence all locales depending on it!

# replace locale
cp -f en_NL /usr/share/i18n/locales/en_US

# regenerate locales
locale-gen
