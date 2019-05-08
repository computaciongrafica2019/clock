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