local S = minetest.get_translator("ebiomes")

--from runs cooltrees
local modname = "ebiomes"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")

--Global
--[[
	minetest.register_decoration({
		name = "ebiomes:apple_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_warm"},
		sidelen = 16,
		noise_params = {
			offset = 0.002,
			scale = 0.005,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest_warm"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("default") .. "/schematics/apple_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
	
	minetest.register_decoration({
		name = "default:apple_log",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_warm"},
		place_offset_y = 1,
		sidelen = 16,
		noise_params = {
			offset = 0.0006,
			scale = 0.0004,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest_warm"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("default") .. "/schematics/apple_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = "ebiomes:dirt_with_grass_warm",
		num_spawn_by = 8,
	})
]]--

	minetest.register_decoration({
		name = "ebiomes:aspen_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_cold"},
		sidelen = 16,
		noise_params = {
			offset = 0.001,
			scale = -0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 104,
			octaves = 3,
			persist = 0.06
		},
		biomes = {"deciduous_forest_cold"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("default") .. "/schematics/aspen_tree.mts",
		flags = "place_center_x, place_center_z",
	})
	
	minetest.register_decoration({
		name = "ebiomes:aspen_log",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_cold"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0009,
		biomes = {"deciduous_forest_cold"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_aspen_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = {"ebiomes:dirt_with_grass_cold"},
		num_spawn_by = 8,
	})



	minetest.register_decoration({
		name = "ebiomes:small_pine_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_cold"},
		sidelen = 16,
		noise_params = {
			offset = 0.001,
			scale = -0.005,
			spread = {x = 250, y = 250, z = 250},
			seed = 101,
			octaves = 3,
			persist = 0.03
		},
		biomes = {"deciduous_forest_cold"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("default") .. "/schematics/small_pine_tree.mts",
		flags = "place_center_x, place_center_z",
	})

	minetest.register_decoration({
		name = "ebiomes:pine_log",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_cold"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0009,
		biomes = {"deciduous_forest_cold"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_pine_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = {"ebiomes:dirt_with_grass_cold"},
		num_spawn_by = 8,
	})

	
	
	
	
	
--Cold deciduous

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
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:willow_sapling"}, rarity = 20},
				{items = {"ebiomes:willow_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = after_place_leaves,
	})
	
	default.register_leafdecay({
		trunks = {"ebiomes:willow_tree"},
		leaves = {"ebiomes:willow_leaves"},
		radius = 3,
	})

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
		default.node_sound_wood_defaults())
		
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
		material = "default:willow_wood",
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

		after_place_node = after_place_leaves,
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
		default.node_sound_wood_defaults())
		
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
		material = "default:alder_wood",
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

		after_place_node = after_place_leaves,
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
		default.node_sound_wood_defaults())
		
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
		material = "default:ash_wood",
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

		after_place_node = after_place_leaves,
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
		default.node_sound_wood_defaults())
		
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
		material = "default:birch_wood",
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







--Mediterranean



--Cypress

	minetest.register_node("ebiomes:cypress_tree", {
		description = S("Cypress Tree"),
		tiles = {"ebiomes_cypress_tree_top.png", "ebiomes_cypress_tree_top.png",
			"ebiomes_cypress_tree.png"},
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

	minetest.register_node("ebiomes:cypress_wood", {
		description = S("Cypress Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"ebiomes_cypress_wood.png"},
		is_ground_content = false,
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
		sounds = default.node_sound_wood_defaults(),
	})

	minetest.register_craft({
		output = "ebiomes:cypress_wood 4",
		recipe = {
			{"ebiomes:cypress_tree"},
		}
	})

	minetest.register_node("ebiomes:cypress_leaves", {
		description = S("Cypress Tree Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_cypress_leaves.png"},
		waving = 1,
		paramtype = "light",
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:cypress_sapling"}, rarity = 20},
				{items = {"ebiomes:cypress_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = after_place_leaves,
	})
	
	default.register_leafdecay({
		trunks = {"ebiomes:cypress_tree"},
		leaves = {"ebiomes:cypress_leaves"},
		radius = 3,
	})

local function grow_new_cypress(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-2, y = pos.y, z = pos.z-2}, modpath.."/schematics/ebiomes_cypress_tree.mts", "0", nil, false)
end

	minetest.register_node("ebiomes:cypress_sapling", {
		description = S("Cypress Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_cypress_sapling.png"},
		inventory_image = "ebiomes_cypress_sapling.png",
		wield_image = "ebiomes_cypress_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_cypress,
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
				"ebiomes:cypress_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -2, y = 1, z = -2},
				{x = 2, y = 10, z = 2},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})

	minetest.register_decoration({
		name = "ebiomes:cypress_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_med"},
		sidelen = 16,
		noise_params = {
			offset = 0.005,
			scale = 0.005,
			spread = {x = 250, y = 250, z = 250},
			seed = 4,
			octaves = 3,
			persist = 0.01
		},
		biomes = {"mediterranean"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_cypress_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
	
	
	minetest.register_decoration({
		name = "ebiomes:cypress_log",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_med"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0009,
		biomes = {"mediterranean"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_cypress_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = {"ebiomes:dirt_with_grass_med"},
		num_spawn_by = 8,
	})
	
if minetest.get_modpath("bonemeal") ~= nil then
bonemeal:add_sapling({
	{"ebiomes:cypress_sapling", grow_new_cypress, "soil"},
})
end


	stairs.register_stair_and_slab("cypress_wood", "ebiomes:cypress_wood",
		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		{"ebiomes_cypress_wood.png"},
		S("Cypress Wood Stair"),
		S("Cypress Wood Slab"),
		default.node_sound_wood_defaults())
		
	default.register_fence("ebiomes:fence_cypress_wood", {
		description = S("Cypress Wood Fence"),
		texture = "ebiomes_fence_cypress_wood.png",
		inventory_image = "default_fence_overlay.png^ebiomes_fence_cypress_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^ebiomes_fence_cypress_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:cypress_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_fence_rail("ebiomes:fence_rail_cypress_wood", {
		description = S("Cypress Wood Fence Rail"),
		texture = "ebiomes_fence_rail_cypress_wood.png",
		inventory_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_cypress_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_cypress_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		material = "default:cypress_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_mesepost("ebiomes:mese_post_light_cypress_wood", {
		description = S("Cypress Wood Mese Post Light"),
		texture = "ebiomes_fence_cypress_wood.png",
		material = "ebiomes:cypress_wood",
	})

	doors.register_fencegate("ebiomes:gate_cypress_wood", {
		description = S("Cypress Wood Fence Gate"),
		texture = "ebiomes_cypress_wood.png",
		material = "ebiomes:cypress_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3}
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "ebiomes:gate_cypress_wood_closed",
		burntime = 7,
	})




--Olive

	minetest.register_node("ebiomes:olive_tree", {
		description = S("Olive Tree"),
		tiles = {"ebiomes_olive_tree_top.png", "ebiomes_olive_tree_top.png",
			"ebiomes_olive_tree.png"},
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

	minetest.register_node("ebiomes:olive_wood", {
		description = S("Olive Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"ebiomes_olive_wood.png"},
		is_ground_content = false,
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
		sounds = default.node_sound_wood_defaults(),
	})

	minetest.register_craft({
		output = "ebiomes:olive_wood 4",
		recipe = {
			{"ebiomes:olive_tree"},
		}
	})

	minetest.register_node("ebiomes:olive_leaves", {
		description = S("Olive Tree Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_olive_leaves.png"},
		waving = 1,
		paramtype = "light",
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:olive_sapling"}, rarity = 20},
				{items = {"ebiomes:olive_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = after_place_leaves,
	})
	
	minetest.register_node("ebiomes:olives", {
		description = S("Olives"),
		drawtype = "plantlike",
		tiles = {"ebiomes_olives.png"},
		inventory_image = "ebiomes_olives.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		is_ground_content = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -4 / 16, -4 / 16, 4 / 16, 6 / 16, 4 / 16}
		},
		groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
			leafdecay = 3, leafdecay_drop = 1, food_apple = 1},
		on_use = minetest.item_eat(2),
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack)
			minetest.set_node(pos, {name = "ebiomes:olives", param2 = 1})
		end,

		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			if oldnode.param2 == 0 then
				minetest.set_node(pos, {name = "ebiomes:olives_mark"})
				minetest.get_node_timer(pos):start(math.random(300, 1500))
			end
		end,
	})

	minetest.register_node("ebiomes:olives_mark", {
		description = S("Olive Marker"),
		inventory_image = "ebiomes_olives.png^default_invisible_node_overlay.png",
		wield_image = "ebiomes_olives.png^default_invisible_node_overlay.png",
		drawtype = "airlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		pointable = false,
		diggable = false,
		buildable_to = true,
		drop = "",
		groups = {not_in_creative_inventory = 1},
		on_timer = function(pos, elapsed)
			if not minetest.find_node_near(pos, 1, "ebiomes:olive_leaves") then
				minetest.remove_node(pos)
			elseif minetest.get_node_light(pos) < 11 then
				minetest.get_node_timer(pos):start(200)
			else
				minetest.set_node(pos, {name = "ebiomes:olives"})
			end
		end
	})
	
	default.register_leafdecay({
		trunks = {"ebiomes:olive_tree"},
		leaves = {"ebiomes:olive_leaves", "ebiomes:olives"},
		radius = 3,
	})

local function grow_new_olive(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-3, y = pos.y, z = pos.z-3}, modpath.."/schematics/ebiomes_olive_tree.mts", "0", nil, false)
end

	minetest.register_node("ebiomes:olive_sapling", {
		description = S("Olive Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_olive_sapling.png"},
		inventory_image = "ebiomes_olive_sapling.png",
		wield_image = "ebiomes_olive_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_olive,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 6 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 3,
			attached_node = 1, sapling = 1},
		sounds = default.node_sound_leaves_defaults(),

		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
				"ebiomes:olive_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -3, y = 1, z = -3},
				{x = 3, y = 8, z = 3},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})

	minetest.register_decoration({
		name = "ebiomes:olive_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_med"},
		sidelen = 16,
		noise_params = {
			offset = 0.001,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 3,
			octaves = 3,
			persist = 0.05
		},
		biomes = {"mediterranean"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_olive_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
	
	minetest.register_decoration({
		name = "ebiomes:olive_log",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_med"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0009,
		biomes = {"mediterranean"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_olive_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = {"ebiomes:dirt_with_grass_med"},
		num_spawn_by = 8,
	})
	
if minetest.get_modpath("bonemeal") ~= nil then
bonemeal:add_sapling({
	{"ebiomes:olive_sapling", grow_new_olive, "soil"},
})
end

	stairs.register_stair_and_slab("olive_wood", "ebiomes:olive_wood",
		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		{"ebiomes_olive_wood.png"},
		S("Olive Wood Stair"),
		S("Olive Wood Slab"),
		default.node_sound_wood_defaults())
		
	default.register_fence("ebiomes:fence_olive_wood", {
		description = S("Olive Wood Fence"),
		texture = "ebiomes_fence_olive_wood.png",
		inventory_image = "default_fence_overlay.png^ebiomes_fence_olive_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^ebiomes_fence_olive_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:olive_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_fence_rail("ebiomes:fence_rail_olive_wood", {
		description = S("Olive Wood Fence Rail"),
		texture = "ebiomes_fence_rail_olive_wood.png",
		inventory_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_olive_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_olive_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		material = "default:olive_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_mesepost("ebiomes:mese_post_light_olive_wood", {
		description = S("Olive Wood Mese Post Light"),
		texture = "ebiomes_fence_olive_wood.png",
		material = "ebiomes:olive_wood",
	})

	doors.register_fencegate("ebiomes:gate_olive_wood", {
		description = S("Olive Wood Fence Gate"),
		texture = "ebiomes_olive_wood.png",
		material = "ebiomes:olive_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3}
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "ebiomes:gate_olive_wood_closed",
		burntime = 9,
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
	
	
	minetest.register_decoration({
		name = "ebiomes:birch_tree_small",
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
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_birch_tree_small.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})



--Humid rainforest (will rethink how to arange things in general, knowing decors.lua)

	minetest.register_decoration({
		name = "ebiomes:jungle_tree",
		deco_type = "schematic",
		place_on = {"default:dirt_with_rainforest_litter"},
		sidelen = 80,
		fill_ratio = 0.04,
		biomes = {"rainforest_humid"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("default") .. "/schematics/jungle_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	-- Swamp jungle trees

	minetest.register_decoration({
		name = "ebiomes:jungle_tree(swamp)",
		deco_type = "schematic",
		place_on = {"default:dirt"},
		sidelen = 16,
		-- Noise tuned to place swamp trees where papyrus is absent
		noise_params = {
			offset = 0.0,
			scale = -0.1,
			spread = {x = 200, y = 200, z = 200},
			seed = 354,
			octaves = 1,
			persist = 0.5
		},
		biomes = {"rainforest_humid_swamp"},
		y_max = 0,
		y_min = -1,
		schematic = minetest.get_modpath("default") .. "/schematics/jungle_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		name = "ebiomes:jungle_log",
		deco_type = "schematic",
		place_on = {"default:dirt_with_rainforest_litter"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.005,
		biomes = {"rainforest_humid"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("default") .. "/schematics/jungle_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = "default:dirt_with_rainforest_litter",
		num_spawn_by = 8,
	})
	
	--Humid deciduous (Aspen not merged because different spawnings required)
	
	minetest.register_decoration({
		name = "ebiomesdh:apple_tree",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.024,
			scale = 0.015,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest_humid"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("default") .. "/schematics/apple_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		name = "ebiomesdh:apple_log",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		place_offset_y = 1,
		sidelen = 16,
		noise_params = {
			offset = 0.0012,
			scale = 0.0007,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest_humid"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("default") .. "/schematics/apple_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = "default:dirt_with_grass",
		num_spawn_by = 8,
	})
	
	-- Aspen tree and log

	minetest.register_decoration({
		name = "ebiomesdh:aspen_tree",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.0,
			scale = -0.015,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest_humid"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("default") .. "/schematics/aspen_tree.mts",
		flags = "place_center_x, place_center_z",
	})

	minetest.register_decoration({
		name = "ebiomesdh:aspen_log",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		place_offset_y = 1,
		sidelen = 16,
		noise_params = {
			offset = 0.0,
			scale = -0.0008,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest_humid"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("default") .. "/schematics/aspen_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = "default:dirt_with_grass",
		num_spawn_by = 8,
	})
	

--Warm deciduous
	
--Pear

	minetest.register_node("ebiomes:pear_tree", {
		description = S("Pear Tree"),
		tiles = {"ebiomes_pear_tree_top.png", "ebiomes_pear_tree_top.png",
			"ebiomes_pear_tree.png"},
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

	minetest.register_node("ebiomes:pear_wood", {
		description = S("Pear Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"ebiomes_pear_wood.png"},
		is_ground_content = false,
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
		sounds = default.node_sound_wood_defaults(),
	})

	minetest.register_craft({
		output = "ebiomes:pear_wood 4",
		recipe = {
			{"ebiomes:pear_tree"},
		}
	})

	minetest.register_node("ebiomes:pear_leaves", {
		description = S("Pear Tree Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_pear_leaves.png"},
		waving = 1,
		paramtype = "light",
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:pear_sapling"}, rarity = 20},
				{items = {"ebiomes:pear_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = after_place_leaves,
	})
	
	default.register_leafdecay({
		trunks = {"ebiomes:pear_tree"},
		leaves = {"ebiomes:pear_leaves"},
		radius = 3,
	})

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

local function grow_new_pear_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-2, y = pos.y, z = pos.z-2}, modpath.."/schematics/ebiomes_pear_tree.mts", "0", nil, false)
end

--schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_pear.mts"

	minetest.register_node("ebiomes:pear_sapling", {
		description = S("Pear Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_pear_sapling.png"},
		inventory_image = "ebiomes_pear_sapling.png",
		wield_image = "ebiomes_pear_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_pear_tree,
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
				"ebiomes:pear_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -3, y = 1, z = -3},
				{x = 3, y = 10, z = 3},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})

	minetest.register_decoration({
		name = "ebiomes:pear_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_warm"},
		sidelen = 16,
		noise_params = {
			offset = 0.001,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 100,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest_warm"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_pear_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
	
	minetest.register_decoration({
		name = "ebiomes:pear_log",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_warm"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0009,
		biomes = {"deciduous_forest_warm"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_pear_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = {"ebiomes:dirt_with_grass_warm"},
		num_spawn_by = 8,
	})
	
if minetest.get_modpath("bonemeal") ~= nil then
bonemeal:add_sapling({
	{"ebiomes:pear_sapling", grow_new_pear_tree, "soil"},
})
end

	--forms sampled from pigiron mod
	stairs.register_stair_and_slab("pear_wood", "ebiomes:pear_wood",
		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		{"ebiomes_pear_wood.png"},
		S("Pear Wood Stair"),
		S("Pear Wood Slab"),
		default.node_sound_wood_defaults())
		
	default.register_fence("ebiomes:fence_pear_wood", {
		description = S("Pear Wood Fence"),
		texture = "ebiomes_fence_pear_wood.png",
		inventory_image = "default_fence_overlay.png^ebiomes_fence_pear_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^ebiomes_fence_pear_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:pear_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_fence_rail("ebiomes:fence_rail_pear_wood", {
		description = S("Pear Wood Fence Rail"),
		texture = "ebiomes_fence_rail_pear_wood.png",
		inventory_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_pear_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_pear_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		material = "default:pear_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_mesepost("ebiomes:mese_post_light_pear_wood", {
		description = S("Pear Wood Mese Post Light"),
		texture = "ebiomes_fence_pear_wood.png",
		material = "ebiomes:pear_wood",
	})

	doors.register_fencegate("ebiomes:gate_pear_wood", {
		description = S("Pear Wood Fence Gate"),
		texture = "ebiomes_pear_wood.png",
		material = "ebiomes:pear_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3}
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "ebiomes:gate_pear_wood_closed",
		burntime = 9,
	})


	minetest.register_node("ebiomes:pear", {
		description = S("Pear"),
		drawtype = "plantlike",
		tiles = {"ebiomes_pear.png"},
		inventory_image = "ebiomes_pear.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		is_ground_content = false,
		selection_box = {
			type = "fixed",
			fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
		},
		groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
			leafdecay = 3, leafdecay_drop = 1, food_apple = 1},
		on_use = minetest.item_eat(2),
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack)
			minetest.set_node(pos, {name = "ebiomes:pear", param2 = 1})
		end,

		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			if oldnode.param2 == 0 then
				minetest.set_node(pos, {name = "ebiomes:pear_mark"})
				minetest.get_node_timer(pos):start(math.random(300, 1500))
			end
		end,
	})

	minetest.register_node("ebiomes:pear_mark", {
		description = S("Pear Marker"),
		inventory_image = "ebiomes_pear.png^default_invisible_node_overlay.png",
		wield_image = "ebiomes_pear.png^default_invisible_node_overlay.png",
		drawtype = "airlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		pointable = false,
		diggable = false,
		buildable_to = true,
		drop = "",
		groups = {not_in_creative_inventory = 1},
		on_timer = function(pos, elapsed)
			if not minetest.find_node_near(pos, 1, "ebiomes:pear_leaves") then
				minetest.remove_node(pos)
			elseif minetest.get_node_light(pos) < 11 then
				minetest.get_node_timer(pos):start(200)
			else
				minetest.set_node(pos, {name = "ebiomes:pear"})
			end
		end
	})
	
	
	
--Quince

	minetest.register_node("ebiomes:quince_tree", {
		description = S("Quince Tree"),
		tiles = {"ebiomes_quince_tree_top.png", "ebiomes_quince_tree_top.png",
			"ebiomes_quince_tree.png"},
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

	minetest.register_node("ebiomes:quince_wood", {
		description = S("Quince Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"ebiomes_quince_wood.png"},
		is_ground_content = false,
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
		sounds = default.node_sound_wood_defaults(),
	})

	minetest.register_craft({
		output = "ebiomes:quince_wood 4",
		recipe = {
			{"ebiomes:quince_tree"},
		}
	})

	minetest.register_node("ebiomes:quince_leaves", {
		description = S("Quince Tree Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_quince_leaves.png"},
		waving = 1,
		paramtype = "light",
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:quince_sapling"}, rarity = 20},
				{items = {"ebiomes:quince_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = after_place_leaves,
	})
	
	default.register_leafdecay({
		trunks = {"ebiomes:quince_tree"},
		leaves = {"ebiomes:quince_leaves"},
		radius = 3,
	})

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

local function grow_new_quince_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-1, y = pos.y, z = pos.z-1}, modpath.."/schematics/ebiomes_quince_tree.mts", "0", nil, false)
end

--schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_quince.mts"

	minetest.register_node("ebiomes:quince_sapling", {
		description = S("Quince Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_quince_sapling.png"},
		inventory_image = "ebiomes_quince_sapling.png",
		wield_image = "ebiomes_quince_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_quince_tree,
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
				"ebiomes:quince_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -2, y = 1, z = -2},
				{x = 2, y = 6, z = 2},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})

	minetest.register_decoration({
		name = "ebiomes:quince_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_warm"},
		sidelen = 16,
		noise_params = {
			offset = 0.001,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 101,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest_warm"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_quince_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
	
	minetest.register_decoration({
		name = "ebiomes:quince_log",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_warm"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0009,
		biomes = {"deciduous_forest_warm"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_quince_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = {"ebiomes:dirt_with_grass_warm"},
		num_spawn_by = 8,
	})
	
if minetest.get_modpath("bonemeal") ~= nil then
bonemeal:add_sapling({
	{"ebiomes:quince_sapling", grow_new_quince_tree, "soil"},
})
end

	--forms sampled from pigiron mod
	stairs.register_stair_and_slab("quince_wood", "ebiomes:quince_wood",
		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		{"ebiomes_quince_wood.png"},
		S("Quince Wood Stair"),
		S("Quince Wood Slab"),
		default.node_sound_wood_defaults())
		
	default.register_fence("ebiomes:fence_quince_wood", {
		description = S("Quince Wood Fence"),
		texture = "ebiomes_fence_quince_wood.png",
		inventory_image = "default_fence_overlay.png^ebiomes_fence_quince_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^ebiomes_fence_quince_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:quince_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_fence_rail("ebiomes:fence_rail_quince_wood", {
		description = S("Quince Wood Fence Rail"),
		texture = "ebiomes_fence_rail_quince_wood.png",
		inventory_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_quince_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_quince_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		material = "default:quince_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_mesepost("ebiomes:mese_post_light_quince_wood", {
		description = S("Quince Wood Mese Post Light"),
		texture = "ebiomes_fence_quince_wood.png",
		material = "ebiomes:quince_wood",
	})

	doors.register_fencegate("ebiomes:gate_quince_wood", {
		description = S("Quince Wood Fence Gate"),
		texture = "ebiomes_quince_wood.png",
		material = "ebiomes:quince_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3}
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "ebiomes:gate_quince_wood_closed",
		burntime = 9,
	})


	minetest.register_node("ebiomes:quince", {
		description = S("Quince"),
		drawtype = "plantlike",
		tiles = {"ebiomes_quince.png"},
		inventory_image = "ebiomes_quince.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		is_ground_content = false,
		selection_box = {
			type = "fixed",
			fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
		},
		groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
			leafdecay = 3, leafdecay_drop = 1, food_apple = 1},
		on_use = minetest.item_eat(1),
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack)
			minetest.set_node(pos, {name = "ebiomes:quince", param2 = 1})
		end,

		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			if oldnode.param2 == 0 then
				minetest.set_node(pos, {name = "ebiomes:quince_mark"})
				minetest.get_node_timer(pos):start(math.random(300, 1500))
			end
		end,
	})

	minetest.register_node("ebiomes:quince_mark", {
		description = S("Quince Marker"),
		inventory_image = "ebiomes_quince.png^default_invisible_node_overlay.png",
		wield_image = "ebiomes_quince.png^default_invisible_node_overlay.png",
		drawtype = "airlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		pointable = false,
		diggable = false,
		buildable_to = true,
		drop = "",
		groups = {not_in_creative_inventory = 1},
		on_timer = function(pos, elapsed)
			if not minetest.find_node_near(pos, 1, "ebiomes:quince_leaves") then
				minetest.remove_node(pos)
			elseif minetest.get_node_light(pos) < 11 then
				minetest.get_node_timer(pos):start(200)
			else
				minetest.set_node(pos, {name = "ebiomes:quince"})
			end
		end
	})
	
	
	
	minetest.register_craftitem("ebiomes:dried_quince_pieces", {
		description = S("Dried Quince Pieces"),
		inventory_image = "ebiomes_dried_quince_pieces.png",
		on_use = minetest.item_eat(4),
		groups = {food_bread = 1, flammable = 2},
	})
	
	minetest.register_craft({
		type = "cooking",
		cooktime = 2,
		output = "ebiomes:dried_quince_pieces",
		recipe = "ebiomes:quince",
	})
	
	
	
	
--Chestnut

	minetest.register_node("ebiomes:chestnut_tree", {
		description = S("Chestnut Tree"),
		tiles = {"ebiomes_chestnut_tree_top.png", "ebiomes_chestnut_tree_top.png",
			"ebiomes_chestnut_tree.png"},
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

	minetest.register_node("ebiomes:chestnut_wood", {
		description = S("Chestnut Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"ebiomes_chestnut_wood.png"},
		is_ground_content = false,
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
		sounds = default.node_sound_wood_defaults(),
	})

	minetest.register_craft({
		output = "ebiomes:chestnut_wood 4",
		recipe = {
			{"ebiomes:chestnut_tree"},
		}
	})

	minetest.register_node("ebiomes:chestnut_leaves", {
		description = S("Chestnut Tree Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_chestnut_leaves.png"},
		waving = 1,
		paramtype = "light",
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:chestnut_sapling"}, rarity = 20},
				{items = {"ebiomes:chestnut_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = after_place_leaves,
	})
	
	default.register_leafdecay({
		trunks = {"ebiomes:chestnut_tree"},
		leaves = {"ebiomes:chestnut_leaves"},
		radius = 3,
	})

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

local function grow_new_chestnut_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-4, y = pos.y, z = pos.z-4}, modpath.."/schematics/ebiomes_chestnut_tree.mts", "0", nil, false)
end

--schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_chestnut.mts"

	minetest.register_node("ebiomes:chestnut_sapling", {
		description = S("Chestnut Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_chestnut_sapling.png"},
		inventory_image = "ebiomes_chestnut_sapling.png",
		wield_image = "ebiomes_chestnut_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_chestnut_tree,
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
				"ebiomes:chestnut_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 13, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})

	minetest.register_decoration({
		name = "ebiomes:chestnut_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_warm"},
		sidelen = 16,
		noise_params = {
			offset = 0.001,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 106,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest_warm"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_chestnut_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
	
	minetest.register_decoration({
		name = "ebiomes:chestnut_log",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_warm"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0009,
		biomes = {"deciduous_forest_warm"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_chestnut_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = {"ebiomes:dirt_with_grass_warm"},
		num_spawn_by = 8,
	})
	
if minetest.get_modpath("bonemeal") ~= nil then
bonemeal:add_sapling({
	{"ebiomes:chestnut_sapling", grow_new_chestnut_tree, "soil"},
})
end

	--forms sampled from pigiron mod
	stairs.register_stair_and_slab("chestnut_wood", "ebiomes:chestnut_wood",
		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		{"ebiomes_chestnut_wood.png"},
		S("Chestnut Wood Stair"),
		S("Chestnut Wood Slab"),
		default.node_sound_wood_defaults())
		
	default.register_fence("ebiomes:fence_chestnut_wood", {
		description = S("Chestnut Wood Fence"),
		texture = "ebiomes_fence_chestnut_wood.png",
		inventory_image = "default_fence_overlay.png^ebiomes_fence_chestnut_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^ebiomes_fence_chestnut_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:chestnut_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_fence_rail("ebiomes:fence_rail_chestnut_wood", {
		description = S("Chestnut Wood Fence Rail"),
		texture = "ebiomes_fence_rail_chestnut_wood.png",
		inventory_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_chestnut_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_chestnut_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		material = "default:chestnut_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_mesepost("ebiomes:mese_post_light_chestnut_wood", {
		description = S("Chestnut Wood Mese Post Light"),
		texture = "ebiomes_fence_chestnut_wood.png",
		material = "ebiomes:chestnut_wood",
	})

	doors.register_fencegate("ebiomes:gate_chestnut_wood", {
		description = S("Chestnut Wood Fence Gate"),
		texture = "ebiomes_chestnut_wood.png",
		material = "ebiomes:chestnut_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3}
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "ebiomes:gate_chestnut_wood_closed",
		burntime = 9,
	})


	minetest.register_node("ebiomes:chestnuts", {
		description = S("Chestnuts"),
		drawtype = "plantlike",
		tiles = {"ebiomes_chestnuts.png"},
		inventory_image = "ebiomes_chestnuts.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		is_ground_content = false,
		selection_box = {
			type = "fixed",
			fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
		},
		groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
			leafdecay = 3, leafdecay_drop = 1},
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack)
			minetest.set_node(pos, {name = "ebiomes:chestnuts", param2 = 1})
		end,

		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			if oldnode.param2 == 0 then
				minetest.set_node(pos, {name = "ebiomes:chestnuts_mark"})
				minetest.get_node_timer(pos):start(math.random(300, 1500))
			end
		end,
	})

	minetest.register_node("ebiomes:chestnuts_mark", {
		description = S("Chestnut Marker"),
		inventory_image = "ebiomes_chestnuts.png^default_invisible_node_overlay.png",
		wield_image = "ebiomes_chestnuts.png^default_invisible_node_overlay.png",
		drawtype = "airlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		pointable = false,
		diggable = false,
		buildable_to = true,
		drop = "",
		groups = {not_in_creative_inventory = 1},
		on_timer = function(pos, elapsed)
			if not minetest.find_node_near(pos, 1, "ebiomes:chestnut_leaves") then
				minetest.remove_node(pos)
			elseif minetest.get_node_light(pos) < 11 then
				minetest.get_node_timer(pos):start(200)
			else
				minetest.set_node(pos, {name = "ebiomes:chestnuts"})
			end
		end
	})
	
	
	
	minetest.register_craftitem("ebiomes:chestnuts_peeled", {
		description = S("Peeled Chestnuts"),
		inventory_image = "ebiomes_chestnuts_peeled.png",
		groups = {food_bread = 1, flammable = 2},
	})
	
	minetest.register_craft({
		output = "ebiomes:chestnuts_peeled",
		recipe = {
			{"ebiomes:chestnuts"},
		}
	})
	
	minetest.register_craftitem("ebiomes:chestnuts_roasted", {
		description = S("Roasted Chestnuts"),
		inventory_image = "ebiomes_chestnuts_roasted.png",
		on_use = minetest.item_eat(4),
		groups = {food_bread = 1, flammable = 2},
	})
	
	minetest.register_craft({
		type = "cooking",
		cooktime = 2,
		output = "ebiomes:chestnuts_roasted",
		recipe = "ebiomes:chestnuts_peeled",
	})
	
	
--Hornbeam

	minetest.register_node("ebiomes:hornbeam_tree", {
		description = S("Hornbeam Tree"),
		tiles = {"ebiomes_hornbeam_tree_top.png", "ebiomes_hornbeam_tree_top.png",
			"ebiomes_hornbeam_tree.png"},
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

	minetest.register_node("ebiomes:hornbeam_wood", {
		description = S("Hornbeam Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"ebiomes_hornbeam_wood.png"},
		is_ground_content = false,
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
		sounds = default.node_sound_wood_defaults(),
	})

	minetest.register_craft({
		output = "ebiomes:hornbeam_wood 4",
		recipe = {
			{"ebiomes:hornbeam_tree"},
		}
	})

	minetest.register_node("ebiomes:hornbeam_leaves", {
		description = S("Hornbeam Tree Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_hornbeam_leaves.png"},
		waving = 1,
		paramtype = "light",
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:hornbeam_sapling"}, rarity = 20},
				{items = {"ebiomes:hornbeam_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = after_place_leaves,
	})
	
	default.register_leafdecay({
		trunks = {"ebiomes:hornbeam_tree"},
		leaves = {"ebiomes:hornbeam_leaves"},
		radius = 3,
	})

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

local function grow_new_hornbeam_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-3, y = pos.y, z = pos.z-3}, modpath.."/schematics/ebiomes_hornbeam_tree.mts", "0", nil, false)
end

--schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_hornbeam.mts"

	minetest.register_node("ebiomes:hornbeam_sapling", {
		description = S("Hornbeam Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_hornbeam_sapling.png"},
		inventory_image = "ebiomes_hornbeam_sapling.png",
		wield_image = "ebiomes_hornbeam_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_hornbeam_tree,
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
				"ebiomes:hornbeam_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -3, y = 1, z = -3},
				{x = 3, y = 10, z = 3},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})

	minetest.register_decoration({
		name = "ebiomes:hornbeam_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_warm"},
		sidelen = 16,
		noise_params = {
			offset = 0.01,
			scale = 0.01,
			spread = {x = 250, y = 250, z = 250},
			seed = 106,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest_warm"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_hornbeam_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
	
	minetest.register_decoration({
		name = "ebiomes:hornbeam_log",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_warm"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0009,
		biomes = {"deciduous_forest_warm"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_hornbeam_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = {"ebiomes:dirt_with_grass_warm"},
		num_spawn_by = 8,
	})
	
if minetest.get_modpath("bonemeal") ~= nil then
bonemeal:add_sapling({
	{"ebiomes:hornbeam_sapling", grow_new_hornbeam_tree, "soil"},
})
end

	--forms sampled from pigiron mod
	stairs.register_stair_and_slab("hornbeam_wood", "ebiomes:hornbeam_wood",
		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		{"ebiomes_hornbeam_wood.png"},
		S("Hornbeam Wood Stair"),
		S("Hornbeam Wood Slab"),
		default.node_sound_wood_defaults())
		
	default.register_fence("ebiomes:fence_hornbeam_wood", {
		description = S("Hornbeam Wood Fence"),
		texture = "ebiomes_fence_hornbeam_wood.png",
		inventory_image = "default_fence_overlay.png^ebiomes_fence_hornbeam_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^ebiomes_fence_hornbeam_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:hornbeam_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_fence_rail("ebiomes:fence_rail_hornbeam_wood", {
		description = S("Hornbeam Wood Fence Rail"),
		texture = "ebiomes_fence_rail_hornbeam_wood.png",
		inventory_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_hornbeam_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_hornbeam_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		material = "default:hornbeam_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_mesepost("ebiomes:mese_post_light_hornbeam_wood", {
		description = S("Hornbeam Wood Mese Post Light"),
		texture = "ebiomes_fence_hornbeam_wood.png",
		material = "ebiomes:hornbeam_wood",
	})

	doors.register_fencegate("ebiomes:gate_hornbeam_wood", {
		description = S("Hornbeam Wood Fence Gate"),
		texture = "ebiomes_hornbeam_wood.png",
		material = "ebiomes:hornbeam_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3}
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "ebiomes:gate_hornbeam_wood_closed",
		burntime = 9,
	})
