locale-en-nl
============

English language locale for the Netherlands (en_NL)


Introduction
------------

Many users who are physically located in the Netherlands use software in the
American English language. Most of them are native Dutch speakers working in IT,
but this also applies for non-Dutch expats in the Netherlands. For their work
they usually have their systems configured to US English International. However,
due to the geographic location or territory, it can be highly desirable for
certain data to be represented according to the local Dutch notation, while the
rest remains in English.

It is possible to configure a system by setting a mix of LC sections of
different locales. For example the LC\_MONETARY of en\_US and LC\_TIME of
nl\_NL. However, it is not possible to mix on section level only to get a proper
locale with English language in the Netherlands territory. This requires a
custom locale to correctly set fields in the sections LC\_MONETARY, LC\_TIME and
LC\_ADDRESS.

For this reason the locale called en\_NL has been created. It is based on the
locale en\_US and has some carefully mixed parts from nl\_NL. Note that this
specific configuration is impossible to obtain by using locale nl\_NL and
setting LANGUAGES to en or other mixed LC section usage. This justifies an
en\_NL locace and having it supported by glibc.

Please, see comments starting with "%% use" in the file en_NL how each section
has been composed. For more comprehensible comparison, see the section on
validation below.

If you support the inclusion of en\_NL in glibc, please endorse it at
https://sourceware.org/bugzilla/show_bug.cgi?id=14085


Installation
------------

Install the locale en\_NL with `./install.sh` or running the command from that
script manually.


Validation
----------

Examine the generated TXT-files with `fldiff nl_NL.txt en_NL.txt` and
`fldiff en_US.txt en_NL.txt` In the directory [comparison](comparison) are
screenshots of these colored diffs.

These files have been generated with the `./validate.sh` script after
installation.


Sources
-------

* [Glibc bug 14085](https://sourceware.org/bugzilla/show_bug.cgi?id=14085)
* [Glibc locales](http://sourceware.org/git/?p=glibc.git;a=tree;f=localedata/locales;hb=HEAD)
* [Glibc locale en_US](https://sourceware.org/git/?p=glibc.git;a=blob_plain;f=localedata/locales/nl_NL;hb=HEAD)
* [Glibc locale nl_NL](https://sourceware.org/git/?p=glibc.git;a=blob_plain;f=localedata/locales/en_US;hb=HEAD)
* [Locale validation tools](https://sourceforge.net/projects/zaf/)
* [Documentation strftime for Linux](https://secure.php.net/manual/en/function.strftime.php)
* [Documentation strftime for Linux](http://www.cplusplus.com/reference/ctime/strftime/)
* [Documentation strftime for Linux](http://man7.org/linux/man-pages/man3/strftime.3.html)


To do for other locales
-----------------------

The following minor improvemens for others locales that still need to be done are:
* add after the line with `name_fmt` the line `name_gen    ""` to all en\_US and nl\_NL locales
* add `mr    "dhr."`, `mrs    "mevr."`, `miss    "mevr."`, `ms    "mevr."` to nl\_NL locale
* replace `int_select` in nl\_NL locale from `""` to `"+"`
* replace `tel_dom_fmt` in nl\_NL locale from `""` to `"0%a-%l"`
* replace in bs\_BA `tel_int-fmt` with `tel_int_fmt`

