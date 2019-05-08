(defun roth (hora minu segu entna offset)"Parameter:hour, minutoe, second,"
  " Entity name of the hour hand block, Inicial angle where the hour hand point"
  "Evaluate the angles that affect the hourd hand position(Hour,minutes,econds)"
	(setq   hah1   (- 0 (* hora (/ pi 6)))
	       	ham1   (- 0 (* minu 0.00872665))
		has1   (- 0 (* segu 0.00014543828657))
	)
  "convert offset from deg to rad"
  	(setq angof (* (- 90 offset) (/ pi 180)))
  "angles sum plus the offset"
	(setq angh (+ (+ ham1 has1) (+ hah1 angof)))
  "modificacion y actualizacion de las propiedades del bloque"
  	(setq entp (entget entna))
  	(setq entp (subst (cons 50 angh) (assoc 50 entp) entp ))
  	(entmod entp)
)
