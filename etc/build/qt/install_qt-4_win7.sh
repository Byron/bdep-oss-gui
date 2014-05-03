#!/bin/bash

# NEEDS MSYSGW or any cygwin
# A git bash will do just fine
# Download installers
version=${1?the name of the version, like '4.8.4', that we are to download and install}
platform=${2?the platform name, as precise as possible, like windows-7_x86-64_vs2008}

[ -d etc/sublime-text ] || { echo "CWD must be the root of bdep-oss" && exit 2; }

compiler=${platform##*_}

[[ -z "$compiler" || "$compiler" = "$platform" ]] && { echo "couldn't parse compiler from $platform, should be version_*_compiler" && exit 2; }

inet_url=https://qt-msvc-installer.googlecode.com/files
inet_basename=qt-win64-opensource-$version-noqt3-$compiler

installer=$inet_basename.exe

if [ ! -f $installer ]; then
	for suffix in .exe '-1.bin' '-2.bin'; do
		filename=${inet_basename}${suffix}
		url=$inet_url/$filename
		echo "you may remove file $filename once you have installed QT"
		echo "downloading $url"
		curl $url -f > $filename || { rm $filename; exit 22; }
	done
fi

source_dir="/c/Qt/${version}_x64"

if [ -d $source_dir ]; then
	echo "Skipping installation as $source_dir exists"
else
	echo "install qt, just temporarily and to the default location, to take out what we need later"
	$installer || exit $?
fi

# now perform the copy
qt_dir=lib/qt/$version/$platform
mkdir -p $qt_dir || exit $?




echo "copying files ... "
libdir=$qt_dir/lib
mkdir $libdir
cp -Rv $source_dir/bin/*.dll $libdir || exit $?

echo "installation finished to $qt_dir"
