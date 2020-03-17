extends Control
var can_execute
var can_get_output
func _process(_delta):
	if can_execute == true:
		$Control/create2.set_disabled(false)
	else:
		$Control/create2.set_disabled(true)
	if VBS.can_get_output == true:
		$Control/create3.set_disabled(false)
	else:
		$Control/create3.set_disabled(true)

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

#Output enumeration
#1 - Pressed 'Ok' Button
#2 - Pressed 'Cancel' Button
#3 - Pressed 'Abort' Button
#4 - Pressed 'Retry' Button
#5 - Pressed 'Ignore' Button
#6 - Pressed 'Yes' Button
#7 - Pressed 'No' Button
func _on_create_pressed():
	#create a script and save it
	VBS.create('lol','lol', 'lol', '3', '32')
	#file name, text, title, buttons, icon
	can_execute = bool(str(VBS.can_execute())) 


func _on_create2_pressed():
	#check if script can be executed
	if can_execute == true:
		VBS.execute('lol')
	else:
		print('Sorry... Can not execute a script')
	#file name


func _on_create3_pressed():
	print(str(VBS.get_output()))


func _on_edit_pressed():
	pass # Replace with function body.
