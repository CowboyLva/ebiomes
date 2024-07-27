local S = minetest.get_translator("ebiomes")

--from runs cooltrees
local modname = "ebiomes"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")

-- Jungle Savanna

minetest.register_alias("dirt_jungle_savanna_grass", "ebiomes:dirt_with_jungle_savanna_grass")
minetest.register_alias("dirt_jungle_savanna_grass_footsteps", "ebiomes:dirt_with_jungle_savanna_grass_footsteps")

	minetest.register_node("ebiomes:dirt_with_jungle_savanna_grass", {
		description = S("Dirt with Jungle Savanna Grass"),
		tiles = {"ebiomes_jungle_savanna_grass.png", "default_dirt.png",
			{name = "default_dirt.png^ebiomes_jungle_savanna_grass_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
		drop = "default:dirt",
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.25},
		}),
		soil = {
			base = "ebiomes:dirt_with_jungle_savanna_grass",
			dry = "farming:soil",
			wet = "farming:soil_wet"
		}
	})

	minetest.register_node("ebiomes:dirt_with_jungle_savanna_grass_footsteps", {
		description = S("Dirt with Jungle Savanna Grass and Footsteps"),
		tiles = {"ebiomes_jungle_savanna_grass.png^default_footprint.png", "default_dirt.png",
			{name = "default_dirt.png^ebiomes_jungle_savanna_grass_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1, not_in_creative_inventory = 1},
		drop = "default:dry_dirt",
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.25},
		}),
		soil = {
			base = "ebiomes:dirt_with_jungle_savanna_grass",
			dry = "farming:soil",
			wet = "farming:soil_wet"
		}
	})










if minetest.settings:get_bool("reg_hsavanna", true) then

	minetest.register_biome({
		name = "jungle_savanna",
		node_top = "ebiomes:dirt_with_jungle_savanna_grass",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 2,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 31000,
		y_min = 1,
		heat_point = 87,
		humidity_point = 62,
	})

	minetest.register_biome({
		name = "jungle_savanna_shore",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 0,
		y_min = -1,
		heat_point = 87,
		humidity_point = 62,
	})

	minetest.register_biome({
		name = "jungle_savanna_ocean",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_cave_liquid = "default:water_source",
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		vertical_blend = 1,
		y_max = -2,
		y_min = -255,
		heat_point = 87,
		humidity_point = 62,
	})

	minetest.register_biome({
		name = "jungle_savanna_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = -400,
		heat_point = 87,
		humidity_point = 62,
	})

-- Coral

	minetest.register_decoration({
		name = "ebiomes:coral_jsv",
		deco_type = "simple",
		place_on = {"default:sand"},
		place_offset_y = -1,
		sidelen = 4,
		noise_params = {
			offset = -4,
			scale = 4,
			spread = {x = 50, y = 50, z = 50},
			seed = 7013,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {
			"jungle_savanna_ocean",
		},
		y_max = -2,
		y_min = -8,
		flags = "force_placement",
		decoration = {
			"default:coral_green", "default:coral_pink",
			"default:coral_cyan", "default:coral_brown",
			"default:coral_orange", "default:coral_skeleton",
		},
	})


-- Grass

	minetest.register_node("ebiomes:jungle_savanna_grass_1", {
		description = S("Jungle Savanna Grass"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"ebiomes_jungle_savanna_grass_1.png"},
		-- Use texture of a taller grass stage in inventory
		inventory_image = "ebiomes_jungle_savanna_grass_3.png",
		wield_image = "ebiomes_jungle_savanna_grass_3.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1,
		normal_grass = 1, flammable = 1},
		max_items = 1,
			items = {
				{items = {"farming:seed_wheat"}, rarity = 5},
				{items = {"ebiomes:jungle_savanna_grass_1"}},
			},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
		},

		on_place = function(itemstack, placer, pointed_thing)
			-- place a random grass node
			local stack = ItemStack("ebiomes:jungle_savanna_grass_" .. math.random(1,5))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("ebiomes:jungle_savanna_grass_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})

for i = 2, 5 do
	minetest.register_node("ebiomes:jungle_savanna_grass_" .. i, {
		description = S("Jungle Savanna Grass"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"ebiomes_jungle_savanna_grass_" .. i .. ".png"},
		inventory_image = "ebiomes_jungle_savanna_grass_" .. i .. ".png",
		wield_image = "ebiomes_jungle_savanna_grass_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		drop = "ebiomes:jungle_savanna_grass_1",
		groups = {snappy = 3, flora = 1, attached_node = 1,
			not_in_creative_inventory = 1, grass = 1,
			normal_grass = 1, flammable = 1},
		items = {
			{items = {"farming:seed_wheat"}, rarity = 5},
			{items = {"ebiomes:jungle_savanna_grass_1"}},
		},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},
	})
end

	minetest.register_decoration({
		name = "ebiomes:junglegrass_jsv",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_jungle_savanna_grass"},
		sidelen = 80,
		fill_ratio = 0.1,
		biomes = {"jungle_savanna"},
		y_max = 31000,
		y_min = 1,
		decoration = "default:junglegrass",
	})


for length = 1, 5 do
	minetest.register_decoration({
		name = "ebiomes:jungle_savanna_grass_"..length,
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_jungle_savanna_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.1,
			scale = 0.02,
			spread = {x = 100, y = 100, z = 100},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:jungle_savanna_grass_"..length,
	})
end


--Trees

	minetest.register_decoration({
		name = "ebiomes:afzelia_tree_jsv",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_jungle_savanna_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.001,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 201,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"jungle_savanna"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_afzelia_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		name = "ebiomes:afzelia_log_jsv",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_jungle_savanna_grass"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.001,
		biomes = {"jungle_savanna"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_afzelia_log.mts",
		flags = "place_center_x",
		rotation = "random"
	})

if minetest.settings:get_bool("light_mapgen", true) then
	minetest.register_decoration({
		name = "ebiomes:limba_tree_jsv",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_jungle_savanna_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.01,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 202,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"jungle_savanna"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_limba_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
else
	minetest.register_decoration({
		name = "ebiomes:limba_tree_jsv",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_jungle_savanna_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.05,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 202,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"jungle_savanna"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_limba_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end

	minetest.register_decoration({
		name = "ebiomes:limba_log_jsv",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_jungle_savanna_grass"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0025,
		biomes = {"jungle_savanna"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_limba_log.mts",
		flags = "place_center_x",
		rotation = "random"
	})

	minetest.register_decoration({
		name = "ebiomes:tamarind_tree_jsv",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_jungle_savanna_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.004,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 204,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"jungle_savanna"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_tamarind_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		name = "ebiomes:tamarind_log_jsv",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_jungle_savanna_grass"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0009,
		biomes = {"jungle_savanna"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_tamarind_log.mts",
		flags = "place_center_x",
		rotation = "random"
	})




	minetest.register_decoration({
		name = "ebiomes:jungle_tree_jsv",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_jungle_savanna_grass"},
		sidelen = 80,
		fill_ratio = 0.03,
		biomes = {"jungle_savanna"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("default") .. "/schematics/jungle_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

end

--Additionals

--Ground stuff
if minetest.get_modpath("bonemeal") ~= nil then
	bonemeal:add_deco({
		{"ebiomes:dirt_with_jungle_savanna_grass", {"ebiomes:jungle_savanna_grass_1", "ebiomes:jungle_savanna_grass_2", "ebiomes:jungle_savanna_grass_3", "ebiomes:jungle_savanna_grass_4", "ebiomes:jungle_savanna_grass_5"},
			{"default:junglegrass"} }
	})

end
