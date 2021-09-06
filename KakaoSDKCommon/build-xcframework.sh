#bin/bash

CURRENT=`pwd`
BASENAME=`basename "$CURRENT"`

echo "$BASENAME XCFramework build 🚀"

rm -rf ./build

xcodebuild archive \
 -scheme $BASENAME \
 -archivePath ./build/$BASENAME-iphoneos.xcarchive \
 -sdk iphoneos \
 SKIP_INSTALL=NO
 BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
 -scheme $BASENAME \
 -archivePath ./build/$BASENAME-iphonesimulator.xcarchive \
 -sdk iphonesimulator \
 SKIP_INSTALL=NO
 BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild -create-xcframework \
-framework "./build/$BASENAME-iphonesimulator.xcarchive/Products/Library/Frameworks/$BASENAME.framework" \
-framework "./build/$BASENAME-iphoneos.xcarchive/Products/Library/Frameworks/$BASENAME.framework" \
-output "../ThirdParties/$BASENAME.xcframework"

rm -rf ./build

exit;