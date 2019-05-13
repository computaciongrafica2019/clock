( defun deg_to_rad( degrees )
	( / ( * degrees PI ) 180.0 )
)

;missing function for hour_hand

(defun rotate_hour_hand( current_hour hour_block_data )
	( entmod ( subst ( cons 50  ( deg_to_rad ( - 360 ( + ( * 6.0 current_minutes ) ( * 0.1 current_seconds ) ( * 0.0083 current_hour ) ) ) ) ) ( assoc 50 hour_block_data ) hour_block_data ) )
 )

;function to apply after 5 seconds

( defun rotate_second_hand_2( current_seconds seconds_block_data )
	( entmod ( subst ( cons 50  ( deg_to_rad ( - 360 ( * 6.6 current_seconds ) ) ) ) ( assoc 50 seconds_block_data ) seconds_block_data ) )
)
 

;code for counting and handle_control

;include (command "_delay" 1000) just before reading system date
(setq counter 0)

(while (< counter 5)

  ;functions already done by other partner
	(rotate_second_hand (current_seconds seconds_block_data))
	(rotate_minute_hand (current_minutes minute_block_data))
	(rotate_hour_hand (current_hour hour_block_data))

  (command "_delay" 1)
  (setq counter (1+ counter))

  )

(while (and (>= counter 5) (< counter 60))

  	(rotate_second_hand_2 (current_seconds seconds_block_data))
	(rotate_minute_hand (current_minutes minute_block_data))
	(rotate_hour_hand (current_hour hour_block_data))

  (command "_delay" 1)
  (setq counter (1+ counter))

  )