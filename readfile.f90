program read_int_value
	implicit none
	integer, parameter :: fileid = 300
	integer :: filep
	character(1500) :: filename = '/Users/jintianli/test/fortran_book/readme'
	CHARACTER(len = 80)::error_msg          ! 打开文件错误时的异常信息
	INTEGER::nvals = 0                       ! 读取数据的行数
	INTEGER::status1 , status2 = 0            ! 打开文件和读取数据的状态信息
	!REAL::value                                   ! 需读取文件中的数据
	CHARACTER(len = 180)::value

	open(UNIT = fileid, FILE = filename, STATUS = 'OLD', ACTION = 'READ', IOSTAT = status1, IOMSG = error_msg)
	!openif:
	IF(status1 == 0 ) THEN    ! 文件打开成功
		!readloop:
		DO
			READ(fileid , * , IOSTAT = status2) value
			print *, status2
			print *, value
			IF(status2 /= 0) EXIT      ! 如果数据读取失败，跳出DO循环
			nvals = nvals + 1
			WRITE(*,1010) nvals,value
			1010 FORMAT('Line ',I3,' :Value = ',A100)
		END DO 
		!readloop
		!readif:
		IF(status2 > 0) THEN      ! 发生了数据读取错误
			WRITE(*,1020) nvals+1
			1020 FORMAT('An error occurred reading line ',I6)        ! 交代在哪一行读取数据失败
		ELSE 
			!readif     ! 到达数据结尾
			WRITE(*,1030) nvals
			1030 FORMAT('End of file reached.There were ' , I6 , ' values in the file.')   ! 交代已经到达文件结尾
		END IF
		!readif
	ELSE 
		!openif         ! 文件打开失败
		WRITE(*,1040) status1
		1040 FORMAT('Error opening file : IOSTAT = ',I6)
		WRITE(*,1050) TRIM(error_msg)   ! 返回错误信息
		1050 FORMAT(A)   
	END IF 
	!openif

	CLOSE(UNIT = 3)     ! 关闭文件

	STOP 
END PROGRAM read_int_value