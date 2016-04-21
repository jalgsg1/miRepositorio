#include <MPI.h>
int main(int argc, char *argv[]){
    int rank, size, data;
    MPI_Status status;
    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank)
    MPI_Comm_size(MPI_COMM_WORLD, &size)
    if(rank==0){
        MPI_Send(&data, 1, MPI_INT, 1, 0, MPI_COMM_WORLD);
    }do{
        MPI_Recv(&data, 1, MPI_INT, rank-1, 0, MPI_COMM_WORLD, &status);
        if (rank==0){
            data--;
        }
        MPI_Send(&data, 1, MPI_INT, rank+1, 0, MPI_COMM_WORLD);
    }
    while(data!=0){
        if(rank==0){
            MPI_Recv(&data, 1, MPI_INIT, rank-1, 0, MPI_COMM_WORLD, &status);
        }
    }
    MPI_Finalize();
} 