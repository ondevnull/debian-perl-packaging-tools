#!/bin/sh
#
# Author: Jose Luis Rivas <joseluis at rivco.net>
# Filename: install.sh
# Date: October 31, 2008, 22:39.
#

#
# Copyright (c) 2008 Jose Luis Rivas <joseluis at rivco.net>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#

help="
Installer for perl-packaging-tools. Installs a copy
of the binaries in ~/bin

Options:
-v\--version		Print version.
-h\--help		Print this help.
-i			Installs the binaries.
-u			Removes the binaries.

Last version downloadable from:
http://scm.rivco.net/p/perl-packaging-tools/
"

version="
Installer for perl-packaging-tools
Version: 0.01
Copyright 2008 Jose Luis Rivas <joseluis at rivco.net>
"

binlists="pp-build
pp-new
pp-upgrade
pp-orig"

installer() {
	echo "Checking if ~/bin is created"
	if [ ! -e $HOME/bin ]; then
		mkdir ~/bin
		echo "Created ~/bin..."
	else
		echo "~/bin exists! :D"
	fi
	echo "Starting to copy the files"
	for i in $binlists
	do
		echo "Copying $i..."
		cp ./$i ~/bin/$i
	done
	echo "Dude! You're done!"
}

uninstaller() {
	for i in $binlists
	do
		echo "Deleting $i..."
		rm ~/bin/$i
	done
	echo "Uninstalled!"
}


while test -n "$1"; do
	case $1 in
	-v|--version)	
		echo "$version"; exit 0;;
	-h|--help)	
		echo "$help"; exit 0;;
	-i)
		installer; exit 0;;
	-u)
		uninstaller; exit 0;;
	*)
		echo "$help"; exit 0;;
		
	esac
done

if test -z $1; then
	echo "$help"; exit 0
fi
