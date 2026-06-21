# my_inspector_plugin.gd
extends EditorInspectorPlugin

var TextPiece = preload("res://addons/inspector_notes/inspector_text.gd")

func _can_handle(object: Object) -> bool:
	return true

func _parse_begin(object: Object) -> void:
	add_custom_control(TextPiece.new(object))
