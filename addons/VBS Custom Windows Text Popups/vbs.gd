extends Control
var os = str(OS.get_name())
var can_execute
var user_data_dir = str(OS.get_user_data_dir())
func create(script_name:String, text:String, title:String, buttons:String, icon:String):
	if os == 'Windows':
		var script = 'X=MsgBox("%s",%s+%s,"%s")' % [text, buttons, icon, title]
		var file = File.new()
		file.open(str(user_data_dir) + '/%s.vbs' % [script_name], File.WRITE)
		print("Script has been created at: " + str(user_data_dir) + '/%s.vbs' % [script_name])
		file.store_line(str(script))
		file.close()
		can_execute = true
#	if os == 'X11':
#		var script = 'zenit --%s --text="%s" --title="%s"' % [icon, text, title]
#		var file = File.new()
#		file.open('user://%s.sh' % [file_name], File.WRITE)
#		file.store_line(str(script))
#		file.close()
		can_execute = true
func execute(script_name:String):
	if os == 'Windows':
		OS.shell_open(str(user_data_dir) + '/%s.vbs' % [script_name])
		print("Executing script from: " + str(user_data_dir) + '/%s.vbs' % [script_name])
	else:
		print('CAN EXECUTE ONLY IN WINDOWS')
#	if os == 'X11':
#		var data_dir = str(OS.get_user_data_dir())
#		OS.shell_open(str(data_dir) + '/%s.sh' % [file_name])

func can_execute():
	return can_execute
