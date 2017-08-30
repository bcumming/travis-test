echo ==== build $BUILD_NAME

exe=${BUILD_NAME}.exe
g++ test.cpp -o ${exe}

./${exe} || exit 1

