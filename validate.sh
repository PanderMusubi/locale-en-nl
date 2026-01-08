#!/usr/bin/env sh

if [ ! -d zaf-code ]; then
    svn checkout --depth empty svn://svn.code.sf.net/p/zaf/code/trunk zaf-code
    svn update --set-depth infinity zaf-code/locale
    sed -i 's/!\/bin\/sh/!\/bin\/bash/' zaf-code/locale/errors
    sed -i 's/!\/bin\/sh/!\/bin\/bash/' zaf-code/locale/definition
    sed -i 's/get_locale_data field $locale\.utf8$//' zaf-code/locale/definition
    sed -i 's/echo "A calander/exit\necho "A calander/' zaf-code/locale/check-dates
fi

zaf-code/locale/errors en_NL
if [ -e /usr/share/i18n/locales/en_NL ]; then
    zaf-code/locale/definition en_NL.utf8 > en_NL.txt
    zaf-code/locale/check-dates en_NL >> en_NL.txt
    zaf-code/locale/check-numbers en_NL >> en_NL.txt
else
    echo "Please, install en_NL to /usr/share/i18n/locales with add.sh"
fi

zaf-code/locale/definition en_US.utf8 > en_US.txt
zaf-code/locale/check-dates en_US >> en_US.txt
zaf-code/locale/check-numbers en_US >> en_US.txt

zaf-code/locale/definition nl_NL.utf8 > nl_NL.txt
zaf-code/locale/check-dates nl_NL >> nl_NL.txt
zaf-code/locale/check-numbers nl_NL >> nl_NL.txt

