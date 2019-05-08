(defun REEMPLAZAR (Month_Number_Char); Función para cambiar el número del mes por letras
      (setq month_number (- (atoi Month_Number_Char) 1))
      (setq Array_Month '("ENERO" "FEBRERO" "MARZO" "ABRIL" "MAYO" "JUNIO" "JULIO" "AGOSTO" "SEPTIEMBRE" "OCTUBRE" "NOVIEMBRE" "DICIEMBRE"))
      (setq Name_Month (nth month_number Array_Month))
   )