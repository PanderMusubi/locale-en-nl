for i in `find glibc -type f -executable -print|grep -v '\.git/'|grep -v '\.sh$'|grep -v '\.ksh$'|grep -v '\.py$'|grep -v '\.pl$'|grep -v 'scripts/'|grep -v 'configure$'|grep -v 'timezone/yearistype'`; do
	ls -l $i
done
