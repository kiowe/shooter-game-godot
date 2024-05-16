extends PanelContainer

@onready var property_container = %VBoxContainer

var frames_per_second : String

func _ready() -> void:
	# Set global reference to self in global singleton
	Global.debug = self
	
	# Hide debug panel on load
	visible = false


func _process(delta: float) -> void:
	frames_per_second = "%.2f" % (1.0/delta)
	Global.debug.add_property("FPS", frames_per_second, 0)


func _input(event: InputEvent) -> void:
	# Toggle debug panel
	if event.is_action_pressed("debug"):
		visible = !visible

func add_property(title: String, value, order):
	var target
	target = property_container.find_child(title, true, false) # Try to find label with same name
	if !target: # If target is no current label node for property
		target = Label.new() # Create new label node
		property_container.add_child(target) # Add new node as child to vbox container
		target.name = title # Set name to title
		target.text = target.name + ": " + str(value) # Set text value
	elif visible:
		target.text = title + ": " + str(value) # Update text value
		property_container.move_child(target, order) # Reorder property based on given order value


#func add_debug_property(title: String, value):
	#property = Label.new() # Create a new lable node
	#property_container.add_child(property) # Add new node as child to vbox container
	#property.name = title # Set name to title
	#property.text = property.name + value
