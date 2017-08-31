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

mpicc -cc gcc-5 --version
mpicxx -cxx g++-5 --version

mpiexe=${BUILD_NAME}.mpi.exe
mpicc -cc gcc-5 test_mpi.cpp -o ${mpiexe} || exit 1

mpirun -n 2 ./${mpiexe} || exit 1

ls *.exe
