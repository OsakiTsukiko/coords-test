extends Node

const STEP = 64;

var player = preload("res://player.tscn")
var tile = preload("res://tile.tscn")
onready var actors = $actors
onready var tiles = $tiles
onready var label = $CanvasLayer/Label

func transform_to_global_coords ( coords: Vector2 ) -> Vector2:
	return Vector2(floor(coords.x / STEP), floor(coords.y / STEP))

func _ready():
	actors.add_child(player.instance())
	for x in range(-10, 11):
		for y in range(-10, 11):
			var tile_instance = tile.instance()
			tile_instance.translate(Vector2(x, y) * STEP)
			tiles.add_child(tile_instance)
	pass
	
func _process(delta):
#	if Input.is_action_just_pressed("ui_accept"):
	for idx in actors.get_children():
		label.text = String(transform_to_global_coords(idx.position))

#func _input(event):
#	if event is InputEventMouseButton:
#		print("Mouse Click/Unclick at: ", event.position)
#		var tile_instance = tile.instance()
#		tile_instance.translate(transform_to_global_coords(event.position) * STEP)
#		tiles.add_child(tile_instance)

