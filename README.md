# locale-en-nl #

English language locale for the Netherlands

Internationally oriented users who are physically located in the Netherlands
mainly use software in the English language. Usually they have their systems
configured to US English International. However, due to the geographic location,
it can be highly desirable for certain data to be represented according to the
local Dutch notation, while the rest remains in English.

For this reason the locale called en\_NL has been created. It is based on the
locale en\_US and has some carefully mixed parts from nl\_NL. Note that this
specific configuration is impossible to obtain by using locale nl\_NL and
setting LANGUAGES to en. The justification for offering en\_NL and having it
supported by glibc lies exactly in there.

Please see comments starting with "%% use" how each section has been composed.
For now, this is a temporary way to install this locale until it has been
adopted by glibc. See also https://sourceware.org/bugzilla/show_bug.cgi?id=14085
for more information on this. If you support inclusion of en\_NL in glibc,
please add a rationale to this bug report.

Specific details on how the file en\_NL has been composed can be found in its
comments.

Sources
http://sourceware.org/git/?p=glibc.git;a=tree;f=localedata/locales;hb=HEAD

Tools
http://zaf.svn.sourceforge.net/viewvc/zaf/trunk/locale/
