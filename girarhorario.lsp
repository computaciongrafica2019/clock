(defun roth (hora minu segu entna offset)"hora, minuto, segundo,"
  " nombre de la entidad del bloque manecilla hora, angulo inicial donde apunta la manecilla"
  "calculo de los angulos que afectan la manecilla hora (HMS)"
	(setq   hah1   (- 0 (* hora (/ pi 6)))
	       	ham1   (- 0 (* minu 0.00872665))
		has1   (- 0 (* segu 0.00014543828657))
	)
  	(setq angof (* (- 90 offset) (/ pi 180)))
  "suma de los angulos HMS"
	(setq angh (+ (+ ham1 has1) (+ hah1 angof)))
  "modificacion y actualizacion de las propiedades del bloque"
  	(setq entp (entget entna))
  	(setq entp (subst (cons 50 angh) (assoc 50 entp) entp ))
  	(entmod entp)
)