( defun deg_to_rad( degrees )
	( / ( * degrees PI ) 180.0 )
)

;; Description
;; ----------
;; This function rotates seconds hand of the clock.
;;
;; Parameters
;; ----------
;; current_seconds : integer
;;     The current seconds of the system.
;;
;; minute_block_data : list
;;     Block representing minute hand
( defun rotate_second_hand( current_seconds seconds_block_data )
	( entmod ( subst ( cons 50  ( deg_to_rad ( - 360 ( * 6.0 current_seconds ) ) ) ) ( assoc 50 seconds_block_data ) seconds_block_data ) )
 )


;; Description
;; ----------
;; This function rotates minute hand of the clock.
;;
;; Parameters
;; ----------
;; current_minutes : integer
;;     The current minutes of the system.
;;
;; current_seconds : integer
;;     The current seconds of the system.
;;
;; minute_block_data : list
;;     Block representing minute hand
( defun rotate_minute_hand( current_minutes current_seconds minute_block_data ) 
	( entmod ( subst ( cons 50  ( deg_to_rad ( - 360 ( + ( * 6.0 current_minutes ) ( * 0.1 current_seconds ) ) ) ) ) ( assoc 50 minutes_block_data ) minutes_block_data ) )
)
