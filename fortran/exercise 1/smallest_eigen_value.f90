program main
    use matrix_inverter
    implicit none
    complex(8) :: matrix(3,3), inverted_matrix(3,3),eigen_value
    interface 
    subroutine powerIterationMethodSystem(matrix)
        implicit none
        complex(8) :: matrix(3,3),eigen_value,guess=10,prev_guess=10,multiplier(3)
        end subroutine
    end interface
    print*,'Welcome, we are currently performing your calaculations .... '
    matrix  = reshape((/ (4,0) , (0,1), (2,0),(0,-1),(2,0),(2,-7),(2,0),(2,7),(-2,0) /),shape(matrix))
    inverted_matrix = mat_3_inverter(matrix)  
   call powerIterationMethodSystem(inverted_matrix)


    
end program main

subroutine powerIterationMethodSystem(matrix)
    implicit none
    complex(8) :: matrix(3,3),eigen_value,guess=10,prev_guess=200,multiplier(3)
    integer(8) :: count
    
    interface   
    function rayleigh_quotient(multiplier,matrix) result(quotient)
    implicit none
    complex(8), intent(in) :: matrix(3,3),multiplier(3)
    complex(8), allocatable :: quotient
    end function
    end interface

    !set up multiplier matrix for iteration method
    multiplier  = reshape((/ 1.0,1.0,1.0 /),shape(multiplier))
    open(1,file='absolute_error.csv')
    do while(abs(prev_guess-guess) > 1e-8)
        prev_guess = guess
        !perform power iteration method
        multiplier = MATMUL(matrix,multiplier)
        multiplier = multiplier/norm2(abs(multiplier))
        !check guess for eigen value
        guess = rayleigh_quotient(multiplier,matrix)
        
        !update count
        count = count + 1
        write(1,*) guess, count
    end do
    close(1)

    print*,'Dominant Eigen Value'
    print*,guess
    print*,'Dominant Eigen Vector'
    print*,multiplier

end subroutine powerIterationMethodSystem

function rayleigh_quotient(multiplier,matrix) result(quotient)
    implicit none
    complex(8), intent(in) :: matrix(3,3),multiplier(3)
    complex(8), allocatable :: quotient

    !calculate eigen value through rayleigh method
    quotient = dot_product(multiplier,matmul(matrix,multiplier))
    quotient = quotient/dot_product(multiplier,multiplier)
    
end function rayleigh_quotient

