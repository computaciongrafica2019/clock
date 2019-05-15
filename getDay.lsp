(defun getDayText ()
	 (setq DAY (menucmd "M=$(edtime, $(getvar, date),DDDD)"))
  	 (setq WKDAY (atoi day))
    (setq dias '("Lunes" "Martes" "Miercoles" "Jueves" "Viernes" "Sabado" "Domingo")
			diasE '("Monday"  "Tuesday" "Wednesday" "Thusrday" "Friday" "Saturday" "Sunday")	
			 )
  	 (setq position (vl-position DAY diasE))
  	 (nth position dias)
)



