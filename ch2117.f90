PROGRAM C2117
INTEGER , POINTER :: A,B
INTEGER , TARGET :: C
INTEGER :: D
  PRINT *,LOC(a)
  PRINT *,LOC(b)
  PRINT *,LOC(c)
  PRINT *,LOC(d)
  C = 1
  A => C
  C = 2
  B => C
  D = A + B
  PRINT *,A,B,C,D
  PRINT *,LOC(a)
  PRINT *,LOC(b)
  PRINT *,LOC(c)
  PRINT *,LOC(d)
END PROGRAM C2117


