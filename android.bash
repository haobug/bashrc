#linux
android_sdk=/opt/android-sdk-linux
android_ndk=/opt/android-ndk
. ~/.bashrc.d/platform.rc
if [[ $PLATFORM == 'windows' ]];
then
    android_sdk=/d/android/sdk
    android_ndk=/d/android/ndk
elif [[ $PLATFORM == 'macos' ]];
then
    alias sort='gsort'
fi
export ANDROID_SDK_ROOT=${android_sdk}
export ANDROID_NDK_ROOT=${android_ndk}
export ANDROID_SDK=${android_sdk}
export ANDROID_NDK=${android_ndk}
export NDK_ROOT=${android_ndk}
export ANDROID_HOME=${android_sdk}
export ANDROID_NDK_HOME=${android_ndk}
#export ANDROID_ABI=armeabi-v7a
build_tools=`echo $ANDROID_HOME/build-tools/* |tr ' ' '\n'|sort -V -r|tr '\n' ':'`
android_path=${build_tools}:${android_sdk}/tools:${android_sdk}/platform-tools:${android_ndk}
export PATH=$android_path:$PATH
