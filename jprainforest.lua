local S = minetest.get_translator("ebiomes")

--from runs cooltrees
local modname = "ebiomes"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")

--Aliases
minetest.register_alias("dirt_japanese_rainforest_litter", "ebiomes:dirt_with_japanese_rainforest_litter")
minetest.register_alias("dirt_japanese_rainforest_litter_footsteps", "ebiomes:dirt_with_japanese_rainforest_litter_footsteps")
minetest.register_alias("sugi_tree", "ebiomes:sugi_tree")
minetest.register_alias("sugi_wood", "ebiomes:sugi_wood")
minetest.register_alias("sugi_leaves", "ebiomes:sugi_leaves")
minetest.register_alias("sugi_sapling", "ebiomes:sugi_sapling")
minetest.register_alias("mizunara_tree", "ebiomes:mizunara_tree")
minetest.register_alias("mizunara_wood", "ebiomes:mizunara_wood")
minetest.register_alias("mizunara_leaves", "ebiomes:mizunara_leaves")
minetest.register_alias("mizunara_sapling", "ebiomes:mizunara_sapling")
minetest.register_alias("stoneoak_tree", "ebiomes:stoneoak_tree")
minetest.register_alias("stoneoak_wood", "ebiomes:stoneoak_wood")
minetest.register_alias("stoneoak_leaves", "ebiomes:stoneoak_leaves")
minetest.register_alias("stoneoak_sapling", "ebiomes:stoneoak_sapling")
minetest.register_alias("forestgrowth", "ebiomes:forestgrowth")



-- Japanese rainforest

	minetest.register_node("ebiomes:dirt_with_japanese_rainforest_litter", {
		description = S("Dirt with Japanese Rainforest Litter"),
		tiles = {"ebiomes_japanese_rainforest_litter.png", "default_dirt.png",
			{name = "default_dirt.png^ebiomes_japanese_rainforest_litter_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
		drop = "default:dirt",
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.25},
		}),
		soil = {
			base = "ebiomes:dirt_with_japanese_rainforest_litter",
			dry = "farming:soil",
			wet = "farming:soil_wet"
		}
	})

	minetest.register_node("ebiomes:dirt_with_japanese_rainforest_litter_footsteps", {
		description = S("Dirt with Japanese Rainforest Litter and Footsteps"),
		tiles = {"ebiomes_japanese_rainforest_litter.png^default_footprint.png", "default_dirt.png",
			{name = "default_dirt.png^ebiomes_japanese_rainforest_litter_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1, not_in_creative_inventory = 1},
		drop = "default:dirt",
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.25},
		}),
		soil = {
			base = "ebiomes:dirt_with_japanese_rainforest_litter",
			dry = "farming:soil",
			wet = "farming:soil_wet"
		}
	})

	minetest.register_biome({
		name = "japanese_rainforest",
		node_top = "ebiomes:dirt_with_japanese_rainforest_litter",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 31000,
		y_min = 1,
		heat_point = 65,
		humidity_point = 80,
	})

	minetest.register_biome({
		name = "japanese_rainforest_shore",
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
		heat_point = 65,
		humidity_point = 80,
	})

	minetest.register_biome({
		name = "japanese_rainforest_ocean",
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
		heat_point = 65,
		humidity_point = 80,
	})

	minetest.register_biome({
		name = "japanese_rainforest_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = -400,
		heat_point = 65,
		humidity_point = 80,
	})

--moss

	minetest.register_node("ebiomes:moss", {
		description = S("Moss"),
		tiles = {"ebiomes_moss.png"},
		inventory_image = "ebiomes_moss_clump.png",
		wield_image = "ebiomes_moss_clump.png",
		paramtype = "light",
		buildable_to = true,
		floodable = true,
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, -6 / 16, 0.5},
			},
		},
		groups = {crumbly = 3, falling_node = 1},
		sounds = default.node_sound_leaves_defaults(),
	})

	minetest.register_decoration({
		name = "ebiomes:moss_l1",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_japanese_rainforest_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0.0001,
			scale = 0.0001,
			spread = {x = 250, y = 250, z = 250},
			seed = 21,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"japanese_rainforest"},
		height = 1,
		y_min = 1,
		y_max = 31000,
--		place_offset_y = -1,
		decoration = "ebiomes:moss",
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
	})

	minetest.register_decoration({
		name = "ebiomes:moss_l2",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_japanese_rainforest_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0.9,
			scale = 0.9,
			spread = {x = 250, y = 250, z = 250},
			seed = 21,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"japanese_rainforest"},
		height = 1,
		y_min = 1,
		y_max = 31000,
--		place_offset_y = -1,
		decoration = "ebiomes:moss",
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
		spawn_by = "ebiomes:moss",
		num_spawn_by = 1
	})


	minetest.register_craft({
		output = "default:mossycobble 8",
		recipe = {
			{"default:cobble", "default:cobble", "default:cobble"},
			{"default:cobble", "ebiomes:moss", "default:cobble"},
			{"default:cobble", "default:cobble", "default:cobble"}
		}
	})

--Decors

--woods

--Japanese rainforrest

--Sugi

	minetest.register_node("ebiomes:sugi_tree", {
		description = S("Sugi Tree"),
		tiles = {"ebiomes_sugi_tree_top.png", "ebiomes_sugi_tree_top.png",
			"ebiomes_sugi_tree.png"},
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

	minetest.register_node("ebiomes:sugi_wood", {
		description = S("Sugi Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"ebiomes_sugi_wood.png"},
		is_ground_content = false,
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
		sounds = default.node_sound_wood_defaults(),
	})

	minetest.register_craft({
		output = "ebiomes:sugi_wood 4",
		recipe = {
			{"ebiomes:sugi_tree"},
		}
	})

	minetest.register_node("ebiomes:sugi_leaves", {
		description = S("Sugi Tree Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_sugi_leaves.png"},
		waving = 1,
		paramtype = "light",
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:sugi_sapling"}, rarity = 20},
				{items = {"ebiomes:sugi_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = default.after_place_leaves,
	})

	default.register_leafdecay({
		trunks = {"ebiomes:sugi_tree"},
		leaves = {"ebiomes:sugi_leaves"},
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

local function grow_new_sugi_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-3, y = pos.y, z = pos.z-2}, modpath.."/schematics/ebiomes_sugi_tree.mts", "0", nil, false)
end

--schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_sugi_tree.mts"

	minetest.register_node("ebiomes:sugi_sapling", {
		description = S("Sugi Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_sugi_sapling.png"},
		inventory_image = "ebiomes_sugi_sapling.png",
		wield_image = "ebiomes_sugi_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_sugi_tree,
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
				"ebiomes:sugi_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -3, y = 1, z = -2},
				{x = 3, y = 16, z = 2},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})

if minetest.settings:get_bool("light_mapgen", true) then

	minetest.register_decoration({
		name = "ebiomes:sugi_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_japanese_rainforest_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0.04,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 201,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"japanese_rainforest"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_sugi_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random"
	})


else

	minetest.register_decoration({
		name = "ebiomes:sugi_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_japanese_rainforest_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0.05,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 201,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"japanese_rainforest"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_sugi_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random"
	})

end

	minetest.register_decoration({
		name = "ebiomes:sugi_log",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_japanese_rainforest_litter"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0009,
		biomes = {"japanese_rainforest"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_sugi_log.mts",
		flags = "place_center_x",
		rotation = "random"
	})

if minetest.get_modpath("bonemeal") ~= nil then
bonemeal:add_sapling({
	{"ebiomes:sugi_sapling", grow_new_sugi_tree, "soil"},
})
end
--forms sampled from pigiron mod
	stairs.register_stair_and_slab("sugi_wood", "ebiomes:sugi_wood",
		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		{"ebiomes_sugi_wood.png"},
		S("Sugi Wood Stair"),
		S("Sugi Wood Slab"),
		default.node_sound_wood_defaults(),
		true,
		S("Inner Sugi Wood Stair"),
		S("Outer Sugi Wood Stair")
	)

	default.register_fence("ebiomes:fence_sugi_wood", {
		description = S("Sugi Wood Fence"),
		texture = "ebiomes_fence_sugi_wood.png",
		inventory_image = "default_fence_overlay.png^ebiomes_fence_sugi_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^ebiomes_fence_sugi_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:sugi_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
		})

	default.register_fence_rail("ebiomes:fence_rail_sugi_wood", {
		description = S("Sugi Wood Fence Rail"),
		texture = "ebiomes_fence_rail_sugi_wood.png",
		inventory_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_sugi_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_sugi_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:sugi_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_mesepost("ebiomes:mese_post_light_sugi_wood", {
		description = S("Sugi Wood Mese Post Light"),
		texture = "ebiomes_fence_sugi_wood.png",
		material = "ebiomes:sugi_wood",
	})

	doors.register_fencegate("ebiomes:gate_sugi_wood", {
		description = S("Sugi Wood Fence Gate"),
		texture = "ebiomes_sugi_wood.png",
		material = "ebiomes:sugi_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3}
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "ebiomes:gate_sugi_wood_closed",
		burntime = 9,
	})


--Mizunara

	minetest.register_node("ebiomes:mizunara_tree", {
		description = S("Mizunara Tree"),
		tiles = {"ebiomes_mizunara_tree_top.png", "ebiomes_mizunara_tree_top.png",
			"ebiomes_mizunara_tree.png"},
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

	minetest.register_node("ebiomes:mizunara_wood", {
		description = S("Mizunara Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"ebiomes_mizunara_wood.png"},
		is_ground_content = false,
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
		sounds = default.node_sound_wood_defaults(),
	})

	minetest.register_craft({
		output = "ebiomes:mizunara_wood 4",
		recipe = {
			{"ebiomes:mizunara_tree"},
		}
	})

	minetest.register_node("ebiomes:mizunara_leaves", {
		description = S("Mizunara Tree Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_mizunara_leaves.png"},
		waving = 1,
		paramtype = "light",
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:mizunara_sapling"}, rarity = 20},
				{items = {"ebiomes:mizunara_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = default.after_place_leaves,
	})

	default.register_leafdecay({
		trunks = {"ebiomes:mizunara_tree"},
		leaves = {"ebiomes:mizunara_leaves"},
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

local function grow_new_mizunara_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-3, y = pos.y, z = pos.z-3}, modpath.."/schematics/ebiomes_mizunara_tree.mts", "0", nil, false)
end

--schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_mizunara.mts"

	minetest.register_node("ebiomes:mizunara_sapling", {
		description = S("Mizunara Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_mizunara_sapling.png"},
		inventory_image = "ebiomes_mizunara_sapling.png",
		wield_image = "ebiomes_mizunara_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_mizunara_tree,
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
				"ebiomes:mizunara_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -3, y = 1, z = -3},
				{x = 4, y = 14, z = 3},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})

if minetest.settings:get_bool("light_mapgen", true) then

	minetest.register_decoration({
		name = "ebiomes:mizunara_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_japanese_rainforest_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0.008,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 702,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"japanese_rainforest"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_mizunara_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random"
	})

else

	minetest.register_decoration({
		name = "ebiomes:mizunara_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_japanese_rainforest_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0.008,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 702,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"japanese_rainforest"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_mizunara_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random"
	})

end

	minetest.register_decoration({
		name = "ebiomes:mizunara_log",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_japanese_rainforest_litter"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0009,
		biomes = {"japanese_rainforest"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_mizunara_log.mts",
		flags = "place_center_x",
		rotation = "random"
	})

if minetest.get_modpath("bonemeal") ~= nil then
bonemeal:add_sapling({
	{"ebiomes:mizunara_sapling", grow_new_mizunara_tree, "soil"},
})
end
--forms sampled from pigiron mod
	stairs.register_stair_and_slab("mizunara_wood", "ebiomes:mizunara_wood",
		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		{"ebiomes_mizunara_wood.png"},
		S("Mizunara Wood Stair"),
		S("Mizunara Wood Slab"),
		default.node_sound_wood_defaults(),
		true,
		S("Inner Mizunara Wood Stair"),
		S("Outer Mizunara Wood Stair")
	)

	default.register_fence("ebiomes:fence_mizunara_wood", {
		description = S("Mizunara Wood Fence"),
		texture = "ebiomes_fence_mizunara_wood.png",
		inventory_image = "default_fence_overlay.png^ebiomes_fence_mizunara_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^ebiomes_fence_mizunara_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:mizunara_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_fence_rail("ebiomes:fence_rail_mizunara_wood", {
		description = S("Mizunara Wood Fence Rail"),
		texture = "ebiomes_fence_rail_mizunara_wood.png",
		inventory_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_mizunara_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_mizunara_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:mizunara_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_mesepost("ebiomes:mese_post_light_mizunara_wood", {
		description = S("Mizunara Wood Mese Post Light"),
		texture = "ebiomes_fence_mizunara_wood.png",
		material = "ebiomes:mizunara_wood",
	})

	doors.register_fencegate("ebiomes:gate_mizunara_wood", {
		description = S("Mizunara Wood Fence Gate"),
		texture = "ebiomes_mizunara_wood.png",
		material = "ebiomes:mizunara_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3}
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "ebiomes:gate_mizunara_wood_closed",
		burntime = 9,
	})



--Stone Oak

	minetest.register_node("ebiomes:stoneoak_tree", {
		description = S("Stone Oak Tree"),
		tiles = {"ebiomes_stoneoak_tree_top.png", "ebiomes_stoneoak_tree_top.png",
			"ebiomes_stoneoak_tree.png"},
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

	minetest.register_node("ebiomes:stoneoak_wood", {
		description = S("Stone Oak Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"ebiomes_stoneoak_wood.png"},
		is_ground_content = false,
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
		sounds = default.node_sound_wood_defaults(),
	})

	minetest.register_craft({
		output = "ebiomes:stoneoak_wood 4",
		recipe = {
			{"ebiomes:stoneoak_tree"},
		}
	})

	minetest.register_node("ebiomes:stoneoak_leaves", {
		description = S("Stone Oak Tree Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_stoneoak_leaves.png"},
		waving = 1,
		paramtype = "light",
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:stoneoak_sapling"}, rarity = 20},
				{items = {"ebiomes:stoneoak_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = default.after_place_leaves,
	})

	default.register_leafdecay({
		trunks = {"ebiomes:stoneoak_tree"},
		leaves = {"ebiomes:stoneoak_leaves"},
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

local function grow_new_stoneoak_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-3, y = pos.y, z = pos.z-3}, modpath.."/schematics/ebiomes_stoneoak_tree.mts", "0", nil, false)
end

--schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_stoneoak.mts"

	minetest.register_node("ebiomes:stoneoak_sapling", {
		description = S("Stone Oak Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_stoneoak_sapling.png"},
		inventory_image = "ebiomes_stoneoak_sapling.png",
		wield_image = "ebiomes_stoneoak_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_stoneoak_tree,
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
				"ebiomes:stoneoak_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -3, y = 1, z = -3},
				{x = 3, y = 11, z = 3},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})

if minetest.settings:get_bool("light_mapgen", true) then

	minetest.register_decoration({
		name = "ebiomes:stoneoak_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_japanese_rainforest_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0.008,
			scale = 0.005,
			spread = {x = 250, y = 250, z = 250},
			seed = 1203,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"japanese_rainforest"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_stoneoak_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random"
	})


else

	minetest.register_decoration({
		name = "ebiomes:stoneoak_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_japanese_rainforest_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0.012,
			scale = 0.005,
			spread = {x = 250, y = 250, z = 250},
			seed = 1203,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"japanese_rainforest"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_stoneoak_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random"
	})

end

	minetest.register_decoration({
		name = "ebiomes:stoneoak_log",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_japanese_rainforest_litter"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0009,
		biomes = {"japanese_rainforest"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_stoneoak_log.mts",
		flags = "place_center_x",
		rotation = "random"
	})

if minetest.get_modpath("bonemeal") ~= nil then
bonemeal:add_sapling({
	{"ebiomes:stoneoak_sapling", grow_new_stoneoak_tree, "soil"},
})
end
--forms sampled from pigiron mod
	stairs.register_stair_and_slab("stoneoak_wood", "ebiomes:stoneoak_wood",
		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		{"ebiomes_stoneoak_wood.png"},
		S("Stone Oak Wood Stair"),
		S("Stone Oak Wood Slab"),
		default.node_sound_wood_defaults(),
		true,
		S("Inner Stone Oak Wood Stair"),
		S("Outer Stone Oak Wood Stair")
	)

	default.register_fence("ebiomes:fence_stoneoak_wood", {
		description = S("Stone Oak Wood Fence"),
		texture = "ebiomes_fence_stoneoak_wood.png",
		inventory_image = "default_fence_overlay.png^ebiomes_fence_stoneoak_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^ebiomes_fence_stoneoak_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:stoneoak_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_fence_rail("ebiomes:fence_rail_stoneoak_wood", {
		description = S("Stone Oak Wood Fence Rail"),
		texture = "ebiomes_fence_rail_stoneoak_wood.png",
		inventory_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_stoneoak_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_stoneoak_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:stoneoak_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_mesepost("ebiomes:mese_post_light_stoneoak_wood", {
		description = S("Stone Oak Wood Mese Post Light"),
		texture = "ebiomes_fence_stoneoak_wood.png",
		material = "ebiomes:stoneoak_wood",
	})

	doors.register_fencegate("ebiomes:gate_stoneoak_wood", {
		description = S("Stone Oak Wood Fence Gate"),
		texture = "ebiomes_stoneoak_wood.png",
		material = "ebiomes:stoneoak_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3}
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "ebiomes:gate_stoneoak_wood_closed",
		burntime = 9,
	})

for length = 1, 3 do
	minetest.register_decoration({
		name = "ebiomes:fernjp_"..length,
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_japanese_rainforest_litter"},
		sidelen = 80,
		fill_ratio = 0.1,
		biomes = {"japanese_rainforest"},
		y_max = 31000,
		y_min = 1,
		decoration = "default:fern_"..length,
	})
end

--[[
	minetest.register_decoration({
		name = "ebiomes:junglegrass_jrf",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_japanese_rainforest_litter"},
		sidelen = 80,
		fill_ratio = 0.1,
		biomes = {"japanese_rainforest"},
		y_max = 31000,
		y_min = 1,
		decoration = "default:junglegrass",
	})
--]]

	minetest.register_node("ebiomes:forestgrowth", {
		description = S("Forest Growth"),
		drawtype = "plantlike",
		waving = 1,
		visual_scale = 1.2,
		tiles = {"ebiomes_forestgrowth.png"},
		inventory_image = "ebiomes_forestgrowth.png",
		wield_image = "ebiomes_forestgrowth.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, attached_node = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 4 / 16, 6 / 16},
		},
	})


	minetest.register_decoration({
		name = "ebiomes:forestgrowth",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_japanese_rainforest_litter"},
		sidelen = 80,
		fill_ratio = 0.1,
		biomes = {"japanese_rainforest"},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:forestgrowth",
	})

	minetest.register_craft({
		output = "default:stick",
		recipe = {
			{"ebiomes:forestgrowth", "ebiomes:forestgrowth"},
			{"ebiomes:forestgrowth", "ebiomes:forestgrowth"}
		}
	})

--Other mods

--Misc

if minetest.get_modpath("moreblocks") then


	stairsplus:register_all("sugi_tree", "wood", "ebiomes:sugi_wood", {
		description = "Sugi Wood",
		tiles = {"ebiomes_sugi_wood.png"},
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})

	stairsplus:register_all("mizunara_tree", "wood", "ebiomes:mizunara_wood", {
		description = "Mizunara Wood",
		tiles = {"ebiomes_mizunara_wood.png"},
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})

	stairsplus:register_all("stoneoak_tree", "wood", "ebiomes:stoneoak_wood", {
		description = "Stone Oak Wood",
		tiles = {"ebiomes_stoneoak_wood.png"},
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})

end

-- Support for flowerpot
if minetest.global_exists("flowerpot") then

	flowerpot.register_node("ebiomes:sugi_sapling")
	flowerpot.register_node("ebiomes:mizunara_sapling")
	flowerpot.register_node("ebiomes:stoneoak_sapling")

end

--Ground stuff
if minetest.get_modpath("bonemeal") ~= nil then
	bonemeal:add_deco({
		{"ebiomes:dirt_with_japanese_rainforest_litter", {"default:fern_1", "default:fern_2", "default:fern_3"},
			{"ebiomes:forestgrowth", "ebiomes:moss"} }
	})

end
