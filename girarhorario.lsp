(defun roth (hxs entna)"Parameter:hour, entityname,"
  	(setq entp (entget entna))
  	(setq angh (+ (cdr(assoc 50 entp)) hxs))
    "modificacion y actualizacion de las propiedades del bloque"
  	(setq entp (entget entna))
  	(setq entp (subst (cons 50 angh) (assoc 50 entp) entp ))
  	(entmod entp)
)
