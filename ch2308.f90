program ch2308

implicit none
integer :: n
real , allocatable , dimension(:) :: x
real :: m,sd,median
integer , dimension(8) :: timing

interface
  subroutine stats(x,n,mean,std_dev,median)
    implicit none
    integer , intent(in)                  :: n
    real    , intent(in) , dimension(:)   :: x
    real    , intent(out)                 :: mean
    real    , intent(out)                 :: std_dev
    real    , intent(out)                 :: median
  end subroutine stats
end interface

  n=1000
  do
    print *,' n = ',n
    allocate(x(1:n))
    call random_number(x)
    x=x*1000
    call date_and_time(values=timing)
    print *,' initial '
    print *, timing(6) , timing(7) , timing(8)
    call stats(x,n,m,sd,median)
    print *,' mean = ',m
    print *,' Standard deviation = ',sd
    print *,' median is = ',median
    call date_and_time(values=timing)
    print *,' after'
    print *,timing(6),timing(7),timing(8)
    n=n*10
    deallocate(x)
  end do

end program ch2308

subroutine stats(x,n,mean,std_dev,median)
implicit none
integer , intent(in)                :: n
real    , intent(in) , dimension(:)   :: x
real    , intent(out)               :: mean
real    , intent(out)               :: std_dev
real    , intent(out)               :: median
real    , dimension(1:n)            :: y
real :: variance
real    :: sumxi, sumxi2
  sumxi=0.0
  sumxi2=0.0
  variance=0.0
  sumxi=sum(x)
  sumxi2=sum(x*x)
  mean=sumxi/n
  variance=(sumxi2-sumxi*sumxi/n)/(n-1)
   std_dev = sqrt(variance)
  y=x
  call selection
  if (mod(n,2) == 0) then
    median=(y(n/2)+y((n/2)+1))/2
  else
    median=y((n/2)+1)
  endif  
contains

  subroutine selection
  implicit none
  integer :: i,j,k
  real :: minimum
    do i=1,n-1
      k=i
      minimum=y(i)
      do j=i+1,n
        if (y(j) < minimum) then
          k=j
          minimum=y(k)
        end if
      end do
      y(k)=y(i)
      y(i)=minimum
    end do
  end subroutine selection

end subroutine stats

