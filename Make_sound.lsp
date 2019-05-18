;this functions creates an instance of the Sapi.Spvoice api from windows system
;then invoke "speak" method and runs it with an input string
;finally realises the objetc 
(vl-load-com) 
(defun SpeakToMe (str)
  (setq sapi (vlax-create-object "Sapi.SpVoice"))
  (vlax-invoke sapi "Speak" str 0)
  (vlax-release-object sapi)
)
(SpeakToMe (strcat "ik"))
