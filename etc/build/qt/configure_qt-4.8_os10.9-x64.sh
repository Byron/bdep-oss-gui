#!/bin/bash
# This file is to be executed in the root of the qt4 source directory to configure the project
# correctly for what we need in osx

[ -x ./configure ] || { echo "must be in qt source directory" && exit 2; }

echo "configuring qt"
if [ `uname` = Darwin ]; then
	add_args="-no-framework"
fi
./configure $add_args -arch x86_64 -no-rpath  -largefile -system-proxies -fast -shared -opensource -nomake examples -nomake demos -nomake docs -no-qt3support -release || exit $?

echo "--> Now build and install using the following commands"
echo make -j8 || exit $?
echo sudo make install || exit $?
echo 
echo "next step is to cd into the bdep-oss root and run the install script"