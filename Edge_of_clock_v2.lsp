(defun C:Edge_of_clock()

;Center point selection by screen
 
(setq Center (getpoint))
	   
;Drawing and assignment of the analog clock
  
(command "_Insert" "Clock_dwg" Center "" "" "" )
  (setq Clock (entget (entlast)))
(command "_Insert" "Hour_hand_dwg" Center "" "" "" )
  (setq Hour_hand (entget (entlast)))
 (command "_Insert" "Minute_hand_dwg" Center "" "" "" )
  (setq Minute_hand (entget (entlast))) 
(command "_Insert" "Second_hand_dwg" Center "" "" "" )
  (setq Second_hand (entget (entlast)))

)