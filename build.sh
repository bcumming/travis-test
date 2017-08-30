echo ==== build $BUILD_NAME with thread $THREAD

exe=${BUILD_NAME}.exe
g++ test.cpp -o ${exe}

./${exe} || exit 1

ls *.exe
