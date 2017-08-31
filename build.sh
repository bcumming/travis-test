echo ==== build $BUILD_NAME with thread $THREAD

$CXX --version

exe=${BUILD_NAME}.exe
$CXX test.cpp -o ${exe}

./${exe} || exit 1

which mpicc
which mpicxx
which mpiexec
which mpirun

mpicc --version
mpicxx --version

mpiexe=${BUILD_NAME}.mpi.exe
mpicc test_mpi.cpp -o ${mpiexe} || exit 1

mpirun -n 2 ./${mpiexe} || exit 1

ls *.exe
