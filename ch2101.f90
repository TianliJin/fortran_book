PROGRAM C2101
  INTEGER , POINTER :: A,B
  INTEGER , TARGET :: C
  INTEGER :: D
  C = 1
  A => C
  C = 2
  B => C
  D = A + B
  PRINT *,A,B,C,D
END PROGRAM C2101


