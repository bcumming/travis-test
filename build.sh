echo ==== build $BUILD_NAME with thread $THREAD

$CXX --version

exe=${BUILD_NAME}.exe
$CXX test.cpp -o ${exe}

./${exe} || exit 1

which mpicc
which mpicxx
which mpiexec
which mpirun

echo
echo ++++++++++++++++++++++++++++++++++++++
echo + default compiler under wrapper
echo ++++++++++++++++++++++++++++++++++++++
mpicc --version
mpicxx --version

echo
echo ++++++++++++++++++++++++++++++++++++++
echo + compiler under wrapper after fiddling
echo ++++++++++++++++++++++++++++++++++++++
OMPI_CC=`which gcc-5`
OMPI_CXX=`which g++-5`
mpicc --version
mpicxx --version

mpiexe=${BUILD_NAME}.mpi.exe
mpicc test_mpi.cpp -o ${mpiexe} || exit 1

mpirun -n 2 ./${mpiexe} || exit 1

ls *.exe
