program main
    use matrix_generators
    implicit none
    integer(8) :: N, i
    complex(8) , allocatable :: L(:,:), M(:,:)

    ! set N and L
    N = 3
    !allocate size
    allocate(L(2,N))
    !open file
    open(1,file='test_file.txt')
    call band_structure_generator(N,L)
    write(1,*)'band'

    write(1,*)L(1,:)
    write(1,*)L(2,:)

    allocate(M(N,N))
    call full_n_matrix(N,M)
    write(1,*)'full'
    write(1,*)M(1,:)
    write(1,*)M(2,:)
    write(1,*)M(3,:)
    deallocate(L)
end program main