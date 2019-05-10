if [ -e glibc ]; then
	cd glibc
	git reset --hard HEAD
	git pull -r
	cd ..
else
	git clone git://sourceware.org/git/glibc.git
fi
