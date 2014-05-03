#!/bin/bash

source_dir=${1?need the installation directory, like /usr/local/Trolltech/Qt-4.8.6}
version=${2?need the qt version, like 4.8.6}
platform=${3?name of the platform we are installing for. Should be specific, like os-10.9}

[ -d etc/sublime-text ] || { echo "CWD must be the root of bdep-oss" && exit 2; }

echo "commencing copy operation - check return value of script to be sure it finished without error"
qt_dir=lib/qt/$version/$platform
mkdir -p $qt_dir || exit $?

echo "copying files ... "
cp -Rv $source_dir/lib $qt_dir || exit $?

echo "cleaning up ... "
rm -Rfv $qt_dir/lib/pkgconfig $qt_dir/lib/*debug* $qt_dir/lib/*.la $qt_dir/lib/*.prl $qt_dir/lib/*.a

echo "installation finished to $qt_dir"
