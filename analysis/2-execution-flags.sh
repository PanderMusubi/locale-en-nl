for i in `find glibc -type f -executable -print|grep -v .git/|grep -v .sh$|grep -v .py$|grep -v .pl$|grep -v scripts/|grep -v configure$`; do
	ls -l $i
done
