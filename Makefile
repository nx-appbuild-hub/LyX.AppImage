SOURCE="http://ppa.launchpad.net/lyx-devel/daily/ubuntu/pool/main/l/lyx2.3pre/lyx2.3pre_2.3.0~rc2-1~artful~ppa1_amd64.deb"
DESTINATION="build.deb"
OUTPUT="LyX.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget --output-document=$(DESTINATION) --continue $(SOURCE)
	
	wget --output-document=hunspell.rpm --continue http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/hunspell-1.6.2-1.el8.x86_64.rpm
	wget --output-document=aspell.rpm --continue http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/aspell-0.60.6.1-21.el8.x86_64.rpm
	rpm2cpio hunspell.rpm | cpio -idmv
	rpm2cpio aspell.rpm | cpio -idmv

	dpkg -x $(DESTINATION) build
	rm -rf AppDir/application
	rm -rf AppDir/lib

	mkdir --parents AppDir/application
	mkdir --parents AppDir/lib
	cp -rf build/usr/bin/* AppDir/application
	cp -rf usr/bin/* AppDir/application
	cp -rf usr/lib64/* AppDir/lib

	

	chmod +x AppDir/AppRun

	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(OUTPUT)
	chmod +x $(OUTPUT)

	rm -f $(DESTINATION)
	rm -rf AppDir/application
	rm -rf AppDir/lib
	rm -rf build usr
