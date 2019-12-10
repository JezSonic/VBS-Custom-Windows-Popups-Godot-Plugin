extends Control
var can_execute
func _process(delta):
	if can_execute == true:
		$Control/create2.set_disabled(false)
	else:
		$Control/create2.set_disabled(true)

#Icon
#
#Icon types
#16 = Critical Icon, Error Icon
#32 = Help Icon, Question Icon
#48 = Warning Icon,
#64 = Information Icon,
#
#
#Button types
#0 = OK Button, 
#1 = OK / Cancel Button, 
#2 = Abort / Retry / Ignore Button, 
#3 = Yes / No / Cancel Button, 
#4 = Yes / No Button, 
#5 = Retry / Cancel Button


func _on_create_pressed():
	#create a script and save it
	VBS.create('lol','lol', 'lol', '0', '16')
	#file name, text, title, buttons, icon
	can_execute = bool(str(VBS.can_execute())) 


func _on_create2_pressed():
	#check if script can be executed
	if can_execute == true:
		VBS.execute('lol')
	else:
		print('Sorry... Can not execute a script')
	#file name
