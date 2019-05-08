( defun deg_to_rad( degrees )
	( / ( * degrees PI ) 180.0 )
)

( defun rotate_second_hand( current_seconds seconds_block_data )
	( entmod ( subst ( cons 50  ( deg_to_rad ( - 360 ( * 6.0 current_seconds ) ) ) ) ( assoc 50 seconds_block_data ) seconds_block_data ) )
 )
 