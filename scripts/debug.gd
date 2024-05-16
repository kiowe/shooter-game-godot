extends PanelContainer

@onready var property_container = %VBoxContainer

var property
var frames_per_second : String

func _ready() -> void:
	# Set global reference to self in global singleton
	Global.debug = self
	
	# Hide debug panel on load
	visible = false
	add_debug_property("FPS", frames_per_second)

func _process(delta: float) -> void:
	if visible:
		frames_per_second = "%.2f" % (1.0/delta)
		property.text = property.name + ": " + frames_per_second

func _input(event: InputEvent) -> void:
	# Toggle debug panel
	if event.is_action_pressed("debug"):
		visible = !visible

func add_debug_property(title: String, value):
	property = Label.new() # Create a new lable node
	property_container.add_child(property) # Add new node as child to vbox container
	property.name = title # Set name to title
	property.text = property.name + value
