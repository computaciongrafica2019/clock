(vl-load-com)
(Defun c:SetAlarm()
;Alarm hand block definition
(command "_Insert" "AlarmHand" Centre 1 1 0 "")
(Setq AlarmM (Entlast))
  
(setq Ahour (getint "\nEnter the hour of the alarm: "))
  
(setq Aminute (getint "\nEnter the minute of the alarm: "))


 (Setq Ang_Ala_Hour (-(+ (* Ahour Ang_HorarioXHora)(* Aminute Ang_HorarioXMinuto)(* 0  Ang_HorarioXSegundo))))

 (setq propAlarmHand (entget AlarmM))

 (setq propAlarmHandNew (subst (cons 50 (* PI (/ Ang_Ala_Hour 180.0))) (assoc 50 propAlarmHand) propAlarmHand))
			(entmod propAlarmHandNew)

  		  )
;create clock
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

(Defun c:Alarm()

 (if (AND (= Ahour hours)(= Aminute mminutes)(< 5 seconds))
		(acet-sys-beep 64))
  
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
(defun Change_Name_Month (Month_Number)
      (setq Array_Position (- (Month_Number) 1))
      (setq Array_Month '("ENERO" "FEBRERO" "MARZO" "ABRIL" "MAYO" "JUNIO" "JULIO" "AGOSTO" "SEPTIEMBRE" "OCTUBRE" "NOVIEMBRE" "DICIEMBRE"))
      (setq Name_Month (nth Array_Position Array_Month))
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
(defun digital_text (center / aux1 aux2 aux3);escribir texto de fecha y hora
   (setq aux1 (+ (car center) 25) aux2 (+ (cadr center) 5) aux3 (list aux1 aux2))
   (command "_mtext" aux3 aux3 "dia/mes/año" "")
   (setq text_f (entlast))
   (setq texto_fecha (vlax-ename->vla-object text_f)) ;se crea el objeto con el entityname que se guarda en una variable
   (setq aux2 (- (cadr center) 5) aux3 (list aux1 aux2))
   (command "_mtext" aux3 aux3 "hora:minuto:seg" "")
   (setq text_h (entlast))
   (setq texto_hora (vlax-ename->vla-object text_h))
   )
(defun regen_date (dd mm aaaa / aux1 aux2 aux3) ;dia/mes(nombre del mes)/año - funcion actualiza la fecha digital 
   (setq aux1 (itoa dd)
	 aux3 (itoa aaaa))
   (setq fecha_num (strcat aux1 "/" mm "/" aux3))
   (vlax-put-property texto_fecha 'TextString fecha_num)
   (command "regen")
   )
(defun regen_hour (h minuto seg / aux1 aux2 aux3) ;hora_minuto_segundo - funcion actualiza la hora digital
   (setq aux1 (itoa h)
	 aux2 (itoa minuto)
	 aux3 (itoa seg))
   (setq hora_num (strcat aux1 ":" aux2 ":" aux3))
   (vlax-put-property texto_hora 'TextString hora_num)
   (command "regen")
   )
(defun SpeakToMe (str)
      (vl-load-com) 
  (setq sapi (vlax-create-object "Sapi.SpVoice"))
  (vlax-invoke sapi "Speak" str 0)
  (vlax-release-object sapi)
)
( defun deg_to_rad( degrees )
	( / ( * degrees PI ) 180.0 )
)

( defun rotate_second_hand( current_seconds seconds_block_data )
	( entmod ( subst ( cons 50  ( deg_to_rad ( - 360 ( * 6.0 current_seconds ) ) ) ) ( assoc 50 seconds_block_data ) seconds_block_data ) )
 )
 
( defun rotate_minute_hand( current_minutes current_seconds minute_block_data ) 
	( entmod ( subst ( cons 50  ( deg_to_rad ( - 360 ( + ( * 6.0 current_minutes ) ( * 0.1 current_seconds ) ) ) ) ) ( assoc 50 minutes_block_data ) minutes_block_data ) )
)
