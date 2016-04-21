//Título: Implementacion eficiente de Bcast en MPI utiizando Send y Recv
//Descripción de Tareas y Quices

//Debe implementar eficientemente el Broadcast de MPI utilizando solo sends y receives suponiendo que el nodo raiz (root) puede ser cualquier rango (rank) dentro del comunicador, utilice de base el siguiente código:

void my_bcast(void* data, int count, MPI_Datatype datatype, MPI_Comm communicator) {
   int rank;
   MPI_Comm_rank(communicator, &rank);
   int size;
   MPI_Comm_size(communicator, &size);

   if (rank == 0) {
      // If we are the root process, send our data to everyone
      int pot2;
      for (pot2 = 1; pot2 < size; pot2=pot2+pot2)
         MPI_Send(data, count, datatype, pot2, 0, communicator);
   }
   else {
      int pot2;

      for (pot2 = 1; pot2 + pot2 <= rank; pot2 = pot2+pot2);
      // If we are a receiver process, receive the data from an offset of pot2
      // where pot2 is the largest power of 2 smaller than my rank

      MPI_Recv(data, count, datatype, rank-pot2, 0, communicator, MPI_STATUS_IGNORE);

      for (pot2 = pot2 + pot2; pot2 + rank < size; pot2 = pot2+pot2)
         MPI_Send(data, count, datatype, rank+pot2, 0, communicator);
}
