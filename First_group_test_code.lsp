

;Function to return time data (integers)

;Trougth CDATE and string manipulation set time data in variables
(setq time_date(rtos(getvar "CDATE") 2 6))
(setq hours(atoi (substr fecha_hora 10 2)))
(setq minutes (atoi (substr fecha_hora 12 2)))
(setq seconds(atoi (substr fecha_hora 14 2)))
(setq year (atoi (substr fecha_hora 1 4)))
(setq month (atoi (substr fecha_hora 5 2)))
(setq day (atoi (substr fecha_hora 7 2)))


(defun C:Edge_of_clock()

;Center point selection by screen
 
(setq Center (getpoint))
	   
;Drawing and assignment of the analog clock
  
(command "_Insert" "ElReloj" Center "" "" "" )
  (setq Clock (entget (entlast)))
(command "_Insert" "ElHorario" Center "" "" "" )
  (setq Hour_hand (entget (entlast)))
 (command "_Insert" "ElMinutero" Center "" "" "" )
  (setq Minute_hand (entget (entlast))) 
(command "_Insert" "ElSegundero" Center "" "" "" )
  (setq Second_hand (entget (entlast)))

)