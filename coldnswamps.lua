local S = minetest.get_translator("ebiomes")

--from runs cooltrees
local modname = "ebiomes"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")

--Aliases

minetest.register_alias("dirt_cold_grass", "ebiomes:dirt_with_grass_cold")
minetest.register_alias("dirt_with_cold_grass_footsteps", "ebiomes:dirt_with_grass_cold_footsteps")
minetest.register_alias("dirt_with_swamp_grass", "ebiomes:dirt_with_grass_swamp")
minetest.register_alias("dirt_with_swamp_grass_footsteps", "ebiomes:dirt_with_grass_swamp_footsteps")
minetest.register_alias("swamp_water", "ebiomes:swamp_water_source")
minetest.register_alias("wet_peat_with_green_swamp_moss", "ebiomes:peat_wet_with_swamp_moss_green")
minetest.register_alias("wet_peat_with_green_swamp_moss_footsteps", "ebiomes:peat_wet_with_swamp_moss_green_footsteps")
minetest.register_alias("peat_with_yellow_swamp_moss", "ebiomes:peat_with_swamp_moss_yellow")
minetest.register_alias("peat_with_yellow_swamp_moss_footsteps", "ebiomes:peat_with_swamp_moss_yellow_footsteps")

minetest.register_alias("reeds", "ebiomes:reeds")
minetest.register_alias("green_marsh_grass", "ebiomes:marsh_grass_green")
minetest.register_alias("yellow_marsh_grass", "ebiomes:marsh_grass_yellow")

minetest.register_alias("blackcurrant_bush_leaves", "ebiomes:blackcurrant_bush_leaves")
minetest.register_alias("blackcurrant_bush_leaves", "ebiomes:blackcurrant_bush_leaves_with_berries")
minetest.register_alias("blackcurrant_bush_sapling", "ebiomes:blackcurrant_bush_sapling")
minetest.register_alias("blackcurrants", "ebiomes:blackcurrants")
minetest.register_alias("redcurrant_bush_leaves", "ebiomes:redcurrant_bush_leaves")
minetest.register_alias("redcurrant_bush_leaves", "ebiomes:redcurrant_bush_leaves_with_berries")
minetest.register_alias("redcurrant_bush_sapling", "ebiomes:redcurrant_bush_sapling")
minetest.register_alias("redcurrants", "ebiomes:redcurrants")
minetest.register_alias("gooseberry_bush_leaves", "ebiomes:gooseberry_bush_leaves")
minetest.register_alias("gooseberry_bush_leaves", "ebiomes:gooseberry_bush_leaves_with_berries")
minetest.register_alias("gooseberry_bush_sapling", "ebiomes:gooseberry_bush_sapling")
minetest.register_alias("gooseberries", "ebiomes:gooseberries")

minetest.register_alias("cranberry_patch", "ebiomes:cranberry_patch")
minetest.register_alias("cranberries", "ebiomes:cranberries")
minetest.register_alias("sundew", "ebiomes:sundew")
minetest.register_alias("marigold", "ebiomes:marigold")
minetest.register_alias("marsh_stitchwort", "ebiomes:marsh_stitchwort")

minetest.register_alias("alder_tree", "ebiomes:alder_tree")
minetest.register_alias("alder_wood", "ebiomes:alder_wood")
minetest.register_alias("alder_leaves", "ebiomes:alder_leaves")
minetest.register_alias("alder_sapling", "ebiomes:alder_sapling")
minetest.register_alias("ash_tree", "ebiomes:ash_tree")
minetest.register_alias("ash_wood", "ebiomes:ash_wood")
minetest.register_alias("ash_leaves", "ebiomes:ash_leaves")
minetest.register_alias("ash_sapling", "ebiomes:ash_sapling")
minetest.register_alias("birch_tree", "ebiomes:birch_tree")
minetest.register_alias("birch_wood", "ebiomes:birch_wood")
minetest.register_alias("birch_leaves", "ebiomes:birch_leaves")
minetest.register_alias("birch_sapling", "ebiomes:birch_sapling")
minetest.register_alias("willow_tree", "ebiomes:willow_tree")
minetest.register_alias("willow_wood", "ebiomes:willow_wood")
minetest.register_alias("willow_leaves", "ebiomes:willow_leaves")
minetest.register_alias("willow_sapling", "ebiomes:willow_sapling")

minetest.register_alias("downy_birch_tree", "ebiomes:downy_birch_tree")
minetest.register_alias("downy_birch_wood", "ebiomes:downy_birch_wood")
minetest.register_alias("downy_birch_leaves", "ebiomes:downy_birch_leaves")
minetest.register_alias("downy_birch_sapling", "ebiomes:downy_birch_sapling")

--Cold deciduous

	minetest.register_node("ebiomes:dirt_with_grass_cold", {
		description = S("Dirt with Cold Grass"),
		tiles = {"ebiomes_grass_cold.png", "default_dirt.png",
			{name = "default_dirt.png^ebiomes_grass_cold_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
		drop = "default:dirt",
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.25},
		}),
		soil = {
			base = "ebiomes:dirt_with_grass_cold",
			dry = "farming:soil",
			wet = "farming:soil_wet"
		}
	})

	minetest.register_node("ebiomes:dirt_with_grass_cold_footsteps", {
		description = S("Dirt with Cold Grass and Footsteps"),
		tiles = {"ebiomes_grass_cold.png^default_footprint.png", "default_dirt.png",
			{name = "default_dirt.png^ebiomes_grass_cold_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1, not_in_creative_inventory = 1},
		drop = "default:dirt",
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.25},
		}),
	})

	minetest.register_node("ebiomes:grass_cold_1", {
		description = S("Cold Grass"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"ebiomes_grass_cold_1.png"},
		-- Use texture of a taller grass stage in inventory
		inventory_image = "ebiomes_grass_cold_3.png",
		wield_image = "ebiomes_grass_cold_3.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
			groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1,
		normal_grass = 1, flammable = 1},
		max_items = 1,
			items = {
				{items = {"farming:seed_wheat"}, rarity = 5},
				{items = {"ebiomes:grass_cold_1"}},
			},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
		},

		on_place = function(itemstack, placer, pointed_thing)
			-- place a random grass node
			local stack = ItemStack("ebiomes:grass_cold_" .. math.random(1,5))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("ebiomes:grass_cold_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})

for i = 2, 5 do
	minetest.register_node("ebiomes:grass_cold_" .. i, {
		description = S("Cold Grass"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"ebiomes_grass_cold_" .. i .. ".png"},
		inventory_image = "ebiomes_grass_cold_" .. i .. ".png",
		wield_image = "ebiomes_grass_cold_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		drop = "ebiomes:grass_cold_1",
		groups = {snappy = 3, flora = 1, attached_node = 1,
			not_in_creative_inventory = 1, grass = 1,
			normal_grass = 1, flammable = 1},
		items = {
			{items = {"farming:seed_wheat"}, rarity = 5},
			{items = {"ebiomes:grass_cold_1"}},
		},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},
	})
end

	minetest.register_biome({
		name = "deciduous_forest_cold",
		node_top = "ebiomes:dirt_with_grass_cold",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 31000,
		y_min = 4,
		heat_point = 53,
		humidity_point = 75,
	})

	minetest.register_biome({
		name = "deciduous_forest_cold_shore",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 3,
		y_min = -1,
		heat_point = 53,
		humidity_point = 75,
	})

	minetest.register_biome({
		name = "deciduous_forest_cold_ocean",
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
		heat_point = 53,
		humidity_point = 75,
	})

	minetest.register_biome({
		name = "deciduous_forest_cold_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = -400,
		heat_point = 53,
		humidity_point = 75,
	})

for length = 1, 5 do
	minetest.register_decoration({
		name = "ebiomes:grass_cold_"..length,
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_cold"},
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
		decoration = "ebiomes:grass_cold_"..length,
	})
end

--Swamp

	minetest.register_node("ebiomes:dirt_with_grass_swamp", {
		description = S("Dirt with Swamp Grass"),
		tiles = {"ebiomes_grass_swamp.png", "default_dirt.png",
			{name = "default_dirt.png^ebiomes_grass_swamp_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
		drop = "default:dirt",
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.25},
		}),
	})

	minetest.register_node("ebiomes:dirt_with_grass_swamp_footsteps", {
		description = S("Dirt with Swamp Grass and Footsteps"),
		tiles = {"ebiomes_grass_swamp.png^default_footprint.png", "default_dirt.png",
			{name = "default_dirt.png^ebiomes_grass_swamp_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1, not_in_creative_inventory = 1},
		drop = "default:dirt",
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.25},
		}),
	})

	minetest.register_node("ebiomes:grass_swamp_1", {
		description = S("Swamp Grass"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"ebiomes_grass_swamp_1.png"},
		-- Use texture of a taller grass stage in inventory
		inventory_image = "ebiomes_grass_swamp_3.png",
		wield_image = "ebiomes_grass_swamp_3.png",
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
			local stack = ItemStack("ebiomes:grass_swamp_" .. math.random(1,5))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("ebiomes:grass_swamp_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})

for i = 2, 5 do
	minetest.register_node("ebiomes:grass_swamp_" .. i, {
		description = S("Swamp Grass"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"ebiomes_grass_swamp_" .. i .. ".png"},
		inventory_image = "ebiomes_grass_swamp_" .. i .. ".png",
		wield_image = "ebiomes_grass_swamp_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		drop = "ebiomes:grass_swamp_1",
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
		name = "swamp",
		node_top = "ebiomes:dirt_with_grass_swamp",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 8,
		y_min = 1,
		heat_point = 53,
		humidity_point = 85,
	})

	minetest.register_biome({
		name = "swamp_shore",
		node_top = "default:dirt",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 0,
		y_min = -1,
		heat_point = 53,
		humidity_point = 85,
	})

	minetest.register_biome({
		name = "swamp_ocean",
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
		heat_point = 53,
		humidity_point = 85,
	})

	minetest.register_biome({
		name = "swamp_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = -400,
		heat_point = 53,
		humidity_point = 85,
	})


	minetest.register_node("ebiomes:swamp_water_source", {
		description = S("Swamp Water Source"),
		drawtype = "liquid",
		tiles = {
			{
				name = "ebiomes_swamp_water_source_animated.png",
				backface_culling = false,
				animation = {
					type = "vertical_frames",
					aspect_w = 16,
					aspect_h = 16,
					length = 2.0,
				},
			},
			{
				name = "ebiomes_swamp_water_source_animated.png",
				backface_culling = true,
				animation = {
					type = "vertical_frames",
					aspect_w = 16,
					aspect_h = 16,
					length = 2.0,
				},
			},
		},
		use_texture_alpha = "blend",
		paramtype = "light",
		walkable = false,
		pointable = false,
		diggable = false,
		buildable_to = true,
		is_ground_content = false,
		drop = "",
		drowning = 1,
		liquidtype = "source",
		liquid_alternative_flowing = "ebiomes:swamp_water_flowing",
		liquid_alternative_source = "ebiomes:swamp_water_source",
		liquid_viscosity = 1,
		-- Not renewable to avoid horizontal spread of water sources in sloping
		-- rivers that can cause water to overflow riverbanks and cause floods.
		-- River water source is instead made renewable by the 'force renew'
		-- option used in the 'bucket' mod by the river water bucket.
		liquid_renewable = false,
		liquid_range = 2,
		post_effect_color = {a = 128, r = 30, g = 80, b = 39},
		groups = {water = 3, liquid = 3, cools_lava = 1},
		sounds = default.node_sound_water_defaults(),
	})

	minetest.register_node("ebiomes:swamp_water_flowing", {
		description = S("Swamp Water"),
		drawtype = "flowingliquid",
		tiles = {"ebiomes_swamp_water.png"},
		special_tiles = {
			{
				name = "ebiomes_swamp_water_flowing_animated.png",
				backface_culling = false,
				animation = {
					type = "vertical_frames",
					aspect_w = 16,
					aspect_h = 16,
					length = 0.5,
				},
			},
			{
				name = "ebiomes_swamp_water_flowing_animated.png",
				backface_culling = true,
				animation = {
					type = "vertical_frames",
					aspect_w = 16,
					aspect_h = 16,
					length = 0.5,
				},
			},
		},
		use_texture_alpha = "blend",
		paramtype = "light",
		paramtype2 = "flowingliquid",
		walkable = false,
		pointable = false,
		diggable = false,
		buildable_to = true,
		is_ground_content = false,
		drop = "",
		drowning = 1,
		liquidtype = "flowing",
		liquid_alternative_flowing = "ebiomes:swamp_water_flowing",
		liquid_alternative_source = "ebiomes:swamp_water_source",
		liquid_viscosity = 1,
		liquid_renewable = false,
		liquid_range = 2,
		post_effect_color = {a = 128, r = 30, g = 80, b = 39},
		groups = {water = 3, liquid = 3, not_in_creative_inventory = 1,
			cools_lava = 1},
		sounds = default.node_sound_water_defaults(),
	})


	bucket.register_liquid(
		"ebiomes:swamp_water_source",
		"ebiomes:swamp_water_flowing",
		"ebiomes:bucket_swamp_water",
		"ebiomes_bucket_swamp_water.png",
		S("Swamp Water Bucket"),
		{tool = 1, water_bucket = 1},
		true
	)


for length = 1, 5 do
	minetest.register_decoration({
		name = "ebiomes:grass_swamp_"..length,
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_swamp"},
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
		decoration = "ebiomes:grass_swamp_"..length,
	})
end


--Bog


--Peats

	minetest.register_node("ebiomes:peat", {
		description = S("Peat"),
		tiles = {"ebiomes_peat.png"},
		groups = {crumbly = 3, soil = 1},
		sounds = default.node_sound_dirt_defaults(),
	})

	minetest.register_node("ebiomes:peat_with_swamp_moss_yellow", {
		description = S("Peat with Yellow Swamp Moss"),
		tiles = {"ebiomes_swamp_moss_yellow.png", "ebiomes_peat.png",
			{name = "ebiomes_peat.png^ebiomes_swamp_moss_yellow_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
		drop = "ebiomes:peat",
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.25},
		}),
	})

	minetest.register_node("ebiomes:peat_with_swamp_moss_yellow_footsteps", {
		description = S("Peat with Yellow Swamp Moss and Footsteps"),
		tiles = {"ebiomes_swamp_moss_yellow.png^default_footprint.png", "ebiomes_peat.png",
			{name = "ebiomes_peat.png^ebiomes_swamp_moss_yellow_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1, not_in_creative_inventory = 1},
		drop = "ebiomes:peat",
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.25},
		}),
	})

	minetest.register_node("ebiomes:peat_dry", {
		description = S("Dry Peat"),
		tiles = {"ebiomes_peat_dry.png"},
		groups = {crumbly = 3, soil = 1},
		sounds = default.node_sound_dirt_defaults(),
	})

	minetest.register_node("ebiomes:peat_wet", {
		description = S("Wet Peat"),
		tiles = {"ebiomes_peat_wet.png"},
		drop = "ebiomes:peat_wet",
		liquid_viscosity = 15,
		liquidtype = "source",
		liquid_alternative_flowing = "ebiomes:peat_wet",
		liquid_alternative_source = "ebiomes:peat_wet",
		liquid_renewable = false,
		liquid_range = 0,
		drowning = 1,
		walkable = false,
		climbable = false,
		groups = {crumbly = 3, soil = 1, liquid = 3, disable_jump = 1},
		sounds = default.node_sound_dirt_defaults(),
	})



--peat
--Wet peat made from a code saple of ethereal quicksand

	minetest.register_node("ebiomes:peat_wet_with_swamp_moss_green", {
		description = S("Wet Peat with Green Swamp Moss"),
		tiles = {"ebiomes_swamp_moss_green.png", "ebiomes_peat_wet.png",
			{name = "ebiomes_peat_wet.png^ebiomes_swamp_moss_green_side.png",
				tileable_vertical = false}},
		drop = "ebiomes:peat_wet",
		liquid_viscosity = 15,
		liquidtype = "source",
		liquid_alternative_flowing = "ebiomes:peat_wet_with_swamp_moss_green",
		liquid_alternative_source = "ebiomes:peat_wet_with_swamp_moss_green",
		liquid_renewable = false,
		liquid_range = 0,
		drowning = 1,
		walkable = false,
		climbable = false,
		groups = {crumbly = 3, soil = 1, liquid = 3, disable_jump = 1},
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.25},
		}),
	})

	minetest.register_node("ebiomes:peat_wet_with_swamp_moss_green_footsteps", {
		description = S("Wet Peat with Green Swamp Moss and Footsteps"),
		tiles = {"ebiomes_swamp_moss_green.png^default_footprint.png", "ebiomes_peat_wet.png",
			{name = "ebiomes_peat_wet.png^ebiomes_swamp_moss_green_side.png",
				tileable_vertical = false}},
		drop = "ebiomes:peat_wet",
		liquid_viscosity = 15,
		liquidtype = "source",
		liquid_alternative_flowing = "ebiomes:peat_wet_with_swamp_moss_green_footsteps",
		liquid_alternative_source = "ebiomes:peat_wet_with_swamp_moss_green_footsteps",
		liquid_renewable = false,
		liquid_range = 0,
		drowning = 1,
		walkable = false,
		climbable = false,
		groups = {crumbly = 3, soil = 1, liquid = 3, disable_jump = 1},
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.25},
		}),
	})

--crafts

	minetest.register_craft({
		output = "ebiomes:peat",
		recipe = {
			{"ebiomes:peat_wet"},
		}
	})

	minetest.register_craft({
		type = "shapeless",
		output = "ebiomes:peat_wet",
		recipe = {"ebiomes:peat", "group:water_bucket"},
		replacements = {{"group:water_bucket", "bucket:bucket_empty"}}
	})

	minetest.register_craft({
		type = "cooking",
		output = "ebiomes:peat_dry",
		recipe = "ebiomes:peat",
		burntime = 4
	})

	minetest.register_craft({
		type = "shapeless",
		output = "ebiomes:peat",
		recipe = {"ebiomes:peat_dry", "group:water_bucket"},
		replacements = {{"group:water_bucket", "bucket:bucket_empty"}}
	})


	stairs.register_stair_and_slab("peat_dry", "ebiomes:peat_dry",
		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		{"ebiomes_peat_dry.png"},
		S("Dry Peat Stair"),
		S("Dry Peat Slab"),
		default.node_sound_dirt_defaults(),
		true,
		S("Inner Dry Peat Stair"),
		S("Outer Dry Peat Stair")
	)


	minetest.register_craftitem("ebiomes:burning_peat", {
		description = S("Burning Peat"),
		inventory_image = "ebiomes_burning_peat.png"
	})

	minetest.register_craft({
		type = "shapeless",
		output = "ebiomes:burning_peat 2",
		recipe = {"ebiomes:peat_dry", "group:wood"},
		replacements = {{"group:water_bucket", "bucket:bucket_empty"}}
	})

	minetest.register_craft({
	type = "fuel",
	recipe = "ebiomes:burning_peat",
	burntime = 30,
	})



if minetest.get_modpath("bonemeal") ~= nil then
	minetest.register_craft({
--		type = "shapeless",
		output = "bonemeal:mulch 9",
		recipe = {
			{"ebiomes:peat"},
		}
	})
end


	minetest.register_biome({
		name = "bog",
		node_water = "ebiomes:swamp_water_source",
		node_top = "ebiomes:peat_with_swamp_moss_yellow",
		depth_top = 1,
		node_filler = "ebiomes:peat_wet",
		depth_filler = 2,
		node_riverbed = "default:gravel",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 6,
		y_min = 3,
		heat_point = 53,
		humidity_point = 100,
	})

	minetest.register_decoration({
		name = "ebiomes:peat_l1",
		deco_type = "simple",
		place_on = {"ebiomes:peat_with_swamp_moss_yellow"},
		sidelen = 16,
		noise_params = {
			offset = 0.5,
			scale = 0.4,
			spread = {x = 250, y = 250, z = 250},
			seed = 21,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"bog"},
		height = 1,
		y_min = 1,
		y_max = 31000,
		place_offset_y = -1,
		decoration = "ebiomes:peat_wet_with_swamp_moss_green",
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
	})


if minetest.settings:get_bool("pl_quagmires", true) then

	minetest.register_decoration({
		name = "ebiomes:quagmire_small",
		deco_type = "schematic",
		place_on = {"ebiomes:peat_with_swamp_moss_yellow"},
		sidelen = 16,
		noise_params = {
			offset = 0.006,
			scale = 0.0003,
			spread = {x = 250, y = 250, z = 250},
			seed = 78,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"bog"},
		height = 1,
		y_min = 1,
		y_max = 31000,
		place_offset_y = -3,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_quagmire_small_np.mts",
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
	})

	minetest.register_decoration({
		name = "ebiomes:quagmire_vsmall",
		deco_type = "schematic",
		place_on = {"ebiomes:peat_with_swamp_moss_yellow"},
		sidelen = 16,
		noise_params = {
			offset = 0.01,
			scale = 0.0009,
			spread = {x = 250, y = 250, z = 250},
			seed = 76,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"bog"},
		height = 1,
		y_min = 1,
		y_max = 31000,
		place_offset_y = -3,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_quagmire_vsmall_np.mts",
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
	})


else

	minetest.register_decoration({
		name = "ebiomes:quagmire_small",
		deco_type = "schematic",
		place_on = {"ebiomes:peat_with_swamp_moss_yellow"},
		sidelen = 16,
		noise_params = {
			offset = 0.006,
			scale = 0.0003,
			spread = {x = 250, y = 250, z = 250},
			seed = 78,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"bog"},
		height = 1,
		y_min = 1,
		y_max = 31000,
		place_offset_y = -3,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_quagmire_small.mts",
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
	})

	minetest.register_decoration({
		name = "ebiomes:quagmire_vsmall",
		deco_type = "schematic",
		place_on = {"ebiomes:peat_with_swamp_moss_yellow"},
		sidelen = 16,
		noise_params = {
			offset = 0.01,
			scale = 0.0009,
			spread = {x = 250, y = 250, z = 250},
			seed = 76,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"bog"},
		height = 1,
		y_min = 1,
		y_max = 31000,
		place_offset_y = -3,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_quagmire_vsmall.mts",
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
	})

end


	minetest.register_node("ebiomes:reeds", {
		description = S("Reeds"),
		drawtype = "plantlike",
--		drawtype = "firelike",
		tiles = {"ebiomes_reeds.png"},
		inventory_image = "ebiomes_reeds.png",
		wield_image = "ebiomes_reeds.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 4 / 16, 4 / 16},
		},
		groups = {snappy = 3, flammable = 2, attached_node = 1},
		sounds = default.node_sound_leaves_defaults(),
	})

	minetest.register_decoration({
		name = "ebiomes:reeds",
		deco_type = "simple",
		place_on = {"ebiomes:peat_wet_with_swamp_moss_green", "ebiomes:peat_with_swamp_moss_yellow"},
		sidelen = 16,
		noise_params = {
			offset = 0.1,
			scale = 0.03,
			spread = {x = 100, y = 100, z = 100},
			seed = 357,
			octaves = 3,
			persist = 0.7
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:reeds",
	})

	minetest.register_node("ebiomes:marsh_grass_green", {
		description = S("Green Marsh Grass"),
		tiles = {"ebiomes_marsh_grass_green.png"},
		inventory_image = "ebiomes_marsh_grass_green.png",
		wield_image = "ebiomes_marsh_grass_green.png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, attached_node = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 4 / 16, 6 / 16},
		}
	})

	minetest.register_decoration({
		name = "ebiomes:marsh_grass_green",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_swamp", "ebiomes:peat_with_swamp_moss_yellow"},
		sidelen = 16,
		noise_params = {
			offset = 0.05,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 360,
			octaves = 3,
			persist = 0.6
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:marsh_grass_green",
	})

	minetest.register_node("ebiomes:marsh_grass_yellow", {
		description = S("Yellow Marsh Grass"),
		tiles = {"ebiomes_marsh_grass_yellow.png"},
		inventory_image = "ebiomes_marsh_grass_yellow.png",
		wield_image = "ebiomes_marsh_grass_yellow.png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, attached_node = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 4 / 16, 6 / 16},
		}
	})

	minetest.register_decoration({
		name = "ebiomes:marsh_grass_yellow",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_swamp", "ebiomes:peat_with_swamp_moss_yellow"},
		sidelen = 16,
		noise_params = {
			offset = 0.005,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 361,
			octaves = 3,
			persist = 0.6
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:marsh_grass_yellow",
	})


	minetest.register_node("ebiomes:grass_bog_1", {
		description = S("Bog Grass"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"ebiomes_grass_bog_1.png"},
		-- Use texture of a taller grass stage in inventory
		inventory_image = "ebiomes_grass_bog_3.png",
		wield_image = "ebiomes_grass_bog_3.png",
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
			local stack = ItemStack("ebiomes:grass_bog_" .. math.random(1,5))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("ebiomes:grass_bog_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})

for i = 2, 5 do
	minetest.register_node("ebiomes:grass_bog_" .. i, {
		description = S("Bog Grass"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"ebiomes_grass_bog_" .. i .. ".png"},
		inventory_image = "ebiomes_grass_bog_" .. i .. ".png",
		wield_image = "ebiomes_grass_bog_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		drop = "ebiomes:grass_bog_1",
		groups = {snappy = 3, flora = 1, attached_node = 1,
			not_in_creative_inventory = 1, grass = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},
	})
end

for length = 1, 5 do
	minetest.register_decoration({
		name = "ebiomes:grass_bog_"..length,
		deco_type = "simple",
		place_on = {"ebiomes:peat_with_swamp_moss_yellow"},
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
		decoration = "ebiomes:grass_bog_"..length,
	})
end

--Folliage

--Biome specific

--Cold deciduous

local function grow_new_blackcurrant(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-2, y = pos.y, z = pos.z-2}, modpath.."/schematics/ebiomes_blackcurrant_bush.mts", "0", nil, false)
end

	minetest.register_craftitem("ebiomes:blackcurrants", {
		description = S("Blackcurants"),
		inventory_image = "ebiomes_blackcurrants.png",
		groups = {food_blackcurrants = 1, food_berry = 1, eatable = 2},
		on_use = minetest.item_eat(2),
	})


	minetest.register_node("ebiomes:blackcurrant_bush_leaves_with_berries", {
		description = S("Blackcurrant Bush Leaves with Berries"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_blackcurrant_bush_leaves.png^ebiomes_blackcurrant_overlay.png"},
		paramtype = "light",
		groups = {snappy = 3, flammable = 2, leaves = 1, dig_immediate = 3},
		walkable = false,
		drop = "ebiomes:blackcurrants",
		sounds = default.node_sound_leaves_defaults(),
		node_dig_prediction = "ebiomes:blackcurrant_bush_leaves",

		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			minetest.set_node(pos, {name = "ebiomes:blackcurrant_bush_leaves"})
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,
	})


	minetest.register_node("ebiomes:blackcurrant_bush_leaves", {
		description = S("Blackcurrant Bush Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_blackcurrant_bush_leaves.png"},
		paramtype = "light",
		groups = {snappy = 3, flammable = 2, leaves = 1},
		walkable = false,
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:blackcurrant_bush_sapling"}, rarity = 5},
				{items = {"ebiomes:blackcurrant_bush_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		on_timer = function(pos, elapsed)
			if minetest.get_node_light(pos) < 11 then
				minetest.get_node_timer(pos):start(200)
			else
				minetest.set_node(pos, {name = "ebiomes:blackcurrant_bush_leaves_with_berries"})
			end
		end,

		after_place_node = default.after_place_leaves,
	})

	minetest.register_node("ebiomes:blackcurrant_bush_sapling", {
		description = S("Blackcurrant Bush Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_blackcurrant_bush_sapling.png"},
		inventory_image = "ebiomes_blackcurrant_bush_sapling.png",
		wield_image = "ebiomes_blackcurrant_bush_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_blackcurrant,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2,
			attached_node = 1, sapling = 1},
		sounds = default.node_sound_leaves_defaults(),

		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
				"ebiomes:blackcurrant_bush_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				{x = -1, y = 0, z = -1},
				{x = 1, y = 1, z = 1},
				-- maximum interval of interior volume check
				2)

			return itemstack
		end,
	})

	minetest.register_decoration({
		name = "ebiomes:blackcurrant_bush",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_cold"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 787,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"deciduous_forest_cold"},
		y_max = 31000,
		y_min = 1,
		place_offset_y = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_blackcurrant_bush.mts",
		flags = "place_center_x, place_center_z",
	})

if minetest.get_modpath("bonemeal") ~= nil then
bonemeal:add_sapling({
	{"ebiomes:blackcurrant_bush_sapling", grow_new_blackcurrant, "soil"},
})
end



local function grow_new_redcurrant(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-1, y = pos.y, z = pos.z-1}, modpath.."/schematics/ebiomes_redcurrant_bush.mts", "0", nil, false)
end

	minetest.register_craftitem("ebiomes:redcurrants", {
		description = S("Redcurants"),
		inventory_image = "ebiomes_redcurrants.png",
		groups = {food_redcurrants = 1, food_berry = 1, eatable = 2},
		on_use = minetest.item_eat(2),
	})


	minetest.register_node("ebiomes:redcurrant_bush_leaves_with_berries", {
		description = S("Redcurrant Bush Leaves with Berries"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_redcurrant_bush_leaves.png^ebiomes_redcurrant_overlay.png"},
		paramtype = "light",
		groups = {snappy = 3, flammable = 2, leaves = 1, dig_immediate = 3},
		walkable = false,
		drop = "ebiomes:redcurrants",
		sounds = default.node_sound_leaves_defaults(),
		node_dig_prediction = "ebiomes:redcurrant_bush_leaves",

		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			minetest.set_node(pos, {name = "ebiomes:redcurrant_bush_leaves"})
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,
	})


	minetest.register_node("ebiomes:redcurrant_bush_leaves", {
		description = S("Redcurrant Bush Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_redcurrant_bush_leaves.png"},
		paramtype = "light",
		groups = {snappy = 3, flammable = 2, leaves = 1},
		walkable = false,
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:redcurrant_bush_sapling"}, rarity = 5},
				{items = {"ebiomes:redcurrant_bush_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		on_timer = function(pos, elapsed)
			if minetest.get_node_light(pos) < 11 then
				minetest.get_node_timer(pos):start(200)
			else
				minetest.set_node(pos, {name = "ebiomes:redcurrant_bush_leaves_with_berries"})
			end
		end,

		after_place_node = default.after_place_leaves,
	})

	minetest.register_node("ebiomes:redcurrant_bush_sapling", {
		description = S("Redcurrant Bush Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_redcurrant_bush_sapling.png"},
		inventory_image = "ebiomes_redcurrant_bush_sapling.png",
		wield_image = "ebiomes_redcurrant_bush_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_redcurrant,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2,
			attached_node = 1, sapling = 1},
		sounds = default.node_sound_leaves_defaults(),

		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
				"ebiomes:redcurrant_bush_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				{x = -1, y = 0, z = -1},
				{x = 1, y = 1, z = 1},
				-- maximum interval of interior volume check
				2)

			return itemstack
		end,
	})

	minetest.register_decoration({
		name = "ebiomes:redcurrant_bush",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_cold"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 878,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"deciduous_forest_cold"},
		y_max = 31000,
		y_min = 1,
		place_offset_y = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_redcurrant_bush.mts",
		flags = "place_center_x, place_center_z",
	})

if minetest.get_modpath("bonemeal") ~= nil then
bonemeal:add_sapling({
	{"ebiomes:redcurrant_bush_sapling", grow_new_redcurrant, "soil"},
})
end



local function grow_new_gooseberry(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-1, y = pos.y, z = pos.z-1}, modpath.."/schematics/ebiomes_gooseberry_bush.mts", "0", nil, false)
end

	minetest.register_craftitem("ebiomes:gooseberries", {
		description = S("Gooseberries"),
		inventory_image = "ebiomes_gooseberries.png",
		groups = {food_gooseberries = 1, food_berry = 1, eatable = 2},
		on_use = minetest.item_eat(2),
	})


	minetest.register_node("ebiomes:gooseberry_bush_leaves_with_berries", {
		description = S("Gooseberry Bush Leaves with Berries"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_gooseberry_bush_leaves.png^ebiomes_gooseberry_overlay.png"},
		paramtype = "light",
		groups = {snappy = 3, flammable = 2, leaves = 1, dig_immediate = 3},
		walkable = false,
		damage_per_second = 1,
		drop = "ebiomes:gooseberries",
		sounds = default.node_sound_leaves_defaults(),
		node_dig_prediction = "ebiomes:gooseberry_bush_leaves",

		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			minetest.set_node(pos, {name = "ebiomes:gooseberry_bush_leaves"})
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,
	})


	minetest.register_node("ebiomes:gooseberry_bush_leaves", {
		description = S("Gooseberry Bush Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_gooseberry_bush_leaves.png"},
		paramtype = "light",
		groups = {snappy = 3, flammable = 2, leaves = 1},
		walkable = false,
		damage_per_second = 1,
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:gooseberry_bush_sapling"}, rarity = 5},
				{items = {"ebiomes:gooseberry_bush_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		on_timer = function(pos, elapsed)
			if minetest.get_node_light(pos) < 11 then
				minetest.get_node_timer(pos):start(200)
			else
				minetest.set_node(pos, {name = "ebiomes:gooseberry_bush_leaves_with_berries"})
			end
		end,

		after_place_node = default.after_place_leaves,
	})

	minetest.register_node("ebiomes:gooseberry_bush_sapling", {
		description = S("Gooseberry Bush Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_gooseberry_bush_sapling.png"},
		inventory_image = "ebiomes_gooseberry_bush_sapling.png",
		wield_image = "ebiomes_gooseberry_bush_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_gooseberry,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2,
			attached_node = 1, sapling = 1},
		sounds = default.node_sound_leaves_defaults(),

		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
				"ebiomes:gooseberry_bush_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				{x = -1, y = 0, z = -1},
				{x = 1, y = 1, z = 1},
				-- maximum interval of interior volume check
				2)

			return itemstack
		end,
	})

	minetest.register_decoration({
		name = "ebiomes:gooseberry_bush",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_cold"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 969,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"deciduous_forest_cold"},
		y_max = 31000,
		y_min = 1,
		place_offset_y = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_gooseberry_bush.mts",
		flags = "place_center_x, place_center_z",
	})

if minetest.get_modpath("bonemeal") ~= nil then
bonemeal:add_sapling({
	{"ebiomes:gooseberry_bush_sapling", grow_new_gooseberry, "soil"},
})
end



--Bog

	minetest.register_node("ebiomes:cranberry_patch", {
		description = S("Cranberry Patch"),
		tiles = {"ebiomes_cranberry_patch.png"},
		inventory_image = "ebiomes_cranberry_patch.png",
		wield_image = "ebiomes_cranberry_patch.png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, attached_node = 1, flammable = 1},
		drop = {
			max_items = 2,
			items = {
				{items = {"ebiomes:cranberries"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),
		after_place_node = function(pos, placer, itemstack)
			minetest.set_node(pos, {name = "ebiomes:cranberry_patch", param2 = 1})
		end,
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -3 / 16, 5 / 16},
		}
	})

	minetest.register_craftitem("ebiomes:cranberries", {
		description = S("Cranberries"),
		inventory_image = "ebiomes_cranberries.png",
		groups = {food_cranberries = 1, food_berry = 1, eatable = 2},
		on_use = minetest.item_eat(2),
	})


	minetest.register_decoration({
		name = "ebiomes:cranberry",
		deco_type = "simple",
		place_on = {"ebiomes:peat_wet_with_swamp_moss_green", "ebiomes:peat_with_swamp_moss_yellow"},
		sidelen = 16,
		noise_params = {
			offset = 0.03,
			scale = 0.007,
			spread = {x = 100, y = 100, z = 100},
			seed = 131,
			octaves = 3,
			persist = 0.6
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:cranberry_patch",
	})


	minetest.register_node("ebiomes:sundew", {
		description = S("Sundew"),
		tiles = {"ebiomes_sundew.png"},
		inventory_image = "ebiomes_sundew.png",
		wield_image = "ebiomes_sundew.png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, attached_node = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, -6 / 16, 4 / 16},
		}
	})

    minetest.register_craft({
		output = "dye:red",
		recipe = {
			{"ebiomes:sundew"}
		},
	})

	minetest.register_decoration({
		name = "ebiomes:sundew",
		deco_type = "simple",
		place_on = {"ebiomes:peat_wet_with_swamp_moss_green", "ebiomes:peat_with_swamp_moss_yellow"},
		sidelen = 16,
		noise_params = {
			offset = 0.04,
			scale = 0.007,
			spread = {x = 100, y = 100, z = 100},
			seed = 513,
			octaves = 3,
			persist = 0.6
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:sundew",
	})

	minetest.register_node("ebiomes:marigold", {
		description = S("Marsh Marigold"),
		tiles = {"ebiomes_marigold.png"},
		inventory_image = "ebiomes_marigold.png",
		wield_image = "ebiomes_marigold.png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, attached_node = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, -6 / 16, 4 / 16},
		}
	})

    minetest.register_craft({
		output = "dye:yellow 4",
		recipe = {
			{"ebiomes:marigold"}
		},
	})

	minetest.register_decoration({
		name = "ebiomes:marigold",
		deco_type = "simple",
		place_on = {"ebiomes:peat_wet_with_swamp_moss_green", "ebiomes:peat_with_swamp_moss_yellow"},
		sidelen = 16,
		noise_params = {
			offset = 0.02,
			scale = 0.007,
			spread = {x = 100, y = 100, z = 100},
			seed = 514,
			octaves = 3,
			persist = 0.6
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:marigold",
	})

	minetest.register_node("ebiomes:marsh_stitchwort", {
		description = S("Marsh Stitchwort"),
		tiles = {"ebiomes_marsh_stitchwort.png"},
		inventory_image = "ebiomes_marsh_stitchwort.png",
		wield_image = "ebiomes_marsh_stitchwort.png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, attached_node = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -2 / 16, 5 / 16},
		}
	})

    minetest.register_craft({
		output = "dye:white 4",
		recipe = {
			{"ebiomes:marsh_stitchwort"}
		},
	})

	minetest.register_decoration({
		name = "ebiomes:marsh_stitchwort",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_swamp", "ebiomes:peat_wet_with_swamp_moss_green", "ebiomes:peat_with_swamp_moss_yellow"},
		sidelen = 16,
		noise_params = {
			offset = 0.008,
			scale = 0.007,
			spread = {x = 100, y = 100, z = 100},
			seed = 515,
			octaves = 3,
			persist = 0.6
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:marsh_stitchwort",
	})

--Woods

--Willow

	minetest.register_node("ebiomes:willow_tree", {
		description = S("Willow Tree"),
		tiles = {"ebiomes_willow_tree_top.png", "ebiomes_willow_tree_top.png",
			"ebiomes_willow_tree.png"},
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

	minetest.register_node("ebiomes:willow_wood", {
		description = S("Willow Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"ebiomes_willow_wood.png"},
		is_ground_content = false,
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
		sounds = default.node_sound_wood_defaults(),
	})

	minetest.register_craft({
		output = "ebiomes:willow_wood 4",
		recipe = {
			{"ebiomes:willow_tree"},
		}
	})

	minetest.register_node("ebiomes:willow_leaves", {
		description = S("Willow Tree Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_willow_leaves.png"},
		waving = 1,
		paramtype = "light",
		is_ground_content = false,
		walkable = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:willow_sapling"}, rarity = 20},
				{items = {"ebiomes:willow_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = default.after_place_leaves,
	})

	default.register_leafdecay({
		trunks = {"ebiomes:willow_tree"},
		leaves = {"ebiomes:willow_leaves"},
		radius = 3,
	})

--left this credit but erased it's identicals further down the line
--borrowed from runs cooltrees modpack (baldcypress)
--[[
local function grow_new_baldcypress_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(240, 600))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-4, y = pos.y, z = pos.z-4}, modpath.."/schematics/baldcypress.mts", "0", nil, false)
end
--]]

local function grow_new_willow_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-3, y = pos.y, z = pos.z-3}, modpath.."/schematics/ebiomes_willow_tree.mts", "0", nil, false)
end

--schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_willow.mts"

	minetest.register_node("ebiomes:willow_sapling", {
		description = S("Willow Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_willow_sapling.png"},
		inventory_image = "ebiomes_willow_sapling.png",
		wield_image = "ebiomes_willow_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_willow_tree,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 3,
			attached_node = 1, sapling = 1},
		sounds = default.node_sound_leaves_defaults(),

		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
				"ebiomes:willow_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -3, y = 1, z = -3},
				{x = 3, y = 11, z = 3},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})

	minetest.register_decoration({
		name = "ebiomes:willow_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_cold"},
		sidelen = 16,
		noise_params = {
			offset = 0.001,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 100,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest_cold"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_willow_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		name = "ebiomes:willow_log",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_cold"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0009,
		biomes = {"deciduous_forest_cold"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_willow_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = {"ebiomes:dirt_with_grass_cold"},
		num_spawn_by = 8,
	})

if minetest.get_modpath("bonemeal") ~= nil then
bonemeal:add_sapling({
	{"ebiomes:willow_sapling", grow_new_willow_tree, "soil"},
})
end

	--forms sampled from pigiron mod
	stairs.register_stair_and_slab("willow_wood", "ebiomes:willow_wood",
		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		{"ebiomes_willow_wood.png"},
		S("Willow Wood Stair"),
		S("Willow Wood Slab"),
		default.node_sound_wood_defaults(),
		true,
		S("Inner Willow Wood Stair"),
		S("Outer Willow Wood Stair")
	)

	default.register_fence("ebiomes:fence_willow_wood", {
		description = S("Willow Wood Fence"),
		texture = "ebiomes_fence_willow_wood.png",
		inventory_image = "default_fence_overlay.png^ebiomes_fence_willow_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^ebiomes_fence_willow_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:willow_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_fence_rail("ebiomes:fence_rail_willow_wood", {
		description = S("Willow Wood Fence Rail"),
		texture = "ebiomes_fence_rail_willow_wood.png",
		inventory_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_willow_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_willow_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:willow_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_mesepost("ebiomes:mese_post_light_willow_wood", {
		description = S("Willow Wood Mese Post Light"),
		texture = "ebiomes_fence_willow_wood.png",
		material = "ebiomes:willow_wood",
	})

	doors.register_fencegate("ebiomes:gate_willow_wood", {
		description = S("Willow Wood Fence Gate"),
		texture = "ebiomes_willow_wood.png",
		material = "ebiomes:willow_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3}
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "ebiomes:gate_willow_wood_closed",
		burntime = 9,
	})



--Alder

	minetest.register_node("ebiomes:alder_tree", {
		description = S("Alder Tree"),
		tiles = {"ebiomes_alder_tree_top.png", "ebiomes_alder_tree_top.png",
			"ebiomes_alder_tree.png"},
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

	minetest.register_node("ebiomes:alder_wood", {
		description = S("Alder Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"ebiomes_alder_wood.png"},
		is_ground_content = false,
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
		sounds = default.node_sound_wood_defaults(),
	})

	minetest.register_craft({
		output = "ebiomes:alder_wood 4",
		recipe = {
			{"ebiomes:alder_tree"},
		}
	})

	minetest.register_node("ebiomes:alder_leaves", {
		description = S("Alder Tree Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_alder_leaves.png"},
		special_tiles = {"ebiomes_alder_leaves_simple.png"},
		waving = 1,
		paramtype = "light",
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:alder_sapling"}, rarity = 20},
				{items = {"ebiomes:alder_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = default.after_place_leaves,
	})

	default.register_leafdecay({
		trunks = {"ebiomes:alder_tree"},
		leaves = {"ebiomes:alder_leaves"},
		radius = 3,
	})

local function grow_new_alder_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-3, y = pos.y, z = pos.z-3}, modpath.."/schematics/ebiomes_alder_tree.mts", "0", nil, false)
end

	minetest.register_node("ebiomes:alder_sapling", {
		description = S("Alder Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_alder_sapling.png"},
		inventory_image = "ebiomes_alder_sapling.png",
		wield_image = "ebiomes_alder_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_alder_tree,
		selection_box = {
			type = "fixed",
			fixed = {-2 / 16, -0.5, -2 / 16, 2 / 16, 5 / 16, 2 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 3,
			attached_node = 1, sapling = 1},
		sounds = default.node_sound_leaves_defaults(),

		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
				"ebiomes:alder_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -3, y = 1, z = -3},
				{x = 3, y = 10, z = 3},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})


if minetest.settings:get_bool("light_mapgen", true) then
	minetest.register_decoration({
		name = "ebiomes:alder_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_cold"},
		sidelen = 16,
		noise_params = {
			offset = 0.005,
			scale = 0.015,
			spread = {x = 250, y = 250, z = 250},
			seed = 103,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest_cold"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_alder_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

else
	minetest.register_decoration({
		name = "ebiomes:alder_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_cold"},
		sidelen = 16,
		noise_params = {
			offset = 0.01,
			scale = 0.015,
			spread = {x = 250, y = 250, z = 250},
			seed = 103,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest_cold"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_alder_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end

	minetest.register_decoration({
		name = "ebiomes:alder_log",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_cold"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0009,
		biomes = {"deciduous_forest_cold"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_alder_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = {"ebiomes:dirt_with_grass_cold"},
		num_spawn_by = 8,
	})

if minetest.get_modpath("bonemeal") ~= nil then
bonemeal:add_sapling({
	{"ebiomes:alder_sapling", grow_new_alder_tree, "soil"},
})
end

	stairs.register_stair_and_slab("alder_wood", "ebiomes:alder_wood",
		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		{"ebiomes_alder_wood.png"},
		S("Alder Wood Stair"),
		S("Alder Wood Slab"),
		default.node_sound_wood_defaults(),
		true,
		S("Inner Alder Wood Stair"),
		S("Outer Alder Wood Stair")
	)

	default.register_fence("ebiomes:fence_alder_wood", {
		description = S("Alder Wood Fence"),
		texture = "ebiomes_fence_alder_wood.png",
		inventory_image = "default_fence_overlay.png^ebiomes_fence_alder_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^ebiomes_fence_alder_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:alder_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_fence_rail("ebiomes:fence_rail_alder_wood", {
		description = S("Alder Wood Fence Rail"),
		texture = "ebiomes_fence_rail_alder_wood.png",
		inventory_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_alder_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_alder_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:alder_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_mesepost("ebiomes:mese_post_light_alder_wood", {
		description = S("Alder Wood Mese Post Light"),
		texture = "ebiomes_fence_alder_wood.png",
		material = "ebiomes:alder_wood",
	})

	doors.register_fencegate("ebiomes:gate_alder_wood", {
		description = S("Alder Wood Fence Gate"),
		texture = "ebiomes_alder_wood.png",
		material = "ebiomes:alder_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3}
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "ebiomes:gate_alder_wood_closed",
		burntime = 9,
	})


--Ash


	minetest.register_node("ebiomes:ash_tree", {
		description = S("Ash Tree"),
		tiles = {"ebiomes_ash_tree_top.png", "ebiomes_ash_tree_top.png",
			"ebiomes_ash_tree.png"},
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

	minetest.register_node("ebiomes:ash_wood", {
		description = S("Ash Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"ebiomes_ash_wood.png"},
		is_ground_content = false,
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
		sounds = default.node_sound_wood_defaults(),
	})

	minetest.register_craft({
		output = "ebiomes:ash_wood 4",
		recipe = {
			{"ebiomes:ash_tree"},
		}
	})

	minetest.register_node("ebiomes:ash_leaves", {
		description = S("Ash Tree Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_ash_leaves.png"},
		special_tiles = {"ebiomes_ash_leaves_simple.png"},
		waving = 1,
		paramtype = "light",
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:ash_sapling"}, rarity = 20},
				{items = {"ebiomes:ash_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = default.after_place_leaves,
	})

	default.register_leafdecay({
		trunks = {"ebiomes:ash_tree"},
		leaves = {"ebiomes:ash_leaves"},
		radius = 3,
	})

local function grow_new_ash_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-4, y = pos.y, z = pos.z-4}, modpath.."/schematics/ebiomes_ash_tree.mts", "0", nil, false)
end

	minetest.register_node("ebiomes:ash_sapling", {
		description = S("Ash Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_ash_sapling.png"},
		inventory_image = "ebiomes_ash_sapling.png",
		wield_image = "ebiomes_ash_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_ash_tree,
		selection_box = {
			type = "fixed",
			fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, 7 / 16, 3 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 3,
			attached_node = 1, sapling = 1},
		sounds = default.node_sound_leaves_defaults(),

		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
				"ebiomes:ash_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 11, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})


if minetest.settings:get_bool("light_mapgen", true) then

	minetest.register_decoration({
		name = "ebiomes:ash_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_cold"},
		sidelen = 16,
		noise_params = {
			offset = 0.005,
			scale = 0.01,
			spread = {x = 250, y = 250, z = 250},
			seed = 102,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest_cold"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_ash_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

else
	minetest.register_decoration({
		name = "ebiomes:ash_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_cold"},
		sidelen = 16,
		noise_params = {
			offset = 0.009,
			scale = 0.01,
			spread = {x = 250, y = 250, z = 250},
			seed = 102,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest_cold"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_ash_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end

	minetest.register_decoration({
		name = "ebiomes:ash_log",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_cold"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0009,
		biomes = {"deciduous_forest_cold"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_ash_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = {"ebiomes:dirt_with_grass_cold"},
		num_spawn_by = 8,
	})


if minetest.get_modpath("bonemeal") ~= nil then
bonemeal:add_sapling({
	{"ebiomes:ash_sapling", grow_new_ash_tree, "soil"},
})
end

	stairs.register_stair_and_slab("ash_wood", "ebiomes:ash_wood",
		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		{"ebiomes_ash_wood.png"},
		S("Ash Wood Stair"),
		S("Ash Wood Slab"),
		default.node_sound_wood_defaults(),
		true,
		S("Inner Ash Wood Stair"),
		S("Outer Ash Wood Stair")
	)

	default.register_fence("ebiomes:fence_ash_wood", {
		description = S("Ash Wood Fence"),
		texture = "ebiomes_fence_ash_wood.png",
		inventory_image = "default_fence_overlay.png^ebiomes_fence_ash_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^ebiomes_fence_ash_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:ash_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_fence_rail("ebiomes:fence_rail_ash_wood", {
		description = S("Ash Wood Fence Rail"),
		texture = "ebiomes_fence_rail_ash_wood.png",
		inventory_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_ash_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_ash_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:ash_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_mesepost("ebiomes:mese_post_light_ash_wood", {
		description = S("Ash Wood Mese Post Light"),
		texture = "ebiomes_fence_ash_wood.png",
		material = "ebiomes:ash_wood",
	})

	doors.register_fencegate("ebiomes:gate_ash_wood", {
		description = S("Ash Wood Fence Gate"),
		texture = "ebiomes_ash_wood.png",
		material = "ebiomes:ash_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3}
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "ebiomes:gate_ash_wood_closed",
		burntime = 8,
	})

--Birch


	minetest.register_node("ebiomes:birch_tree", {
		description = S("Birch Tree"),
		tiles = {"ebiomes_birch_tree_top.png", "ebiomes_birch_tree_top.png",
			"ebiomes_birch_tree.png"},
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

	minetest.register_node("ebiomes:birch_wood", {
		description = S("Birch Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"ebiomes_birch_wood.png"},
		is_ground_content = false,
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
		sounds = default.node_sound_wood_defaults(),
	})

	minetest.register_craft({
		output = "ebiomes:birch_wood 4",
		recipe = {
			{"ebiomes:birch_tree"},
		}
	})

	minetest.register_node("ebiomes:birch_leaves", {
		description = S("Birch Tree Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_birch_leaves.png"},
		special_tiles = {"ebiomes_birch_leaves_simple.png"},
		waving = 1,
		paramtype = "light",
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:birch_sapling"}, rarity = 20},
				{items = {"ebiomes:birch_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = default.after_place_leaves,
	})

	default.register_leafdecay({
		trunks = {"ebiomes:birch_tree"},
		leaves = {"ebiomes:birch_leaves"},
		radius = 3,
	})

local function grow_new_birch_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-2, y = pos.y, z = pos.z-2}, modpath.."/schematics/ebiomes_birch_tree.mts", "0", nil, false)
end

	minetest.register_node("ebiomes:birch_sapling", {
		description = S("Birch Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_birch_sapling.png"},
		inventory_image = "ebiomes_birch_sapling.png",
		wield_image = "ebiomes_birch_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_birch_tree,
		selection_box = {
			type = "fixed",
			fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, 0.5, 3 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 3,
			attached_node = 1, sapling = 1},
		sounds = default.node_sound_leaves_defaults(),

		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
				"ebiomes:birch_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -2, y = 1, z = -2},
				{x = 2, y = 13, z = 2},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})


if minetest.settings:get_bool("light_mapgen", true) then
	minetest.register_decoration({
		name = "ebiomes:birch_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_cold"},
		sidelen = 16,
		noise_params = {
			offset = 0.006,
			scale = 0.003,
			spread = {x = 250, y = 250, z = 250},
			seed = 104,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest_cold"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_birch_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
else
	minetest.register_decoration({
		name = "ebiomes:birch_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_cold"},
		sidelen = 16,
		noise_params = {
			offset = 0.008,
			scale = 0.003,
			spread = {x = 250, y = 250, z = 250},
			seed = 104,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest_cold"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_birch_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end


	minetest.register_decoration({
		name = "ebiomes:birch_log",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_cold"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0009,
		biomes = {"deciduous_forest_cold"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_birch_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = {"ebiomes:dirt_with_grass_cold"},
		num_spawn_by = 8,
	})

if minetest.get_modpath("bonemeal") ~= nil then
bonemeal:add_sapling({
	{"ebiomes:birch_sapling", grow_new_birch_tree, "soil"},
})
end

	stairs.register_stair_and_slab("birch_wood", "ebiomes:birch_wood",
		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		{"ebiomes_birch_wood.png"},
		S("Birch Wood Stair"),
		S("Birch Wood Slab"),
		default.node_sound_wood_defaults(),
		true,
		S("Inner Birch Wood Stair"),
		S("Outer Birch Wood Stair")
	)

	default.register_fence("ebiomes:fence_birch_wood", {
		description = S("Birch Wood Fence"),
		texture = "ebiomes_fence_birch_wood.png",
		inventory_image = "default_fence_overlay.png^ebiomes_fence_birch_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^ebiomes_fence_birch_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:birch_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_fence_rail("ebiomes:fence_rail_birch_wood", {
		description = S("Birch Wood Fence Rail"),
		texture = "ebiomes_fence_rail_birch_wood.png",
		inventory_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_birch_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_birch_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:birch_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_mesepost("ebiomes:mese_post_light_birch_wood", {
		description = S("Birch Wood Mese Post Light"),
		texture = "ebiomes_fence_birch_wood.png",
		material = "ebiomes:birch_wood",
	})

	doors.register_fencegate("ebiomes:gate_birch_wood", {
		description = S("Birch Wood Fence Gate"),
		texture = "ebiomes_birch_wood.png",
		material = "ebiomes:birch_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3}
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "ebiomes:gate_birch_wood_closed",
		burntime = 6,
	})


--Swamp

	minetest.register_decoration({
		name = "ebiomes:willow_tree_sw",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_swamp"},
		sidelen = 16,
		noise_params = {
			offset = 0.001,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 100,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"swamp", "swamp_shore"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_willow_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		name = "ebiomes:ash_tree_sw",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_swamp"},
		sidelen = 16,
		noise_params = {
			offset = 0.003,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 102,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"swamp", "swamp_shore"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_ash_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})


--Downy Birch


	minetest.register_node("ebiomes:downy_birch_tree", {
		description = S("Downy Birch Tree"),
		tiles = {"ebiomes_downy_birch_tree_top.png", "ebiomes_downy_birch_tree_top.png",
			"ebiomes_downy_birch_tree.png"},
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

	minetest.register_node("ebiomes:downy_birch_wood", {
		description = S("Downy Birch Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"ebiomes_downy_birch_wood.png"},
		is_ground_content = false,
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
		sounds = default.node_sound_wood_defaults(),
	})

	minetest.register_craft({
		output = "ebiomes:downy_birch_wood 4",
		recipe = {
			{"ebiomes:downy_birch_tree"},
		}
	})

	minetest.register_node("ebiomes:downy_birch_leaves", {
		description = S("Downy Birch Tree Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_downy_birch_leaves.png"},
		special_tiles = {"ebiomes_downy_birch_leaves_simple.png"},
		waving = 1,
		paramtype = "light",
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:downy_birch_sapling"}, rarity = 20},
				{items = {"ebiomes:downy_birch_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = default.after_place_leaves,
	})

	default.register_leafdecay({
		trunks = {"ebiomes:downy_birch_tree"},
		leaves = {"ebiomes:downy_birch_leaves"},
		radius = 3,
	})

local function grow_new_downy_birch_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-1, y = pos.y, z = pos.z-1}, modpath.."/schematics/ebiomes_downy_birch_tree.mts", "0", nil, false)
end

	minetest.register_node("ebiomes:downy_birch_sapling", {
		description = S("Downy Birch Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_downy_birch_sapling.png"},
		inventory_image = "ebiomes_downy_birch_sapling.png",
		wield_image = "ebiomes_downy_birch_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_downy_birch_tree,
		selection_box = {
			type = "fixed",
			fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, 0.5, 3 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 3,
			attached_node = 1, sapling = 1},
		sounds = default.node_sound_leaves_defaults(),

		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
				"ebiomes:downy_birch_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -1, y = 1, z = -1},
				{x = 1, y = 7, z = 1},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})

	minetest.register_decoration({
		name = "ebiomes:downy_birch_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_swamp"},
		sidelen = 16,
		noise_params = {
			offset = 0.003,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 104,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"swamp"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_downy_birch_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		name = "ebiomes:downy_birch_log",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_swamp"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0009,
		biomes = {"swamp"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_downy_birch_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = {"ebiomes:dirt_with_grass_swamp"},
		num_spawn_by = 8,
	})

if minetest.get_modpath("bonemeal") ~= nil then
bonemeal:add_sapling({
	{"ebiomes:downy_birch_sapling", grow_new_downy_birch_tree, "soil"},
})
end

	stairs.register_stair_and_slab("downy_birch_wood", "ebiomes:downy_birch_wood",
		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		{"ebiomes_downy_birch_wood.png"},
		S("Downy Birch Wood Stair"),
		S("Downy Birch Wood Slab"),
		default.node_sound_wood_defaults(),
		true,
		S("Inner Downy Birch Wood Stair"),
		S("Outer Downy Birch Wood Stair")
	)

	default.register_fence("ebiomes:fence_downy_birch_wood", {
		description = S("Downy Birch Wood Fence"),
		texture = "ebiomes_fence_downy_birch_wood.png",
		inventory_image = "default_fence_overlay.png^ebiomes_fence_downy_birch_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^ebiomes_fence_downy_birch_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:downy_birch_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_fence_rail("ebiomes:fence_rail_downy_birch_wood", {
		description = S("Downy Birch Wood Fence Rail"),
		texture = "ebiomes_fence_rail_downy_birch_wood.png",
		inventory_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_downy_birch_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_downy_birch_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:downy_birch_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_mesepost("ebiomes:mese_post_light_downy_birch_wood", {
		description = S("Downy Birch Wood Mese Post Light"),
		texture = "ebiomes_fence_downy_birch_wood.png",
		material = "ebiomes:downy_birch_wood",
	})

	doors.register_fencegate("ebiomes:gate_downy_birch_wood", {
		description = S("Downy Birch Wood Fence Gate"),
		texture = "ebiomes_downy_birch_wood.png",
		material = "ebiomes:downy_birch_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3}
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "ebiomes:gate_downy_birch_wood_closed",
		burntime = 6,
	})

--Loot

if minetest.global_exists("dungeon_loot") then
	dungeon_loot.register ({
		{name = "ebiomes:redcurrants", chance = 0.3, count = {1, 4}},
		{name = "ebiomes:blackcurrants", chance = 0.3, count = {1, 4}},
		{name = "ebiomes:gooseberries", chance = 0.3, count = {1, 4}},
		{name = "ebiomes:cranberries", chance = 0.2, count = {1, 6}},
	})
end

--Bonemeal
if minetest.get_modpath("bonemeal") then
	bonemeal:add_deco({
		{"ebiomes:dirt_with_grass_cold", {"ebiomes:grass_cold_1", "ebiomes:grass_cold_2", "ebiomes:grass_cold_3", "ebiomes:grass_cold_4", "ebiomes:grass_cold_5"},
			{"flowers:dandelion_yellow", "flowers:dandelion_white", "flowers:tulip", "flowers:tulip_black", "flowers:chrysanthemum_green"} }
	})

	bonemeal:add_deco({
		{"ebiomes:dirt_with_grass_swamp", {"ebiomes:grass_swamp_1", "ebiomes:grass_swamp_2", "ebiomes:grass_swamp_3", "ebiomes:grass_swamp_4", "ebiomes:grass_swamp_5"},
			{"ebiomes:marsh_stitchwort", "ebiomes:marsh_grass_yellow", "ebiomes:marsh_grass_green"} }
	})

	bonemeal:add_deco({
		{"ebiomes:peat_with_swamp_moss_yellow", {"ebiomes:grass_bog_1", "ebiomes:grass_bog_2", "ebiomes:grass_bog_3", "ebiomes:grass_bog_4", "ebiomes:grass_bog_5", "ebiomes:reeds"},
			{"ebiomes:cranberry_patch", "ebiomes:sundew", "ebiomes:marigold", "ebiomes:marsh_stitchwort", "ebiomes:marsh_grass_yellow", "ebiomes:marsh_grass_green"} }
	})

	bonemeal:add_deco({
		{"ebiomes:peat_wet_with_swamp_moss_green", {"ebiomes:reeds"},
			{"ebiomes:cranberry_patch", "ebiomes:sundew", "ebiomes:marigold"} }
	})
end



--Peripheral mod support


--Moreblocks

--sampled from cool_trees
-- stairsplus/moreblocks
if minetest.get_modpath("moreblocks") then


	stairsplus:register_all("alder_tree", "wood", "ebiomes:alder_wood", {
		description = "Alder Wood",
		tiles = {"ebiomes_alder_wood.png"},
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})

	stairsplus:register_all("ash_tree", "wood", "ebiomes:ash_wood", {
		description = "Ash Wood",
		tiles = {"ebiomes_ash_wood.png"},
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})

	stairsplus:register_all("birch_tree", "wood", "ebiomes:birch_wood", {
		description = "Birch Wood",
		tiles = {"ebiomes_birch_wood.png"},
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})

	stairsplus:register_all("downy_birch_tree", "wood", "ebiomes:downy_birch_wood", {
		description = "Downy Birch Wood",
		tiles = {"ebiomes_downy_birch_wood.png"},
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})

	stairsplus:register_all("willow_tree", "wood", "ebiomes:willow_wood", {
		description = "Willow Wood",
		tiles = {"ebiomes_willow_wood.png"},
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})

--If someone wants glorious peat stuff they may uncomment this. Whether this works righ out of bat, no idea.
--[[
	stairsplus:register_all("peat_dry", "soil", "ebiomes:peat_dry", {
		description = "Dry Peat",
		tiles = {"ebiomes_peat_dry.png"},
		groups = {crumbly = 2, oddly_breakable_by_hand = 1},
		sounds = default.node_sound_wood_defaults(),
	})
--]]

end

-- Support for flowerpot
if minetest.global_exists("flowerpot") then

	flowerpot.register_node("ebiomes:ash_sapling")
	flowerpot.register_node("ebiomes:alder_sapling")
	flowerpot.register_node("ebiomes:birch_sapling")
	flowerpot.register_node("ebiomes:downy_birch_sapling")
	flowerpot.register_node("ebiomes:willow_sapling")

	flowerpot.register_node("ebiomes:blackcurrant_bush_sapling")
	flowerpot.register_node("ebiomes:gooseberry_bush_sapling")
	flowerpot.register_node("ebiomes:redcurrant_bush_sapling")

	flowerpot.register_node("ebiomes:cranberry_patch")
	flowerpot.register_node("ebiomes:marsh_stitchwort") -- All respect to the plant, but lol
	flowerpot.register_node("ebiomes:marigold")
	flowerpot.register_node("ebiomes:sundew")

end
