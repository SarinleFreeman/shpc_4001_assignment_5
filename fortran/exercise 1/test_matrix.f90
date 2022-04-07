program main
    use matrix_inverter
    implicit none
    complex(8) :: matrix(3,3),inverted_matrix(3,3)
    integer(8) :: i
    print*,'Welcome, we are currently running tests.... '
    matrix  = reshape((/ 1 , 2 , 3 ,1 ,2 ,3 ,1 ,2 ,3 /),shape(matrix))
    inverted_matrix = mat_3_inverter(matrix)  

    matrix  = reshape((/ 1 , 3 , 3 ,2 ,3 ,3 ,3,4 ,2 /),shape(matrix))
    inverted_matrix = mat_3_inverter(matrix)  

    do i = 1,3
        print*, matrix(i,:)
    end do
end program main