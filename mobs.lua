--monsters
if minetest.get_modpath("mobs_monster") then
	mobs:spawn({
		name = "mobs_monster:dirt_monster",
		nodes = {"ebiomes:dirt_with_grass_med", "ebiomes:dirt_with_grass_steppe_warm", "ebiomes:dirt_with_grass_steppe", "ebiomes:dirt_with_grass_steppe_cold", "ebiomes:dirt_with_grass_cold", "ebiomes:dirt_with_grass_swamp", "ebiomes:dirt_with_grass_warm", "ebiomes:dry_dirt_with_grass_arid", "ebiomes:dry_dirt_with_grass_arid_cool", "ebiomes:peat_with_swamp_moss_yellow", "ebiomes:dirt_with_japanese_rainforest_litter", "ebiomes:dry_dirt_with_humid_savanna_grass", "ebiomes:dirt_with_forest_litter", "ebiomes:dirt_with_jungle_savanna_grass"},
		min_light = 0,
		max_light = 7,
		chance = 6000,
		active_object_count = 2,
		min_height = 0,
		day_toggle = false,
	})

	mobs:spawn({
		name = "mobs_monster:sand_monster",
		nodes = {"ebiomes:dry_dirt_with_grass_arid"},
		min_light = 0,
		max_light = 7,
		chance = 7000,
		active_object_count = 2,
		min_height = 0,
		day_toggle = false,
	})
	

	mobs:spawn({
		name = "mobs_monster:spider",
		nodes = {
			"ebiomes:dirt_with_grass_cold", "ebiomes:dirt_with_grass_swamp", "ebiomes:peat_with_swamp_moss_yellow", "ebiomes:dirt_with_japanese_rainforest_litter", "ebiomes:dry_dirt_with_humid_savanna_grass", "ebiomes:dirt_with_forest_litter", "ebiomes:dirt_with_jungle_savanna_grass"
		},
		min_light = 0,
		max_light = 8,
		chance = 7000,
		active_object_count = 1,
		min_height = 25,
		max_height = 31000,
	})


	mobs:spawn({
		name = "mobs_monster:tree_monster",
		nodes = {"ebiomes:dirt_with_grass_cold", "ebiomes:dirt_with_grass_med", "ebiomes:dirt_with_grass_warm", "ebiomes:dirt_with_grass_swamp", "ebiomes:peat_with_swamp_moss_yellow", "ebiomes:dirt_with_japanese_rainforest_litter", "ebiomes:dry_dirt_with_humid_savanna_grass", "ebiomes:dirt_with_forest_litter", "ebiomes:dirt_with_jungle_savanna_grass"}, 
		max_light = 7,
		chance = 7000,
		min_height = 0,
		day_toggle = false,
	})
	
	
	mobs:spawn({
	name = "mobs_monster:land_guard",
	nodes = {
		"ebiomes:dry_dirt_with_grass_arid", "ebiomes:dry_dirt_with_grass_arid_cool", "ebiomes:dry_dirt_with_humid_savanna_grass"
	},
	max_light = 7,
	chance = 25000,
	min_height = 0,
	active_object_count = 1,
	})
	
end


--animals
if minetest.get_modpath("mobs_animal") then

	mobs:spawn({
		name = "mobs_animal:cow",
		nodes = {"ebiomes:dirt_with_grass_med", "ebiomes:dirt_with_grass_steppe_warm", "ebiomes:dirt_with_grass_steppe", "ebiomes:dirt_with_grass_steppe_cold", "ebiomes:dirt_with_grass_cold", "ebiomes:dirt_with_grass_warm"},
		neighbors = {"group:grass"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true,
	})

	mobs:spawn({
		name = "mobs_animal:sheep_white",
		nodes = {"ebiomes:dirt_with_grass_med", "ebiomes:dirt_with_grass_steppe_warm", "ebiomes:dirt_with_grass_steppe", "ebiomes:dirt_with_grass_warm"},
		neighbors = {"group:grass"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 0,
		max_height = 200,
		day_toggle = true,
	})
	
	mobs:spawn({
		name = "mobs_animal:bunny",
		nodes = {"ebiomes:dirt_with_japanese_rainforest_litter", "ebiomes:dirt_with_grass_med", "ebiomes:dry_dirt_with_humid_savanna_grass", "ebiomes:dirt_with_grass_warm", "ebiomes:dirt_with_grass_cold", "ebiomes:dirt_with_grass_steppe_warm", "ebiomes:dirt_with_forest_litter", "ebiomes:dirt_with_jungle_savanna_grass"},
--		neighbors = {"group:grass"},
		min_light = 12,
		interval = 60,
		chance = 1600,
		min_height = 5,
		max_height = 200,
		day_toggle = true,
	})
	
end

--npcs
if minetest.get_modpath("mobs_npc") then
	mobs:spawn({
		name = "mobs_npc:npc",
		nodes = {"default:brick"},
		neighbors = {"ebiomes:grass_med_3", "ebiomes:grass_steppe_warm_3", "ebiomes:grass_steppe_3", "ebiomes:grass_steppe_cold_3", "ebiomes:grass_cold_3", "ebiomes:grass_warm_3", "ebiomes:grass_arid_3", "ebiomes:grass_arid_cool_3"},
		min_light = 10,
		chance = 10000,
		active_object_count = 1,
		min_height = 0,
		day_toggle = true,
	})
end

--horse
if minetest.get_modpath("mob_horse") then
	mobs:spawn({
		name = "mob_horse:horse",
		nodes = {"ebiomes:dirt_with_grass_med", "ebiomes:dirt_with_grass_steppe_warm", "ebiomes:dirt_with_grass_steppe", "ebiomes:dirt_with_grass_steppe_cold"},
		min_light = 14,
		interval = 60,
		chance = 16000,
		min_height = 10,
		max_height = 31000,
		day_toggle = true
	})
end
