echo ==== build $BUILD_NAME with thread $THREAD

$CXX --version

exe=${BUILD_NAME}.exe
$CXX test.cpp -o ${exe}

./${exe} || exit 1

mpiexe=${BUILD_NAME}.mpi.exe
mpicc test.cpp -o ${mpiexe}

mpirun -n 2 ./${mpiexe} || exit 1

ls *.exe
