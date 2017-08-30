echo ==== build $BUILD_NAME

g++ test.cpp -o ${BUILD_NAME}.exe

ls *.exe

./test.exe || exit 1
