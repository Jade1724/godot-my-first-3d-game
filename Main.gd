extends Node

export (PackedScene) var mob_scene

func _ready():
	randomize()

func _on_MobTimer_timeout():
	# Create a Mob instance and add it to the scenen.
	var mob = mob_scene.instance()
	
	# Choose a random location on Path2D.
	# We store the reference to the SpawnLocation node.
	var mob_spawn_location = get_node("SpawnPath/SpawnLocation")
	# And give it a random offset.
	mob_spawn_location.unit_offset = randf()
	
	var player_position = $Player.transform.origin
	
	add_child(mob)
	mob.initialize(mob_spawn_location.translation, player_position)
