program main
    implicit none
    real(8) , allocatable :: potential_matrix(:,:),ev(:), RWORK(:),eigen_ground(:,:)
    real(8) :: mu,nu,dx,dy,x=0,y=0
    integer :: i,j ,n,k=2,l=2,n_sqrt,info,lwork,a,b
    complex(8) , allocatable :: WORK(:),hermitian_matrix(:,:)

  
    !set constants
    dx = 0.2
    dy = 0.2
    mu = 0.5/((dx)**2)
    nu = 0.5/((dy)**2)
    lwork = 0
    n= 2401
    n_sqrt = 49

    !initialize matrices

    allocate(hermitian_matrix(n,n), potential_matrix(n_sqrt+2, n_sqrt+2), ev(n), RWORK(3*(n) - 2),eigen_ground(n_sqrt,n_sqrt))

    hermitian_matrix = 0.0

    open(10, fiLe = "potential.csv")

    !discretize the potential
    do i = 1,n_sqrt+2
        do j = 1, n_sqrt+2
            x = -5.0+dx*(i-1)
            y=-5.0+dy*(j-1)
            potential_matrix(i,j) = 2*mu + 2*nu  + 0.5*(x**2 + y**2)
            write(10,*) x, y, potential_matrix

        end do
    end do
close(10)

    !set up hermitian matrix
    do  i = 1,n

        hermitian_matrix(i,i) = potential_matrix(k,l)

        if(i .eq. 1 .or. mod(i,n_sqrt) .NE. 0 ) then
            hermitian_matrix(i,i+1) = -nu
        end if
        
        if(i <= (n-n_sqrt)) then
            hermitian_matrix(i,i+n_sqrt) = -mu
        end if


        if (mod(k,n_sqrt) == 0) then
            k = 1
            l = l +1
        end if

         k = k+1

        
    end do
    !create dummy work array
    allocate(WORK(1))
 
   !determine the optimum size of the work array
    call ZHEEV('N', 'U', n, hermitian_matrix, n, ev, WORK, -1, RWORK, info)
    lwork = min(int(WORK(1)), 10000)
    
    !reallocate work array with optimum size
    deallocate(WORK)
    allocate(WORK(lwork))
    call ZHEEV('V', 'U', n, hermitian_matrix, n, ev, WORK, lwork, RWORK, info)
    !calculate and store eigen values and vectors

    open(2,file='eigen_values.csv')

        a = 1
        do b = 1, 10
            write(2,*) b, a, ev(a), (100*ev(a)-k)/k
            a = a + b
        enddo

        close(2)

        eigen_ground = reshape(Real(hermitian_matrix(:, 1)), (/n_sqrt, n_sqrt/))

        open(3, fiLe = "eigen_ground.csv")

        b= 0
        do b = 1, L
            write(3,*) eigen_ground(b, :)
        enddo

        close(3)

        end program main

