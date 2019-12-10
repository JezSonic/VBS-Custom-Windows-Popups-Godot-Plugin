tool
extends EditorPlugin

func _enter_tree():
	add_autoload_singleton('VBS', 'res://addons/VBS Custom Windows Text Popups/vbs.gd')
func _exit_tree():
	remove_autoload_singleton('VBS')
