module matrix_generators
    implicit none
    
contains
    subroutine band_structure_generator(N,L) 
        implicit none
        integer(8), intent(in) :: N
        complex(8), allocatable, intent(inout) :: L(:,:)
        integer(8) :: i


        !construct matrix
        L = 0.d0
        do i = 1,N
                !update main diagonal
            L(2,i) = 2.0
            if (i > 1) then
                !update side diagonals
                L(1,i) = -1.0
            end if
        end do
        end subroutine
        
        subroutine full_n_matrix(N,L) 
            implicit none
            integer(8), intent(in) :: N
            complex(8), allocatable, intent(inout) :: L(:,:)
            integer(8) :: i
    
            !construct matrix
            do i = 1,N
                !update main diagonal
                L(i,i) = 2.0
                if (i < N) then
                    !update side diagonals
                    L(i,i+1) = -1.0
                    L(i+1,i) = -1.0
                end if
            end do
            end subroutine
end module matrix_generators