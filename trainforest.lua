local S = minetest.get_translator("ebiomes")

--from runs cooltrees
local modname = "ebiomes"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")

minetest.register_alias("beech_tree", "ebiomes:beech_tree")
minetest.register_alias("beech_wood", "ebiomes:beech_wood")
minetest.register_alias("beech_leaves", "ebiomes:beech_leaves")
minetest.register_alias("beech_sapling", "ebiomes:beech_sapling")

--Base

	minetest.register_node("ebiomes:dirt_with_forest_litter", {
		description = S("Dirt with Forest Litter"),
		tiles = {"ebiomes_forest_litter.png", "default_dirt.png",
			{name = "default_dirt.png^ebiomes_forest_litter_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
		drop = "default:dirt",
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.25},
		}),
		soil = {
			base = "ebiomes:dirt_with_forest_litter",
			dry = "farming:soil",
			wet = "farming:soil_wet"
		}
	})

	minetest.register_node("ebiomes:dirt_with_forest_litter_footsteps", {
		description = S("Dirt with Forest Litter and Footsteps"),
		tiles = {"ebiomes_forest_litter.png^default_footprint.png", "default_dirt.png",
			{name = "default_dirt.png^ebiomes_forest_litter_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1, not_in_creative_inventory = 1},
		drop = "default:dirt",
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.25},
		}),
	})



	minetest.register_biome({
		name = "temperate_rainforest",
		node_top = "ebiomes:dirt_with_forest_litter",
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
		heat_point = 60,
		humidity_point = 80,
	})

	minetest.register_biome({
		name = "temperate_rainforest_shore",
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
		heat_point = 60,
		humidity_point = 80,
	})

	minetest.register_biome({
		name = "temperate_rainforest_ocean",
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
		heat_point = 60,
		humidity_point = 80,
	})

	minetest.register_biome({
		name = "temperate_rainforest_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = -400,
		heat_point = 60,
		humidity_point = 80,
	})


--Global non-tree decors


--Grass


	for length = 1, 5 do
		minetest.register_decoration({
			name = "ebiomes:grass_trf_"..length,
			deco_type = "simple",
			place_on = {"ebiomes:dirt_with_forest_litter"},
			sidelen = 16,
			biomes = {"temperate_rainforest"},
			noise_params = {
				offset = 0.03,
				scale = 0.01,
				spread = {x = 100, y = 100, z = 100},
				seed = 329,
				octaves = 3,
				persist = 0.6
			},
			y_max = 30,
			y_min = 1,
			decoration = "default:grass_"..length,
		})
	end

--Non-tree decors

for length = 1, 3 do
	minetest.register_decoration({
		name = "ebiomes:ferntrf_"..length,
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_forest_litter"},
		sidelen = 80,
		fill_ratio = 0.02,
		biomes = {"temperate_rainforest"},
		y_max = 31000,
		y_min = 1,
		decoration = "default:fern_"..length,
	})
end

	minetest.register_decoration({
		name = "ebiomes:bush_trf",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_forest_litter"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 137,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"temperate_rainforest"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("default") .. "/schematics/bush.mts",
		flags = "place_center_x, place_center_z",
	})

	minetest.register_decoration({
		name = "ebiomes:pine_bush_trf",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_forest_litter"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 278,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"temperate_rainforest"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("default") .. "/schematics/pine_bush.mts",
		flags = "place_center_x, place_center_z",
	})


	--flowers

	minetest.register_decoration({
		name = "ebiomes:rose_trf",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_forest_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0.004,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 357,
			octaves = 3,
			persist = 0.05
		},
		biomes = {"temperate_rainforest"},
		y_max = 31000,
		y_min = 1,
		decoration = "flowers:rose",
	})

	--mushrooms

	minetest.register_decoration({
		name = "ebiomes:mushroom_brown_trf",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_forest_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.006,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"temperate_rainforest"},
		y_max = 31000,
		y_min = 1,
		decoration = "flowers:mushroom_brown",
	})

	minetest.register_decoration({
		name = "ebiomes:mushroom_red_trf",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_forest_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.006,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"temperate_rainforest"},
		y_max = 31000,
		y_min = 1,
		decoration = "flowers:mushroom_brown",
	})

--ebiomes bushes

	minetest.register_decoration({
		name = "ebiomes:blackcurrant_bush_trf",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_forest_litter"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 787,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"temperate_rainforest"},
		y_max = 31000,
		y_min = 1,
		place_offset_y = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_blackcurrant_bush.mts",
		flags = "place_center_x, place_center_z",
	})

	minetest.register_decoration({
		name = "ebiomes:gooseberry_bush_trf",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_forest_litter"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 969,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"temperate_rainforest"},
		y_max = 31000,
		y_min = 1,
		place_offset_y = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_gooseberry_bush.mts",
		flags = "place_center_x, place_center_z",
	})


--Trees

--Beech

	minetest.register_node("ebiomes:beech_tree", {
		description = S("Beech Tree"),
		tiles = {"ebiomes_beech_tree_top.png", "ebiomes_beech_tree_top.png",
			"ebiomes_beech_tree.png"},
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

	minetest.register_node("ebiomes:beech_wood", {
		description = S("Beech Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"ebiomes_beech_wood.png"},
		is_ground_content = false,
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
		sounds = default.node_sound_wood_defaults(),
	})

	minetest.register_craft({
		output = "ebiomes:beech_wood 4",
		recipe = {
			{"ebiomes:beech_tree"},
		}
	})

	minetest.register_node("ebiomes:beech_leaves", {
		description = S("Beech Tree Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_beech_leaves.png"},
		waving = 1,
		paramtype = "light",
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:beech_sapling"}, rarity = 20},
				{items = {"ebiomes:beech_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = default.after_place_leaves,
	})

	default.register_leafdecay({
		trunks = {"ebiomes:beech_tree"},
		leaves = {"ebiomes:beech_leaves"},
		radius = 3,
	})

local function grow_new_beech_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-3, y = pos.y, z = pos.z-3}, modpath.."/schematics/ebiomes_beech_tree.mts", "0", nil, false)
end

	minetest.register_node("ebiomes:beech_sapling", {
		description = S("Beech Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_beech_sapling.png"},
		inventory_image = "ebiomes_beech_sapling.png",
		wield_image = "ebiomes_beech_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_beech_tree,
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
				"ebiomes:beech_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -3, y = 1, z = -3},
				{x = 4, y = 11, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})

if minetest.settings:get_bool("light_mapgen", true) then
	minetest.register_decoration({
		name = "ebiomes:beech_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_forest_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0.009,
			scale = 0.015,
			spread = {x = 250, y = 250, z = 250},
			seed = 113,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"temperate_rainforest"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_beech_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
else
	minetest.register_decoration({
		name = "ebiomes:beech_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_forest_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0.01,
			scale = 0.015,
			spread = {x = 250, y = 250, z = 250},
			seed = 113,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"temperate_rainforest"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_beech_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end

	minetest.register_decoration({
		name = "ebiomes:beech_log",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_forest_litter"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0009,
		biomes = {"temperate_rainforest"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_beech_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = {"ebiomes:dirt_with_forest_litter"},
		num_spawn_by = 8,
	})

if minetest.get_modpath("bonemeal") ~= nil then
bonemeal:add_sapling({
	{"ebiomes:beech_sapling", grow_new_beech_tree, "soil"},
})
end

	stairs.register_stair_and_slab("beech_wood", "ebiomes:beech_wood",
		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		{"ebiomes_beech_wood.png"},
		S("Beech Wood Stair"),
		S("Beech Wood Slab"),
		default.node_sound_wood_defaults(),
		true,
		S("Inner Beech Wood Stair"),
		S("Outer Beech Wood Stair")
	)

	default.register_fence("ebiomes:fence_beech_wood", {
		description = S("Beech Wood Fence"),
		texture = "ebiomes_fence_beech_wood.png",
		inventory_image = "default_fence_overlay.png^ebiomes_fence_beech_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^ebiomes_fence_beech_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:beech_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_fence_rail("ebiomes:fence_rail_beech_wood", {
		description = S("Beech Wood Fence Rail"),
		texture = "ebiomes_fence_rail_beech_wood.png",
		inventory_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_beech_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_beech_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:beech_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_mesepost("ebiomes:mese_post_light_beech_wood", {
		description = S("Beech Wood Mese Post Light"),
		texture = "ebiomes_fence_beech_wood.png",
		material = "ebiomes:beech_wood",
	})

	doors.register_fencegate("ebiomes:gate_beech_wood", {
		description = S("Beech Wood Fence Gate"),
		texture = "ebiomes_beech_wood.png",
		material = "ebiomes:beech_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3}
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "ebiomes:gate_beech_wood_closed",
		burntime = 9,
	})

	-- Support for flowerpot
if minetest.global_exists("flowerpot") then

	flowerpot.register_node("ebiomes:beech_sapling")

end

-- Decors
if minetest.settings:get_bool("light_mapgen", true) then
	minetest.register_decoration({
		name = "ebiomes:alder_tree_trf",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_forest_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0.005,
			scale = 0.015,
			spread = {x = 250, y = 250, z = 250},
			seed = 103,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"temperate_rainforest"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_alder_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
else
	minetest.register_decoration({
		name = "ebiomes:alder_tree_trf",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_forest_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0.03,
			scale = 0.015,
			spread = {x = 250, y = 250, z = 250},
			seed = 103,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"temperate_rainforest"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_alder_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end

	minetest.register_decoration({
		name = "ebiomes:alder_log_trf",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_forest_litter"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0009,
		biomes = {"temperate_rainforest"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_alder_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = {"ebiomes:dirt_with_grass_cold"},
		num_spawn_by = 8,
	})

if minetest.settings:get_bool("light_mapgen", true) then
	minetest.register_decoration({
		name = "ebiomes:hornbeam_tree_trf",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_forest_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0.032,
			scale = 0.01,
			spread = {x = 250, y = 250, z = 250},
			seed = 106,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"temperate_rainforest"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_hornbeam_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
else
	minetest.register_decoration({
		name = "ebiomes:hornbeam_tree_trf",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_forest_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0.04,
			scale = 0.01,
			spread = {x = 250, y = 250, z = 250},
			seed = 106,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"temperate_rainforest"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_hornbeam_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end

	minetest.register_decoration({
		name = "ebiomes:hornbeam_log_trf",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_forest_litter"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0009,
		biomes = {"temperate_rainforest"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_hornbeam_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = {"ebiomes:dirt_with_forest_litter"},
		num_spawn_by = 8,
	})


	minetest.register_decoration({
		name = "ebiomes:chestnut_tree_trf",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_forest_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0.001,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 106,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"temperate_rainforest"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_chestnut_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		name = "ebiomes:chestnut_log_trf",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_forest_litter"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0009,
		biomes = {"temperate_rainforest"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_chestnut_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = {"ebiomes:dirt_with_forest_litter"},
		num_spawn_by = 8,
	})

if minetest.settings:get_bool("light_mapgen", true) then
	minetest.register_decoration({
		name = "ebiomes:pine_tree_trf",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_forest_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0.001,
			scale = 0.048,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"temperate_rainforest"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("default") .. "/schematics/pine_tree.mts",
		flags = "place_center_x, place_center_z",
	})
else
	minetest.register_decoration({
		name = "ebiomes:pine_tree_trf",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_forest_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0.004,
			scale = 0.048,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"temperate_rainforest"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("default") .. "/schematics/pine_tree.mts",
		flags = "place_center_x, place_center_z",
	})
end

if minetest.settings:get_bool("light_mapgen", true) then
	minetest.register_decoration({
		name = "ebiomes:small_pine_tree_trf",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_forest_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0.001,
			scale = -0.005,
			spread = {x = 250, y = 250, z = 250},
			seed = 101,
			octaves = 3,
			persist = 0.03
		},
		biomes = {"temperate_rainforest"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("default") .. "/schematics/small_pine_tree.mts",
		flags = "place_center_x, place_center_z",
	})
else
	minetest.register_decoration({
		name = "ebiomes:small_pine_tree_trf",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_forest_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0.001,
			scale = -0.005,
			spread = {x = 250, y = 250, z = 250},
			seed = 101,
			octaves = 3,
			persist = 0.03
		},
		biomes = {"temperate_rainforest"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("default") .. "/schematics/small_pine_tree.mts",
		flags = "place_center_x, place_center_z",
	})
end

	minetest.register_decoration({
		name = "ebiomes:pine_log_trf",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_forest_litter"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0009,
		biomes = {"temperate_rainforest"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_pine_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = {"ebiomes:dirt_with_grass_cold"},
		num_spawn_by = 8,
	})


-- Mod support

-- Bonemeal
if minetest.get_modpath("bonemeal") then
	bonemeal:add_deco({
		{"ebiomes:dirt_with_forest_litter", {"default:grass_1", "default:grass_2", "default:grass_3", "default:grass_4", "default:grass_5", "default:fern_1", "default:fern_2", "default:fern_3"},
			{"flowers:rose"} }
	})
end
