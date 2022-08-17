if [ $# -ne 1 ]; then
  echo "usage: ./build_lib.sh <CODE_SIGN_IDENTITY>"
  exit 1
fi

/Applications/CMake.app/Contents/bin/cmake -B libndi_ios/out/ios_arm/ -GXcode -DCMAKE_SYSTEM_NAME=iOS -DCMAKE_OSX_DEPLOYMENT_TARGET=10.0 -DCMAKE_INSTALL_PREFIX=`pwd`/_install -DCMAKE_XCODE_ATTRIBUTE_ONLY_ACTIVE_ARCH=NO -DCMAKE_IOS_INSTALL_COMBINED=YES -DCMAKE_OSX_ARCHITECTURES=armv7 -DCODE_SIGN_IDENTITY="$1"
/Applications/CMake.app/Contents/bin/cmake -B libndi_ios/out/ios_arm64/ -GXcode -DCMAKE_SYSTEM_NAME=iOS -DCMAKE_OSX_DEPLOYMENT_TARGET=10.0 -DCMAKE_INSTALL_PREFIX=`pwd`/_install -DCMAKE_XCODE_ATTRIBUTE_ONLY_ACTIVE_ARCH=NO -DCMAKE_IOS_INSTALL_COMBINED=YES -DCMAKE_OSX_ARCHITECTURES=arm64 -DCODE_SIGN_IDENTITY="$1"
/Applications/CMake.app/Contents/bin/cmake -B libndi_ios/out/iossimulator_arm64/ -GXcode -DCMAKE_SYSTEM_NAME=iOS -DCMAKE_OSX_DEPLOYMENT_TARGET=10.0 -DCMAKE_INSTALL_PREFIX=`pwd`/_install -DCMAKE_XCODE_ATTRIBUTE_ONLY_ACTIVE_ARCH=NO -DCMAKE_IOS_INSTALL_COMBINED=YES -DCMAKE_OSX_ARCHITECTURES=arm64
/Applications/CMake.app/Contents/bin/cmake -B libndi_ios/out/iossimulator_x64/ -GXcode -DCMAKE_SYSTEM_NAME=iOS -DCMAKE_OSX_DEPLOYMENT_TARGET=10.0 -DCMAKE_INSTALL_PREFIX=`pwd`/_install -DCMAKE_XCODE_ATTRIBUTE_ONLY_ACTIVE_ARCH=NO -DCMAKE_IOS_INSTALL_COMBINED=YES -DCMAKE_OSX_ARCHITECTURES=x86_64

/Applications/CMake.app/Contents/bin/cmake --build libndi_ios/out/ios_arm/ --target libndi_ios -- -sdk iphoneos
/Applications/CMake.app/Contents/bin/cmake --build libndi_ios/out/ios_arm64/ --target libndi_ios -- -sdk iphoneos
/Applications/CMake.app/Contents/bin/cmake --build libndi_ios/out/iossimulator_arm64/ --target libndi_ios -- -sdk iphonesimulator
/Applications/CMake.app/Contents/bin/cmake --build libndi_ios/out/iossimulator_x64/ --target libndi_ios -- -sdk iphonesimulator

mkdir -p libndi_ios/out/iosiphoneos
mkdir -p libndi_ios/out/iosiphonesimulator

lipo -create libndi_ios/out/ios_arm/Debug-iphoneos/libndi_ios.a libndi_ios/out/ios_arm64/Debug-iphoneos/libndi_ios.a -output libndi_ios/out/iosiphoneos/libndi_ios.a
lipo -create libndi_ios/out/iossimulator_arm64/Debug-iphonesimulator/libndi_ios.a libndi_ios/out/iossimulator_x64/Debug-iphonesimulator/libndi_ios.a -output libndi_ios/out/iosiphonesimulator/libndi_ios.a

xcodebuild -create-xcframework -library libndi_ios/out/iosiphoneos/libndi_ios.a -library libndi_ios/out/iosiphonesimulator/libndi_ios.a -output ../ios/Frameworks/libndi_ios.xcframework
