#bin/bash

rm -rf ThirdParties/KakaoSDKAuth.xcframework
rm -rf ThirdParties/KakaoSDKCommon.xcframework
rm -rf ThirdParties/KakaoSDKUser.xcframework

cd KakaoSDKCommon
sh build-xcframework.sh
cd ..

cd KakaoSDKAuth
sh build-xcframework.sh
cd ..

cd KakaoSDKUser
sh build-xcframework.sh
cd ..

exit;