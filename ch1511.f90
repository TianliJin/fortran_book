PROGRAM ch1511
IMPLICIT NONE
REAL :: Result,N,R
  PRINT *,' Type in N and R'
  READ *,N,R
! NUMBER OF POSSIBLE COMBINATIONS THAT CAN 
! BE FORMED WHEN
! R OBJECTS ARE SELECTED OUT OF A GROUP OF N
! N!/R!(N-R)!
  Result=Stirling(N)/(Stirling(R)*Stirling(N-R))
  PRINT *,Result
  PRINT *,N,R
CONTAINS
REAL FUNCTION Stirling (X)
  REAL , INTENT(IN) :: X
  REAL , PARAMETER :: PI=3.1415927, E =2.7182828
  Stirling=SQRT(2.*PI*X) * (X/E)**X
END FUNCTION Stirling
END PROGRAM ch1511 


