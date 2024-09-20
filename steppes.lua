local S = minetest.get_translator("ebiomes")

--from runs cooltrees
local modname = "ebiomes"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")

--Aliases

minetest.register_alias("dirt_with_steppe_grass", "ebiomes:dirt_with_grass_steppe")
minetest.register_alias("dirt_with_steppe_grass_footsteps", "ebiomes:dirt_with_grass_steppe_footsteps")
minetest.register_alias("dirt_with_warm_steppe_grass", "ebiomes:dirt_with_grass_steppe_warm")
minetest.register_alias("dirt_with_warm_steppe_grass_footsteps", "ebiomes:dirt_with_grass_steppe_warm_footsteps")
minetest.register_alias("dirt_with_cold_steppe_grass", "ebiomes:dirt_with_grass_steppe_cold")
minetest.register_alias("dirt_with_cold_steppe_grass_footsteps", "ebiomes:dirt_with_grass_steppe_cold_footsteps")

minetest.register_alias("peashrub_peas", "ebiomes:peashrub_peas")
minetest.register_alias("cooked_peas", "ebiomes:peas_cooked")
minetest.register_alias("bucket_with_peas", "ebiomes:bucket_peas")
minetest.register_alias("cooked_peas", "ebiomes:peas_cooked")
minetest.register_alias("peashrub_leaves_with_peas", "ebiomes:peashrub_leaves_with_peas")
minetest.register_alias("peashrub_stem", "ebiomes:peashrub_stem")
minetest.register_alias("peashrub_leaves", "ebiomes:peashrub_leaves")
minetest.register_alias("peashrub_sapling", "ebiomes:peashrub_sapling")

minetest.register_alias("blue_allium", "ebiomes:blue_allium")
minetest.register_alias("purple_blue_allium", "ebiomes:blue_allium_purple")
minetest.register_alias("altai_tulip", "ebiomes:altai_tulip")
minetest.register_alias("russian_iris", "ebiomes:russian_iris")
minetest.register_alias("siberian_lily", "ebiomes:siberian_lily")
minetest.register_alias("mountain_lily", "ebiomes:mountain_lily")

--Steppe

	minetest.register_node("ebiomes:dirt_with_grass_steppe", {
		description = S("Dirt with Steppe Grass"),
		tiles = {"ebiomes_grass_steppe.png", "default_dirt.png",
			{name = "default_dirt.png^ebiomes_grass_steppe_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
		drop = "default:dirt",
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.25},
		}),
		soil = {
			base = "ebiomes:dirt_with_grass_steppe",
			dry = "farming:soil",
			wet = "farming:soil_wet"
		}
	})

	minetest.register_node("ebiomes:dirt_with_grass_steppe_footsteps", {
		description = S("Dirt with Steppe Grass and Footsteps"),
		tiles = {"ebiomes_grass_steppe.png^default_footprint.png", "default_dirt.png",
			{name = "default_dirt.png^ebiomes_grass_steppe_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1, not_in_creative_inventory = 1},
		drop = "default:dirt",
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.25},
		}),
	})

	minetest.register_node("ebiomes:grass_steppe_1", {
		description = S("Steppe Grass"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"ebiomes_grass_steppe_1.png"},
		-- Use texture of a taller grass stage in inventory
		inventory_image = "ebiomes_grass_steppe_3.png",
		wield_image = "ebiomes_grass_steppe_3.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
			groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1,
		normal_grass = 1, flammable = 1},
		max_items = 1,
			items = {
				{items = {"farming:seed_wheat"}, rarity = 5},
				{items = {"ebiomes:grass_steppe_1"}},
			},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
		},

		on_place = function(itemstack, placer, pointed_thing)
			-- place a random grass node
			local stack = ItemStack("ebiomes:grass_steppe_" .. math.random(1,5))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("ebiomes:grass_steppe_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})

for i = 2, 5 do
	minetest.register_node("ebiomes:grass_steppe_" .. i, {
		description = S("Steppe Grass"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"ebiomes_grass_steppe_" .. i .. ".png"},
		inventory_image = "ebiomes_grass_steppe_" .. i .. ".png",
		wield_image = "ebiomes_grass_steppe_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		drop = "ebiomes:grass_steppe_1",
		groups = {snappy = 3, flora = 1, attached_node = 1,
			not_in_creative_inventory = 1, grass = 1,
			normal_grass = 1, flammable = 1},
		items = {
			{items = {"farming:seed_wheat"}, rarity = 5},
			{items = {"ebiomes:grass_steppe_1"}},
		},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},
	})
end

	minetest.register_biome({
		name = "steppe",
		node_top = "ebiomes:dirt_with_grass_steppe",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 1,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 31000,
		y_min = 6,
		heat_point = 35,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "steppe_dunes",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 2,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		vertical_blend = 1,
		y_max = 5,
		y_min = 4,
		heat_point = 35,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "steppe_ocean",
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
		y_max = 3,
		y_min = -255,
		heat_point = 35,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "steppe_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = -400,
		heat_point = 35,
		humidity_point = 35,
	})

for length = 1, 5 do
	minetest.register_decoration({
		name = "ebiomes:grass_steppe_"..length,
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_steppe"},
		sidelen = 16,
		noise_params = {
			offset = 0.05,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:grass_steppe_"..length,
	})
end

--Warm Steppe

	minetest.register_node("ebiomes:dirt_with_grass_steppe_warm", {
		description = S("Dirt with Warm Steppe Grass"),
		tiles = {"ebiomes_grass_steppe_warm.png", "default_dirt.png",
			{name = "default_dirt.png^ebiomes_grass_steppe_warm_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
		drop = "default:dirt",
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.25},
		}),
		soil = {
			base = "ebiomes:dirt_with_grass_steppe_warm",
			dry = "farming:soil",
			wet = "farming:soil_wet"
		}
	})

	minetest.register_node("ebiomes:dirt_with_grass_steppe_warm_footsteps", {
		description = S("Dirt with steppeiterranean Grass and Footsteps"),
		tiles = {"ebiomes_grass_steppe_warm.png^default_footprint.png", "default_dirt.png",
			{name = "default_dirt.png^ebiomes_grass_steppe_warm_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1, not_in_creative_inventory = 1},
		drop = "default:dirt",
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.25},
		}),
	})

	minetest.register_node("ebiomes:grass_steppe_warm_1", {
		description = S("Warm Steppe Grass"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"ebiomes_grass_steppe_warm_1.png"},
		-- Use texture of a taller grass_warm stage in inventory
		inventory_image = "ebiomes_grass_steppe_warm_3.png",
		wield_image = "ebiomes_grass_steppe_warm_3.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
			groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1,
		normal_grass = 1, flammable = 1},
		max_items = 1,
			items = {
				{items = {"farming:seed_wheat"}, rarity = 5},
				{items = {"ebiomes:grass_steppe_warm_1"}},
			},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
		},

		on_place = function(itemstack, placer, pointed_thing)
			-- place a random grass_warm node
			local stack = ItemStack("ebiomes:grass_steppe_warm_" .. math.random(1,5))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("ebiomes:grass_steppe_warm_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})

for i = 2, 5 do
	minetest.register_node("ebiomes:grass_steppe_warm_" .. i, {
		description = S("Warm Steppe Grass"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"ebiomes_grass_steppe_warm_" .. i .. ".png"},
		inventory_image = "ebiomes_grass_steppe_warm_" .. i .. ".png",
		wield_image = "ebiomes_grass_steppe_warm_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		drop = "ebiomes:grass_steppe_warm_1",
		groups = {snappy = 3, flora = 1, attached_node = 1,
			not_in_creative_inventory = 1, grass = 1,
			normal_grass = 1, flammable = 1},
		items = {
			{items = {"farming:seed_wheat"}, rarity = 5},
			{items = {"ebiomes:grass_steppe_warm_1"}},
		},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},
	})
end

	minetest.register_biome({
		name = "warm_steppe",
		node_top = "ebiomes:dirt_with_grass_steppe_warm",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 1,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 31000,
		y_min = 6,
		heat_point = 40,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "warm_steppe_dunes",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 2,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		vertical_blend = 1,
		y_max = 5,
		y_min = 4,
		heat_point = 40,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "warm_steppe_ocean",
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
		y_max = 3,
		y_min = -255,
		heat_point = 40,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "warm_steppe_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = -400,
		heat_point = 40,
		humidity_point = 35,
	})

for length = 1, 5 do
	minetest.register_decoration({
		name = "ebiomes:grass_steppe_warm_"..length,
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_steppe_warm"},
		sidelen = 16,
		noise_params = {
			offset = 0.05,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:grass_steppe_warm_"..length,
	})
end

--Cold Steppe

	minetest.register_node("ebiomes:dirt_with_grass_steppe_cold", {
		description = S("Dirt with Cold Steppe Grass"),
		tiles = {"ebiomes_grass_steppe_cold.png", "default_dirt.png",
			{name = "default_dirt.png^ebiomes_grass_steppe_cold_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
		drop = "default:dirt",
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.25},
		}),
	})

	minetest.register_node("ebiomes:dirt_with_grass_steppe_cold_footsteps", {
		description = S("Dirt with steppeiterranean Grass and Footsteps"),
		tiles = {"ebiomes_grass_steppe_cold.png^default_footprint.png", "default_dirt.png",
			{name = "default_dirt.png^ebiomes_grass_steppe_cold_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1, not_in_creative_inventory = 1},
		drop = "default:dirt",
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.25},
		}),
	})

	minetest.register_node("ebiomes:grass_steppe_cold_1", {
		description = S("Cold Steppe Grass"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"ebiomes_grass_steppe_cold_1.png"},
		-- Use texture of a taller grass stage in inventory
		inventory_image = "ebiomes_grass_steppe_cold_3.png",
		wield_image = "ebiomes_grass_steppe_cold_3.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
			groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1,
		normal_grass = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
		},

		on_place = function(itemstack, placer, pointed_thing)
			-- place a random grass node
			local stack = ItemStack("ebiomes:grass_steppe_cold_" .. math.random(1,5))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("ebiomes:grass_steppe_cold_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})

for i = 2, 5 do
	minetest.register_node("ebiomes:grass_steppe_cold_" .. i, {
		description = S("Cold Steppe Grass"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"ebiomes_grass_steppe_cold_" .. i .. ".png"},
		inventory_image = "ebiomes_grass_steppe_cold_" .. i .. ".png",
		wield_image = "ebiomes_grass_steppe_cold_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		drop = "ebiomes:grass_steppe_cold_1",
		groups = {snappy = 3, flora = 1, attached_node = 1,
			not_in_creative_inventory = 1, grass = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},
	})
end

	minetest.register_biome({
		name = "cold_steppe",
		node_top = "ebiomes:dirt_with_grass_steppe_cold",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 1,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 31000,
		y_min = 6,
		heat_point = 25,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "cold_steppe_dunes",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 2,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		vertical_blend = 1,
		y_max = 5,
		y_min = 4,
		heat_point = 25,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "cold_steppe_ocean",
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
		y_max = 3,
		y_min = -255,
		heat_point = 25,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "cold_steppe_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = -400,
		heat_point = 25,
		humidity_point = 35,
	})

for length = 1, 5 do
	minetest.register_decoration({
		name = "ebiomes:grass_steppe_cold_"..length,
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_steppe_cold"},
		sidelen = 16,
		noise_params = {
			offset = 0.04,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:grass_steppe_cold_"..length,
	})
end

--Folliage

--Biome specific

	minetest.register_node("ebiomes:blue_allium", {
		description = S("Blue Allium"),
		tiles = {"ebiomes_blue_allium.png"},
		inventory_image = "ebiomes_blue_allium.png",
		wield_image = "ebiomes_blue_allium.png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {flower = 1, snappy = 3, attached_node = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, -1 / 16, 4 / 16},
		}
	})

    minetest.register_craft({
		output = "dye:blue 4",
		recipe = {
			{"ebiomes:blue_allium"}
		},
	})

	minetest.register_decoration({
		name = "ebiomes:blue_allium",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_steppe"},
		sidelen = 16,
		noise_params = {
			offset = 0.008,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 333,
			octaves = 3,
			persist = 0.004
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:blue_allium",
	})

	minetest.register_node("ebiomes:blue_allium_purple", {
		description = S("Purple Blue Allium"),
		tiles = {"ebiomes_blue_allium_purple.png"},
		inventory_image = "ebiomes_blue_allium_purple.png",
		wield_image = "ebiomes_blue_allium_purple.png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {flower = 1, snappy = 3, attached_node = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, -1 / 16, 4 / 16},
		}
	})

    minetest.register_craft({
		output = "dye:violet 4",
		recipe = {
			{"ebiomes:blue_allium_purple"}
		},
	})

	minetest.register_decoration({
		name = "ebiomes:blue_allium_purple",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_steppe"},
		sidelen = 16,
		noise_params = {
			offset = 0.004,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 335,
			octaves = 3,
			persist = 0.03
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:blue_allium_purple",
	})

	minetest.register_node("ebiomes:altai_tulip", {
		description = S("Altai Tulip"),
		tiles = {"ebiomes_altai_tulip.png"},
		inventory_image = "ebiomes_altai_tulip.png",
		wield_image = "ebiomes_altai_tulip.png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {flower = 1, snappy = 3, attached_node = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, -1 / 16, 4 / 16},
		}
	})

    minetest.register_craft({
		output = "dye:yellow 4",
		recipe = {
			{"ebiomes:altai_tulip"}
		},
	})

	minetest.register_decoration({
		name = "ebiomes:altai_tulip",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_steppe"},
		sidelen = 16,
		noise_params = {
			offset = 0.006,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 350,
			octaves = 3,
			persist = 0.05
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:altai_tulip",
	})

	--warm

	minetest.register_node("ebiomes:russian_iris", {
		description = S("Russian Iris"),
		tiles = {"ebiomes_russian_iris.png"},
		inventory_image = "ebiomes_russian_iris.png",
		wield_image = "ebiomes_russian_iris.png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {flower = 1, snappy = 3, attached_node = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, -1 / 16, 4 / 16},
		}
	})

    minetest.register_craft({
		output = "dye:blue 4",
		recipe = {
			{"ebiomes:russian_iris"}
		},
	})

	minetest.register_decoration({
		name = "ebiomes:russian_iris",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_steppe_warm"},
		sidelen = 16,
		noise_params = {
			offset = 0.008,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 350,
			octaves = 3,
			persist = 0.05
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:russian_iris",
	})

	--cold

	minetest.register_node("ebiomes:siberian_lily", {
		description = S("Siberian Lily"),
		tiles = {"ebiomes_siberian_lily.png"},
		inventory_image = "ebiomes_siberian_lily.png",
		wield_image = "ebiomes_siberian_lily.png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {flower = 1, snappy = 3, attached_node = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, -1 / 16, 3 / 16},
		}
	})

    minetest.register_craft({
		output = "dye:orange 4",
		recipe = {
			{"ebiomes:siberian_lily"}
		},
	})

	minetest.register_decoration({
		name = "ebiomes:siberian_lily",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_steppe_cold"},
		sidelen = 16,
		noise_params = {
			offset = 0.006,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 350,
			octaves = 3,
			persist = 0.05
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:siberian_lily",
	})


	minetest.register_node("ebiomes:mountain_lily", {
		description = S("Mountain Lily"),
		tiles = {"ebiomes_mountain_lily.png"},
		inventory_image = "ebiomes_mountain_lily.png",
		wield_image = "ebiomes_mountain_lily.png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {flower = 1, snappy = 3, attached_node = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, -1 / 16, 4 / 16},
		}
	})

    minetest.register_craft({
		output = "dye:blue 4",
		recipe = {
			{"ebiomes:mountain_lily"}
		},
	})

	minetest.register_decoration({
		name = "ebiomes:mountain_lily",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_steppe_cold"},
		sidelen = 16,
		noise_params = {
			offset = 0.006,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 351,
			octaves = 3,
			persist = 0.05
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:mountain_lily",
	})



local function grow_new_peashrub(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-1, y = pos.y, z = pos.z-1}, modpath.."/schematics/ebiomes_peashrub.mts", "0", nil, false)
end


	minetest.register_craftitem("ebiomes:peashrub_peas", {
		description = S("Peashrub Peas"),
		inventory_image = "ebiomes_peashrub_peas.png",
		groups = {cooking_peas = 1},
	})

	minetest.register_craftitem("ebiomes:peas_cooked", {
		description = S("Cooked Peas"),
		inventory_image = "ebiomes_peas_cooked.png",
		groups = {food_peas = 1, eatable = 5},
		on_use = minetest.item_eat(5),
	})

	minetest.register_craftitem("ebiomes:bucket_peas", {
		description = S("Bucket of Peas"),
		inventory_image = "ebiomes_bucket_peas.png",
		groups = {cookables_peas = 1},
	})

	minetest.register_craft({
		output = "ebiomes:bucket_peas",
		recipe = {
            {"group:cooking_peas"},
			{"bucket:bucket_water"},
		}
	})

	minetest.register_craft({
		output = "ebiomes:bucket_peas",
		recipe = {
            {"group:cooking_peas"},
			{"bucket:bucket_river_water"},
		}
	})

	minetest.register_craft({
		type = "cooking",
		output = "ebiomes:peas_cooked",
		recipe = "ebiomes:bucket_peas",
		replacements = {{"ebiomes:bucket_peas", "bucket:bucket_empty"}},
		cooktime = 5,
	})

	minetest.register_node("ebiomes:peashrub_leaves_with_peas", {
		description = S("Peashrub Bush Leaves with Peas"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_peashrub_leaves.png^ebiomes_peashrub_overlay.png"},
		paramtype = "light",
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, dig_immediate = 3},
		drop = "ebiomes:peashrub_peas",
		sounds = default.node_sound_leaves_defaults(),
		node_dig_prediction = "ebiomes:peashrub_leaves",

		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			minetest.set_node(pos, {name = "ebiomes:peashrub_leaves"})
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,
	})


	minetest.register_node("ebiomes:peashrub_leaves", {
		description = S("Peashrub Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_peashrub_leaves.png"},
		paramtype = "light",
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:peashrub_sapling"}, rarity = 5},
				{items = {"ebiomes:peashrub_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		on_timer = function(pos, elapsed)
			if minetest.get_node_light(pos) < 11 then
				minetest.get_node_timer(pos):start(200)
			else
				minetest.set_node(pos, {name = "ebiomes:peashrub_leaves_with_peas"})
			end
		end,

		after_place_node = default.after_place_leaves,
	})

	default.register_leafdecay({
		trunks = {"default:pine_bush_stem"},
		leaves = {"ebiomes:peashrub_leaves", "ebiomes:peashrub_leaves_with_peas"},
		radius = 3,
	})

	minetest.register_node("ebiomes:peashrub_sapling", {
		description = S("Peashrub Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_peashrub_sapling.png"},
		inventory_image = "ebiomes_peashrub_sapling.png",
		wield_image = "ebiomes_peashrub_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_peashrub,
		selection_box = {
			type = "fixed",
			fixed = {-2 / 16, -0.5, -2 / 16, 2 / 16, 5 / 16, 2 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2,
			attached_node = 1, sapling = 1},
		sounds = default.node_sound_leaves_defaults(),

		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
				"ebiomes:peashrub_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				{x = -1, y = 0, z = -1},
				{x = 1, y = 3, z = 1},
				-- maximum interval of interior volume check
				2)

			return itemstack
		end,
	})

	minetest.register_decoration({
		name = "ebiomes:peashrub",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_steppe", "ebiomes:dirt_with_grass_steppe_cold"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 969,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"steppe", "cold_steppe"},
		y_max = 31000,
		y_min = 1,
		place_offset_y = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_peashrub.mts",
		flags = "place_center_x, place_center_z",
	})

if minetest.get_modpath("bonemeal") ~= nil then
	bonemeal:add_sapling({
		{"ebiomes:peashrub_sapling", grow_new_peashrub, "soil"},
	})
end

--Dungeon loot

if minetest.global_exists("dungeon_loot") then
	dungeon_loot.register ({
		{name = "ebiomes:peashrub_peas", chance = 0.3, count = {2, 4}},
	})
end

--Bonemeal
if minetest.get_modpath("bonemeal") then
	bonemeal:add_deco({
		{"ebiomes:dirt_with_grass_steppe", {"ebiomes:grass_steppe_1", "ebiomes:grass_steppe_2", "ebiomes:grass_steppe_3", "ebiomes:grass_steppe_4", "ebiomes:grass_steppe_5"},
			{"ebiomes:altai_tulip", "ebiomes:blue_allium", "ebiomes:blue_allium_purple"} }
	})

	bonemeal:add_deco({
		{"ebiomes:dirt_with_grass_steppe_warm", {"ebiomes:grass_steppe_warm_1", "ebiomes:grass_steppe_warm_2", "ebiomes:grass_steppe_warm_3", "ebiomes:grass_steppe_warm_4", "ebiomes:grass_steppe_warm_5"},
			{"ebiomes:russian_iris", "flowers:dandelion_yellow", "flowers:dandelion_white"} }
	})

	bonemeal:add_deco({
		{"ebiomes:dirt_with_grass_steppe_cold", {"ebiomes:grass_steppe_cold_1", "ebiomes:grass_steppe_cold_2", "ebiomes:grass_steppe_cold_3", "ebiomes:grass_steppe_cold_4", "ebiomes:grass_steppe_cold_5"},
			{"ebiomes:mountain_lily", "ebiomes:siberian_lily"} }
	})
end

--Peripheral mod support

-- Support for flowerpot
if minetest.global_exists("flowerpot") then

	flowerpot.register_node("ebiomes:peashrub_sapling")

	flowerpot.register_node("ebiomes:blue_allium")
	flowerpot.register_node("ebiomes:blue_allium_purple")
	flowerpot.register_node("ebiomes:russian_iris")
	flowerpot.register_node("ebiomes:mountain_lily")
	flowerpot.register_node("ebiomes:siberian_lily")
	flowerpot.register_node("ebiomes:altai_tulip")

end
