;jcvillota, jupbonillago, bdleons
;sets the alarm and shows the position of the hour hand in which it is going to ring
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

(Defun c:Alarm()

 (if (AND (= Ahour hour)(= Aminute minute)(= 0 second))
		(acet-sys-beep 64))
  
  )
