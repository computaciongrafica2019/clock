	;code for counting days, months and years

(defun bisiesto (anno,m,d)
(setq d 32) ;day variable must be handed in by the hour counter
(setq m month) ;value of the month (takes variable months from getDate)

  (setq anno 2019 ) ;year variable value should be given
  (setq meses '("Enero" "Febrero" "Marzo" "Abril" "Mayo" "Junio" "Julio" "Agosto" "Septiembre" "Octubre" "Noviembre" "Diciembre")) ;list of months
  (setq dia d)
  (setq mes (nth (- m 1) meses)) ;value m should be given by the programm that turns number of the month into to text

  (setq meses30 '("Abril" "Junio" "Septiembre" "Noviembre")) ;months that only have 30 days

	;turns to March when February gets to de 28, takes into account the leap-year
  (if(>= dia 29)
    (if (= mes "Febrero")
      (if (= 0 (rem anno 4))
	(if (>= dia 30)
	  (if (rem anno 400) (= mes (nth 2 meses))(= dia 1)  )
	 (= mes (nth 2 meses))(= dia 1)  )
       (= mes (nth 2 meses))(= dia 1)  )
      )
    )

	;turns to the nest month for those that have 30 days
  (if (>= dia 31)
    (if (member mes meses30)) (= mes (nth m meses))(= dia 1)  )(+ m 1) 
    )

	;turns to the next month or year if it is December  
  (if (>= dia 32)
    (if (= mes "Diciembre") (+ anno 1)(= mes (nth 0 meses))(= m 0)(= dia 1)  )
    (= mes (nth m meses))(= dia 1)(+ m 1)  
    )

)