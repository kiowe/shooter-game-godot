@tool

extends Node3D

@export var WEAPON_TYPE : Weapons:
	set(value):
		WEAPON_TYPE = value
		if Engine.is_editor_hint():
			load_weapon()

@onready var weapon_mesh : MeshInstance3D = %WeaponMesh
@onready var weapon_shadow : MeshInstance3D = %WeaponShadow

func _ready() -> void:
	load_weapon()

# just for testing
func _input(event) -> void:
	if event.is_action_pressed("weapon1"):
		WEAPON_TYPE = load("res://meshes/weapons/crowbar/w_crowbar.tres")
		load_weapon()
	if event.is_action_pressed("weapon2"):
		WEAPON_TYPE = load("res://meshes/weapons/crowbar2/crowbarL.tres")
		load_weapon()

func load_weapon() -> void:
	weapon_mesh.mesh = WEAPON_TYPE.mesh # set weapon mesh
	position = WEAPON_TYPE.position # set weapon position
	rotation_degrees = WEAPON_TYPE.rotation # set weapon rotation
	weapon_shadow.visible = WEAPON_TYPE.shadow # turn shadown on/off
