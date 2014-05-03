#!/bin/bash
# primarliy taken from here: https://github.com/PySide/pyside-setup#pyside-setup-script-command-line-options

version=${1?need the pyside version, like 1.2.2}
platform=${2?name of the platform we are installing for. Should be specific, like os-10.9}
qmake_path=${3?path to the qmake to tell pyside to which qt version to build against, like /usr/local/Trolltech/Qt-4.8.6/bin/qmake}
python=${4?the python executable to use}
pip_dest=pyside-setup-tmp

echo "This installer works by downloading the latest source, putting it locally, and installing the files we need"
echo "It will need cmake and git to work"
echo "BE SURE TO READ ABOUT PREREQUISITES ON https://github.com/PySide/pyside-setup"
echo "ON WINDOWS, YOU MUST BE IN A VC DEVELOPER SHELL"
# [ -d etc/sublime-text ] || { echo "CWD must be the root of bdep-oss" && exit 2; }
[ -x $qmake_path ] || { echo "qmake at $qmake_path is not executable" && exit 2; }

# make sure shiboken will work
ld_path=`dirname $qmake_path`/../lib
export DYLD_LIBRARY_PATH=$ld_path
# let's do all posix 
export LD_LIBRARY_PATH=$ld_path
# and ... yeah 
if [ -z "$HOMEDRIVE" ]; then
	dll_path=`dirname $qmake_path`/../bin
	export PATH=$PATH;$dll_path
fi

pyside_dir=lib/pyside/$version/$platform
mkdir -p $pyside_dir || exit $?

if [ -d $pip_dest ]; then
	echo "Skipping download as '$pip_dest' exists already"
else
	git clone https://github.com/PySide/pyside-setup.git $pip_dest || exit $?
fi

cd $pip_dest
# windows compat
if [ -z "$HOMEDRIVE" ]; then
	# can't use makeflags on windows as it uses this option too
	MAKEFLAGS='-j8'
fi
$python setup.py build --qmake=$qmake_path --version=$version || exit $?

source_dir=`echo pyside_install/*`
[ -d "$source_dir" ] || { echo "couldn't find installation dir at $source_dir" && exit 2; }

pyside_dir=../$pyside_dir
mv -v $source_dir/* $pyside_dir || exit $?

echo "cleaning up ..."
rm -Rfv $pyside_dir/include
rm -Rfv $pyside_dir/share
cd ..
rm -Rfv $pip_dest

if [ -n "$HOMEDRIVE" ]; then
	# on windows, or some reason, it doens't put the python version. It's a very good idea to do that !
	# WTF ?
	echo "Warning: untested - remove this message if it works"
	version=`$python --version`
	version=${version#* }
	pydir=$pyside_dir/lib/python$version	
	mkdir $pydir
	mv $pyside_dir/lib/site-packages $pydir
fi

echo "ON LINUX: move python2.x from lib64 into for the package to look as expected. We can consider leaving packages as they are, and make it work through our configuration"
echo "Files placed at $pyside_dir"