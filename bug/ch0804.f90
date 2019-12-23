PROGRAM ch0804
IMPLICIT NONE
REAL :: Light_Minute, Distance, Elapse
INTEGER :: Minute, Second
!INTEGER :: Tmp = 10**12
!PARAMETER运算都是常数与常数 不能是变量
!all values n in the range of values n with -10^r< n < 10^r.
INTEGER ( SELECTED_INT_KIND(19)),PARAMETER :: Tmp1 = 1*10**12
INTEGER ( SELECTED_INT_KIND(10)),PARAMETER :: Tmp2 = 1*10 ** 4
!integer(kind = 8) :: longval = 1*10 ** 12
REAL , PARAMETER :: Light_Year=9.46*Tmp1

! Light_year  : Distance travelled by light
! in one year in km
! Light_minute : Distance travelled by light
! in one minute in km
! Distance : Distance from sun to earth in km
! Elapse : Time taken to travel a
! distance (Distance) in minutes
! Minute : Integer number part of elapse
! Second : Integer number of seconds
! equivalent to fractional part of elapse
!
  Light_minute = Light_Year/(365.25 * 24.0 * 60.0)
  Distance = 150.0 * 10 ** 6
  Elapse = Distance / Light_minute
  Minute = Elapse
  Second = (Elapse - Minute) * 60
  Print *,' Light takes ' , Minute,' Minutes'
  Print *,'           ' , Second,' Seconds'
  Print *,' To reach the earth from the sun'
END PROGRAM ch0804


