# locale-en-nl

English language locale for the Netherlands (en_NL)

## 1 Introduction

Many users who are physically located in the Netherlands use software in the American English language. Most of them are native Dutch speakers working in IT, but this also applies for non-Dutch expats in the Netherlands. In their work they usually have their systems configured to US English International. However, due to the geographic location or territory they reside in, it can be highly desirable for certain data to be represented according to the local Dutch notation, while the rest remains in English.

It is possible to configure a system by setting a mix of LC sections of different locales, which are part of [glibc](https://sourceware.org/glibc/). For example the `LC_MONETARY` of `en_US` and `LC_TIME` of `nl_NL`. Nevertheless, it is not possible to mix on section level only to get a proper locale with English language in the Netherlands territory. This requires a custom locale to correctly set fields in the sections `LC_MONETARY`, `LC_TIME` and `LC_ADDRESS`.

For this reason the locale called [`en_NL`](en_NL) has been created. It is based on the locale [`en_US`](https://sourceware.org/git/?p=glibc.git;a=blob;f=localedata/locales/en_US) and has some carefully mixed parts from [`nl_NL`](https://sourceware.org/git/?p=glibc.git;a=blob;f=localedata/locales/nl_NL). Note that this specific configuration is impossible to obtain by using locale `nl_NL` and setting `LANGUAGES` to en or other mixed LC section usage. This justifies an `en_NL` locale.

## 2 Implementation

Each section of `en_NL` has been documented how it was composed. The comment indicating that can be one of:
- `% From en_US`
- `% From nl_NL`
- `% Custom en_NL`

For a more comprehensible comparison, see the section on validation below.

## 3 Installation

As `en_NL` is not yet included in glibc, there are two ways of installing the locale.

### 3.1 Overwrite

TODO

### 3.2 Add

TODO

Install the locale en\_NL with `./add.sh` or running the commands from that
script manually. This script supports Debian/Ubuntu, Fedora/Red Hat and OpenSUSE.

### Note: LC_CTYPE needs further intervention

The `LC_CTYPE` provided by this locale is identical to that provided by `en_US.UTF-8`.
Nevertheless, further intervention is required to get everything to work smoothly
([source](https://xyne.dev/projects/locale-en_xx/#usage)).
There are two approaches:
either explicitly set `LC_CTYPE=en_US.UTF-8` in `/etc/locale.conf`,
or modify the Xlib database (which is what `add.sh` does, if this database exists).

TODO

    sudo dnf install glibc-locale-source
    # inside the top-level directory of the `locale-en-nl` repository
    sudo localedef --no-archive --inputfile=en_NL --charmap=UTF-8 en_NL.UTF-8

The compiled locale files can be found in `/usr/lib/locale/en_NL.utf8/`.

## 4 Validation

Examine the generated TXT files with:
    fldiff nl_NL.txt en_NL.txt
    fldiff en_US.txt en_NL.txt

In the directory [comparison](comparison) are screenshots of these colored diffs.

These files have been generated with the `./validate.sh` script after installation.

## Commands

List the locales contained in the locale archive file.

    localedef --list-archive

Show current settings of the system locale and keyboard mapping.

    localectl status

List available locales useful for configuration with set-locale.

    localectl list-locales

More details can be viewed with:

    cat /etc/default/locale
    more /etc/locale.gen
    more /etc/locale.alias

## 5 Resources

The following documentation, sources and tools been used:
- [glibc locale `en_US`](https://sourceware.org/git/?p=glibc.git;a=blob;f=localedata/locales/en_US)
- [glibc locale `nl_NL`](https://sourceware.org/git/?p=glibc.git;a=blob;f=localedata/locales/nl_NL)
- [Locale Helper `en_US`](https://lh.2xlibre.net/locale/en_US/)
- [Locale Helper `nl_NL`](https://lh.2xlibre.net/locale/nl_NL/)
- [South African localisations project](https://sourceforge.net/projects/zaf/)
- [cplusplus Reference strftime](https://www.cplusplus.com/reference/ctime/strftime/)
- [Linux manual pages strftime(3)](https://man7.org/linux/man-pages/man3/strftime.3.html)
- [Linux manual pages locale(1)](https://man7.org/linux/man-pages/man1/locale.1.html)
- [Linux manual pages locale(5)](https://man7.org/linux/man-pages/man5/locale.5.html)
- [Linux manual pages locale(7)](https://man7.org/linux/man-pages/man7/locale.7.html)
- [Linux manual pages localedef(1)](https://man7.org/linux/man-pages/man1/localedef.1.html)
- [Linux manual pages lovalectl(1)](https://man7.org/linux/man-pages/man1/localectl.1.html)
- [Linux manual pages locale.conf(5)](https://man7.org/linux/man-pages/man5/locale.conf.5.html)

See also:
- Presentation [NLUUG](https://nluug.nl) fall 2016 [English locale for the Netherlands (en_NL)](http://bit.ly/2gd1ZBu)
- [glibc bug 14085 - en_NL: new locale (English language for the Netherlands)](https://sourceware.org/bugzilla/show_bug.cgi?id=14085)
- [glibc bug 17823 - gdb CLI cannot recognize floating point numbers if LC_NUMERIC environment variable is set to nl_NL.UTF-8](https://sourceware.org/bugzilla/show_bug.cgi?id=17823)
- [glibc bug 22043 - *_NL: add country_isbn](https://sourceware.org/bugzilla/show_bug.cgi?id=22043)
- [glibc bug 22473 - Suggestion: Introduce en_EU locale](https://www.sourceware.org/bugzilla/show_bug.cgi?id=22473)
- [glibc bug 22535 - en_DE: New locale](https://www.sourceware.org/bugzilla/show_bug.cgi?id=22535)
- [glibc bug 23857 - Esperanto has no country ](https://www.sourceware.org/bugzilla/show_bug.cgi?id=23857)

## To do for other locales

The following minor improvements for others locales that still need to be done are:
- replace `tel_dom_fmt` in `nl_NL` locale from `""` to `"0%a-%l"`

