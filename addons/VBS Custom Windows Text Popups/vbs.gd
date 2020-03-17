extends Control
var text_ = 'Set objFSO=CreateObject("Scripting.FileSystemObject")\noutFile="'+ str(OS.get_user_data_dir()) + '/out.txt' +'"\nSet objFile = objFSO.CreateTextFile(outFile,True)\nobjFile.Write '
var os = str(OS.get_name())
var can_execute = false
var can_get_output = false
func _ready():
	set_process(false)
func create(script_name:String, text:String, title:String, buttons:String, icon:String):
	can_get_output = false
	if os == 'Windows':
		var msg = 'MsgBox("%s",%s+%s,"%s")' % [text, buttons, icon, title]
		var file = File.new()
		file.open(str(OS.get_user_data_dir()) + '/%s.vbs' % [script_name], File.WRITE)
		print("Script has been created at: " + str(OS.get_user_data_dir()) + '/%s.vbs' % [script_name])
		file.store_line(str(text_) + str(msg) +'\nobjFile.Close')
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
		OS.shell_open(str(OS.get_user_data_dir()) + '/%s.vbs' % [script_name])
		print("Executing script from: " + str(OS.get_user_data_dir()) + '/%s.vbs' % [script_name])
		set_process(true)
	else:
		print('CAN EXECUTE ONLY IN WINDOWS')

func can_execute():
	return can_execute
func can_get_output():
	return can_get_output
func get_output():
	var a = File.new()
	a.open(str(OS.get_user_data_dir())+ '/out.txt', File.READ)
	return str(a.get_line())
func _process(delta):
	var a = File.new()
	if a.file_exists(str(OS.get_user_data_dir())+ '/out.txt'):
		can_get_output = true
		set_process(false)
#	else:
#		print('Error getting output from executed script')
#		set_process(false)
