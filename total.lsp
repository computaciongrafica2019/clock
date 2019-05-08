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
(defun getDate()
;Trougth CDATE and string manipulation set time data in variables
(setq time_date(rtos(getvar "CDATE") 2 6))
(setq hours(atoi (substr fecha_hora 10 2)))
(setq minutes (atoi (substr fecha_hora 12 2)))
(setq seconds(atoi (substr fecha_hora 14 2)))
(setq year (atoi (substr fecha_hora 1 4)))
(setq month (atoi (substr fecha_hora 5 2)))
(setq day (atoi (substr fecha_hora 7 2)))
)
( defun deg_to_rad( degrees )
	( / ( * degrees PI ) 180.0 )
)

( defun rotate_second_hand( current_seconds seconds_block_data )
	( entmod ( subst ( cons 50  ( deg_to_rad ( - 360 ( * 6.0 current_seconds ) ) ) ) ( assoc 50 seconds_block_data ) seconds_block_data ) )
 )
 
( defun rotate_minute_hand( current_minutes minute_block_data ) 
	( entmod ( subst ( cons 50  ( deg_to_rad ( - 360 ( + ( * 6.0 current_minutes ) ( * 0.1 current_seconds ) ) ) ) ) ( assoc 50 minutes_block_data ) minutes_block_data ) )
)
(defun cont ()
(setq s(atoi (menucmd "M=$(edtime,$(getvar,date),ss\)")))

(setq m(atoi (menucmd "M=$(edtime,$(getvar,date),mm\)")))


(setq h(atoi (menucmd "M=$(edtime,$(getvar,date),hh AM/PM\)")))

(setq ang_sec_per_sec (/ -360.0 60)
      ang_min_per_sec(/ -360.0 60 60)
      ang_hor_per_sec(/ -360.0 12 60 60))

(setq contador 0)
(while (< contador 20)
  	(progn
  
	(setq contador(+ contador 1))
	(command "_delay" 990)
  	(setq s (+ s 1))
			
	(if (= s 60) 
	      (progn
	     (setq m(+ m 1))
	     (setq s 0)
	     (if (= m 60)
		(progn
			(setq h(+ h 1))
		  	(setq m 0)
		  	(if (= h 24)
			  (progn
			    (setq h 0)
				)
			  )

		  )


	       )

	     )
	
	)	 
	)
   	(print h)
   	(print m)
   	(print s)
   	(print "------")
	)

)
