program main
    use matrix_generators
    implicit none
    integer(8) :: N,info,i
    complex(8) , allocatable :: L(:,:) ,vec(:,:), WORK(:),eigen_vec_length(:)
    real(8), allocatable :: ev(:), RWORK(:)

    !get the size of matrix
    print*,'Good day to you , young one!'
    print*,'Please enter the number of rows or columns of array'
    read(*,*)N
    !allocate matrix sizes
    allocate(L(2,N),ev(N),vec(N,N),WORK(N),RWORK(3*N-2))
    !use module to get L
    call band_structure_generator(N,L)

    !use lapack to get eigen values and eigen vectors
    call ZHBEV('V','U',N,1,L,2,ev,vec,N,WORK,RWORK,info)
    
    if(info .NE. 0) write(*,*) 'Error!'
    !store eigen values and vectors
    eigen_vec_length = shape(vec)
    open(1,file='eigen_vectors_values.txt')
    do i = 1,int(abs(eigen_vec_length(2)))
        
        write(1,*)'eigen_vector:'
        write(1,*) vec(:,i)
        write(1,*)'corresponding eigen value:'
        write(1,*)ev(i)
        write(1,*)
        write(1,*)
        write(1,*)

    end do

close(1)
    deallocate(L,ev,vec,WORK,RWORK)
end program main