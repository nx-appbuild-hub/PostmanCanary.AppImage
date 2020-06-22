SOURCE="https://dl.pstmn.io/download/channel/canary/linux_64"
DESTINATION="build.tar.gz"
OUTPUT="PostmanCanary.AppImage"
PWD=$(shell pwd)

all:
	echo "Building: $(OUTPUT)"
	wget --output-document=$(DESTINATION) --continue $(SOURCE)
	
	mkdir -p build
	tar -xvf build.tar.gz -C build
	
	mkdir -p AppDir/application
	
	cp -r build/PostmanCanary/app/* AppDir/application
	
	chmod +x AppDir/AppRun
	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(OUTPUT)
	chmod +x $(OUTPUT)
	
	rm -rf build.tar.gz
	rm -rf AppDir/application
	rm -rf build
