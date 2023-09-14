## Instalation

1. MacOS SDK: `git clone https://github.com/tpoechtrager/osxcross.git`
2. `cd osxcross; ./build.sh`
3. `mkdir -p /System/Library; ln -s /osxcross/target/SDK/MacOSX13.1.sdk/System/Library/Frameworks/ /System/Library/Frameworks`
4. download MacOS [Qt](Qt) binaries: [qt Mac binaries](https://download.qt.io/online/qtsdkrepository/mac_x64/desktop/qt5_5152/qt.qt5.5152.clang_64/)



Qt-CMake-HelloWorld
===================

A Simple Qt5 Program Built with cmake


## Cross compilation issue 

[MacOS include headers](https://stackoverflow.com/questions/25596845/why-do-i-have-to-specifically-include-headers-in-some-osx-frameworks-with-eclips)

[Cross-compiling](https://stackoverflow.com/questions/19041157/cross-compiling-qt-5)


## Intro

-framework is a linker option. It has no effect on the header search path. You can convince yourself that this is the case by trying to remove the -framework option for a system framework you are using. You will see that the headers are still found, but there will be missing symbol errors at link time.

The -F option can be used to specify additional paths where framework headers are searched. For example, say you have a framework named MyFramework containing a header MyHeader.h, and install this framework in /Library/Frameworks. The header can then be found at /Library/Frameworks/MyFramework/Headers/MyHeader.h, where Headers is a symbolic link to a version specific directory. The actual location of the header would then for example be /Library/Frameworks/MyFramework/Versions/A/Headers/MyHeader.h.

To include this header, the #include in the source file looks like this:

```
#incude <MyFramework/MyHeader.h>
```

and you can compile the source file using:

`clang -F/Library/Frameworks foo.cpp -framework MyFramework` 

Note that the location of headers for system frameworks in Mac OS changed a couple of releases ago (I think it started around Xcode 4). The headers used to be within their framework directories, which are mostly in /System/Library/Frameworks, but that is not the case anymore. The headers are now in the SDK directories that are part of the Xcode installation.

For example, for Mac OS 10.9, the framework headers are in /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk/System/Library/Frameworks.

Aside from separating files used at build time from files used at runtime, this newer setup has the advantage that you can have multiple SDKs, and can choose to build against specific SDKs. To choose a SDK other than the default, use the -isysroot compiler option
