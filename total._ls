(vl-load-com)

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

;Trougth CDATE and string manipulation set time data in variables
(defun getDate()
	(setq time_date(rtos(getvar "CDATE") 2 6))
	(setq hours(atoi (substr time_date 10 2)))
	(setq minutes (atoi (substr time_date 12 2)))
	(setq seconds(atoi (substr time_date 14 2)))
	(setq year (atoi (substr time_date 1 4)))
	(setq month (atoi (substr time_date 5 2)))
	(setq day (atoi (substr time_date 7 2)))
)
( defun deg_to_rad( degrees )
	( / ( * degrees PI ) 180.0 )
)

( defun rotate_second_hand( current_seconds seconds_block_data )
	( entmod ( subst ( cons 50  ( deg_to_rad ( - 90 ( * 6.0 current_seconds ) ) ) ) ( assoc 50 seconds_block_data ) seconds_block_data ) )
 )
 
( defun rotate_minute_hand( current_minutes current_seconds minutes_block_data ) 
	( entmod ( subst ( cons 50  ( deg_to_rad ( - 90 ( + ( * 6.0 current_minutes ) ( * 0.1 current_seconds ) ) ) ) ) ( assoc 50 minutes_block_data ) minutes_block_data ) )
)
(defun roth (hora minu segu entna offset)"hora, minuto, segundo,"
  " nombre del bloque manecilla hora, angulo inicial donde apunta la manecilla en radianes"
  "calculo de los angulos que afectan la manecilla hora (HMS)"
	(setq   hah1   (- 0 (* hora (/ pi 6)))
	       	ham1   (- 0 (* minu 0.00872665))
		has1   (- 0 (* segu 0.00014543828657))
	)
  	(setq angof (* (-( deg_to_rad 90) offset))) 
  "suma de los angulos HMS"
	(setq angh (+ (+ ham1 has1) (+ hah1 angof)))
  "modificacion y actualizacion de las propiedades del bloque"
  	(setq entp entna)
  	(setq entp (subst (cons 50 angh) (assoc 50 entp) entp ))
  	(entmod entp)
)

(defun cont ()
	(setq contador 0)
	(while (< contador 20)
		(setq contador(+ contador 1))
		(command "_delay" 9)
	  	(setq seconds (+ seconds 1))
	        (rotate_second_hand seconds second_hand)
		(if (= seconds 60) 
		   (progn
		     (setq minutes(+ minutes 1))
		     (rotate_minute_hand minutes seconds minute_hand)
		     (setq seconds 0)
		     (if (= minutes 60)
				(progn
					(setq hours(+ hours 1))
				  	(roth hours minutes seconds hour_hand (cdr ( assoc 50 hour_hand)))
				  	(setq minutes 0)
				  	(if (= hours 24) (setq hours 0)	)
		     		)
		     )
	           )
		)	 
	   	(print hours)
	   	(print minutes)
	   	(print seconds)
	   	(print "------")
	  	(command  "_regen" )
	)
)
(Defun c:Alarm()

 (if (AND (= Ahour h)(= Aminute m)(= 0 s))
		(acet-sys-beep 64)) 
)
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
(command "_osnap" "off")
(command "_erase" "_all" "")
(c:Edge_of_clock)
(getdate)
(rotate_second_hand seconds second_hand)
(rotate_minute_hand minutes seconds minute_hand)
(roth hours minutes seconds hour_hand (cdr ( assoc 50 hour_hand)))
(command  "_regen" )
(cont)
