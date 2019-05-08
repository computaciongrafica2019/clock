
(setq s(atoi (menucmd "M=$(edtime,$(getvar,date),ss\)")))

(setq m(atoi (menucmd "M=$(edtime,$(getvar,date),mm\)")))


(setq h(atoi (menucmd "M=$(edtime,$(getvar,date),hh AM/PM\)")))



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


	