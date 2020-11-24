# Copyright 2020 Alex Woroschilow (alex.woroschilow@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
PWD:=$(shell pwd)

# OUTPUT="LyX.AppImage"

all: clean
	mkdir --parents $(PWD)/build
	mkdir --parents $(PWD)/build/AppDir

	wget --output-document=$(PWD)/build/build.rpm https://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/l/lyx-2.2.3-1.el7.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm https://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/l/lyx-common-2.2.3-1.el7.noarch.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/hunspell-1.6.2-1.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/aspell-0.60.6.1-21.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/mythes-1.2.4-9.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/enchant-1.6.0-21.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/7/os/x86_64/Packages/qt-x11-4.8.7-8.el7.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/7/os/x86_64/Packages/qt-4.8.7-8.el7.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/7/os/x86_64/Packages/libpng-1.5.13-8.el7.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/7/os/x86_64/Packages/boost-regex-1.53.0-28.el7.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/7/os/x86_64/Packages/boost-signals-1.53.0-28.el7.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/7/os/x86_64/Packages/hunspell-1.3.2-16.el7.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/7/os/x86_64/Packages/libicu-50.2-4.el7_7.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/7/os/x86_64/Packages/texlive-collection-latexrecommended-svn25795.0-45.20130427_r30134.el7.noarch.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..




	cp --force --recursive $(PWD)/build/usr/* $(PWD)/build/AppDir/
	cp --force --recursive $(PWD)/AppDir/* $(PWD)/build/AppDir


	chmod +x $(PWD)/build/AppDir/AppRun
	chmod +x $(PWD)/build/AppDir/*.desktop

	export ARCH=x86_64 && $(PWD)/bin/appimagetool.AppImage $(PWD)/build/AppDir $(PWD)/LyX.AppImage
	chmod +x $(PWD)/LyX.AppImage

clean:
	rm -rf $(PWD)/build


