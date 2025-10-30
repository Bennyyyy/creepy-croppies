class_name Seed extends Tool

@export var plant: PlantConfig
@export var consumed_item: ItemConfig

func can_use(user: Character):
	if not super.can_use(user):
		return false
	return Game.player_items.has_enough(consumed_item, 1)

func use_primary(user: Character):
	if not can_use(user):
		return
	super.use_primary(user)
	# TODO: seed functionality
	var loc = user.get_interact_point()
	Game.plants.place_plant(loc, plant)
	Game.player_items.add_item(consumed_item, -1)
	Game.audio.play_plant_seed()
