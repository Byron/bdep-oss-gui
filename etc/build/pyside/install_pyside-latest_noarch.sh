#!/bin/bash

version=${1?:need the pyside version, like 1.2.2}
platform=${2?:name of the platform we are installing for. Should be specific, like os-10.9}

pip_dest=PySide

echo "This installer works by downloading the latest version, putting it locally, and installing the files we need"

[ -d etc/sublime-text ] || { echo "CWD must be the root of bdep-oss" && exit 2; }

pyside_dir=lib/pyside/$version/$platform
mkdir -p $pyside_dir || exit $?

if [ -d $pip_dest ]; then
	echo "Skipping download as '$pip_dest' exists already"
else
	pip-2.7 install -U PySide -t $pip_dest --use-wheel -f http://download.qt-project.org/official_releases/pyside || exit $?
fi

mv $pip_dest/* $pyside_dir
rmdir $pip_dest || exit $?

echo "cleaning up ... "
rm -Rfv $pyside_dir"/PySide/examples
rm -Rfv $pyside_dir"/PySide/include

echo "Files placed at $pyside_dir"