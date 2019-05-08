(defun bisiesto (anno,mes,dia)

  (setq anno(2019))
  (setq mes'("Enero" "Febrero" "Marzo" "Abril" "Mayo" "Junio" "Julio" "Agosto" "Septiembre" "Octubre" "Noviembre" "Diciembre"))
  (setq dia (getvar(d)))
  
  (if(= dia 29)
    (if (= mes "Febrero") (nth 2 mes)  nil)
    (= dia 1) nil
    )
  
  (if (= dia 31)
    (if (= mes ("Abril" "Junio" "Septiembre" "Noviembre")) (+ mes 1))
    (= dia 1) nil
    )
  
  (if (= dia 32)
    (if (= mes "Diciembre") (+ anno 1)(= mes (nth 0 mes))(= dia 1))
    (+ mes 1)(= dia 1) nil
    )
)