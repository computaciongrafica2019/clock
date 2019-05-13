	;code for counting days, months and years

(defun bisiesto (anno,m,d)
(setq d 32) ;day variable must be handed in by the hour counter
(setq m 7) ;value of the month

  (setq anno 2019 ) ;year variable value should be given
  (setq meses '("Enero" "Febrero" "Marzo" "Abril" "Mayo" "Junio" "Julio" "Agosto" "Septiembre" "Octubre" "Noviembre" "Diciembre")) ;list of months
  (setq dia d)
  (setq mes (nth (- m 1) meses)) ;value m should be given by the programm that turns number of the month into to text

  (setq meses30 '("Abril" "Junio" "Septiembre" "Noviembre")) ;months that only have 30 days

(print ":")
	;turns to March when February gets to de 28
  (if(>= dia 29)
    (if (= mes "Febrero") (= mes (nth 2 meses))(= dia 1)  )
    )

(print "::")
	;turns to the nest month for those that have 30 days
  (if (>= dia 31)
    (if (= mes (member '(meses30))) (= mes (nth m meses))(= dia 1)  )(+ m 1) 
    )

(print ":::")
	;turns to the next month or year if it is December  
  (if (>= dia 32)
    (if (= mes "Diciembre") (+ anno 1)(= mes (nth 0 meses))(= m 0)(= dia 1)  )
    (= mes (nth m meses))(= dia 1)(+ m 1)  
    )

;(print m)
)
