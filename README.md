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

