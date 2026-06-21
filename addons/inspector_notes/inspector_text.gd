extends EditorProperty

const MIN_HEIGHT := 60

var box := VBoxContainer.new()
var edit := TextEdit.new()
var save_button := Button.new()
var save_obj: Object

func load_note() -> void:
	if save_obj == null: return
	
	var note = save_obj.get_meta("note", null)
	if note == null: return
	
	if edit == null: return
	edit.text = note

func _init(object: Object):
	save_obj = object
	
	load_note()
	
	label = "Object note"
	edit.placeholder_text = "Input notes..."
	edit.wrap_mode = TextEdit.LINE_WRAPPING_BOUNDARY
	edit.custom_minimum_size.y = MIN_HEIGHT
	box.add_child(edit)
	add_focusable(edit)
	
	save_button.text = "Save"
	save_button.pressed.connect(save)
	box.add_child(save_button)
	add_focusable(save_button)
	
	add_child(box)

func save() -> void:
	save_obj.set_meta("note", edit.text)

func _exit_tree() -> void:
	# We save when the user exits...
	save()
