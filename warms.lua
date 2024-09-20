local S = minetest.get_translator("ebiomes")

--from runs cooltrees
local modname = "ebiomes"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")

--Aliases

minetest.register_alias("dirt_with_warm_grass", "ebiomes:dirt_with_grass_warm")
minetest.register_alias("dirt_with_warm_grass_footsteps", "ebiomes:dirt_with_grass_warm_footsteps")

minetest.register_alias("larkspur", "ebiomes:larkspur")

minetest.register_alias("chestnut_tree", "ebiomes:chestnut_tree")
minetest.register_alias("chestnut_wood", "ebiomes:chestnut_wood")
minetest.register_alias("chestnut_leaves", "ebiomes:chestnut_leaves")
minetest.register_alias("chestnut_sapling", "ebiomes:chestnut_sapling")
minetest.register_alias("chestnuts", "ebiomes:chestnuts")
minetest.register_alias("chestnuts_peeled", "ebiomes:chestnuts_peeled")
minetest.register_alias("chestnuts_roasted", "ebiomes:chestnuts_roasted")

minetest.register_alias("pear_tree", "ebiomes:pear_tree")
minetest.register_alias("pear_wood", "ebiomes:pear_wood")
minetest.register_alias("pear_leaves", "ebiomes:pear_leaves")
minetest.register_alias("pear_sapling", "ebiomes:pear_sapling")
minetest.register_alias("pear", "ebiomes:pear")
minetest.register_alias("quince_tree", "ebiomes:quince_tree")
minetest.register_alias("quince_wood", "ebiomes:quince_wood")
minetest.register_alias("quince_leaves", "ebiomes:quince_leaves")
minetest.register_alias("quince_sapling", "ebiomes:quince_sapling")
minetest.register_alias("quince", "ebiomes:quince")
minetest.register_alias("dried_quince_pieces", "ebiomes:dried_quince_pieces")

-- Warm deciduous forest

	minetest.register_node("ebiomes:dirt_with_grass_warm", {
		description = S("Dirt with Warm Grass"),
		tiles = {"ebiomes_grass_warm.png", "default_dirt.png",
			{name = "default_dirt.png^ebiomes_grass_warm_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
		drop = "default:dirt",
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.25},
		}),
		soil = {
			base = "ebiomes:dirt_with_grass_warm",
			dry = "farming:soil",
			wet = "farming:soil_wet"
		}
	})

	minetest.register_node("ebiomes:dirt_with_grass_warm_footsteps", {
		description = S("Dirt with Warm Grass and Footsteps"),
		tiles = {"ebiomes_grass_warm.png^default_footprint.png", "default_dirt.png",
			{name = "default_dirt.png^ebiomes_grass_warm_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1, not_in_creative_inventory = 1},
		drop = "default:dirt",
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.25},
		}),
	})

	minetest.register_node("ebiomes:grass_warm_1", {
		description = S("Warm Grass"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"ebiomes_grass_warm_1.png"},
		-- Use texture of a taller grass stage in inventory
		inventory_image = "ebiomes_grass_warm_3.png",
		wield_image = "ebiomes_grass_warm_3.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
			groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1,
		normal_grass = 1, flammable = 1},
		max_items = 1,
			items = {
				{items = {"farming:seed_wheat"}, rarity = 5},
				{items = {"ebiomes:grass_warm_1"}},
			},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
		},

		on_place = function(itemstack, placer, pointed_thing)
			-- place a random grass node
			local stack = ItemStack("ebiomes:grass_warm_" .. math.random(1,5))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("ebiomes:grass_warm_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})

for i = 2, 5 do
	minetest.register_node("ebiomes:grass_warm_" .. i, {
		description = S("Warm Grass"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"ebiomes_grass_warm_" .. i .. ".png"},
		inventory_image = "ebiomes_grass_warm_" .. i .. ".png",
		wield_image = "ebiomes_grass_warm_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		drop = "ebiomes:grass_warm_1",
		groups = {snappy = 3, flora = 1, attached_node = 1,
			not_in_creative_inventory = 1, grass = 1,
			normal_grass = 1, flammable = 1},
		items = {
			{items = {"farming:seed_wheat"}, rarity = 5},
			{items = {"ebiomes:grass_warm_1"}},
		},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},
	})
end

	minetest.register_biome({
		name = "deciduous_forest_warm",
		node_top = "ebiomes:dirt_with_grass_warm",
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
		heat_point = 65,
		humidity_point = 60,
	})

	minetest.register_biome({
		name = "deciduous_forest_warm_shore",
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
		heat_point = 65,
		humidity_point = 60,
	})

	minetest.register_biome({
		name = "deciduous_forest_warm_ocean",
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
		humidity_point = 60,
	})

	minetest.register_biome({
		name = "deciduous_forest_warm_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = -400,
		heat_point = 65,
		humidity_point = 60,
	})

for length = 1, 5 do
	minetest.register_decoration({
		name = "ebiomes:grass_warm_"..length,
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_warm"},
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
		decoration = "ebiomes:grass_warm_"..length,
	})
end



--Warm Grassland

minetest.register_biome({
		name = "grassland_warm",
		node_top = "ebiomes:dirt_with_grass_warm",
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
		heat_point = 65,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "grassland_warm_dunes",
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
		heat_point = 65,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "grassland_warm_ocean",
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
		heat_point = 65,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "grassland_warm_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = -400,
		heat_point = 65,
		humidity_point = 35,
	})

--Folliage

--Biome specific

	minetest.register_node("ebiomes:larkspur", {
		description = S("Larkspur"),
		tiles = {"ebiomes_larkspur.png"},
		inventory_image = "ebiomes_larkspur.png",
		wield_image = "ebiomes_larkspur.png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {flower = 1, snappy = 3, attached_node = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, -2 / 16, 3 / 16},
		}
	})

    minetest.register_craft({
		output = "dye:violet 4",
		recipe = {
			{"ebiomes:larkspur"}
		},
	})

	minetest.register_decoration({
		name = "ebiomes:larkspur",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_warm"},
		sidelen = 16,
		noise_params = {
			offset = 0.006,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 384,
			octaves = 3,
			persist = 0.05
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:larkspur",
	})

--Woods

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

		after_place_node = default.after_place_leaves,
	})

	default.register_leafdecay({
		trunks = {"ebiomes:pear_tree"},
		leaves = {"ebiomes:pear_leaves"},
		radius = 3,
	})

local function grow_new_pear_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-2, y = pos.y, z = pos.z-2}, modpath.."/schematics/ebiomes_pear_tree.mts", "0", nil, false)
end


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

if minetest.settings:get_bool("light_mapgen", true) then
	minetest.register_decoration({
		name = "ebiomes:pear_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_warm"},
		sidelen = 16,
		noise_params = {
			offset = 0.003,
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
else
	minetest.register_decoration({
		name = "ebiomes:pear_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_warm"},
		sidelen = 16,
		noise_params = {
			offset = 0.003,
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
end

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
		default.node_sound_wood_defaults(),
		true,
		S("Inner Pear Wood Stair"),
		S("Outer Pear Wood Stair")
	)

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
		material = "ebiomes:pear_wood",
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
			leafdecay = 3, leafdecay_drop = 1, food_apple = 1, eatable = 2},
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

		after_place_node = default.after_place_leaves,
	})

	default.register_leafdecay({
		trunks = {"ebiomes:quince_tree"},
		leaves = {"ebiomes:quince_leaves"},
		radius = 3,
	})

local function grow_new_quince_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-1, y = pos.y, z = pos.z-1}, modpath.."/schematics/ebiomes_quince_tree.mts", "0", nil, false)
end


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
			offset = 0.003,
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
		default.node_sound_wood_defaults(),
		true,
		S("Inner Quince Wood Stair"),
		S("Outer Quince Wood Stair")
	)

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
		material = "ebiomes:quince_wood",
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
			leafdecay = 3, leafdecay_drop = 1, food_apple = 1, eatable = 1},
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
		groups = {food_bread = 1, flammable = 2, eatable = 4},
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

		after_place_node = default.after_place_leaves,
	})

	default.register_leafdecay({
		trunks = {"ebiomes:chestnut_tree"},
		leaves = {"ebiomes:chestnut_leaves"},
		radius = 3,
	})


local function grow_new_chestnut_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-4, y = pos.y, z = pos.z-4}, modpath.."/schematics/ebiomes_chestnut_tree.mts", "0", nil, false)
end


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
			offset = 0.002,
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
		default.node_sound_wood_defaults(),
		true,
		S("Inner Chestnut Wood Stair"),
		S("Outer Chestnut Wood Stair")
	)

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
		material = "ebiomes:chestnut_wood",
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
		groups = {food_bread = 1, flammable = 2, eatable = 4},
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

		after_place_node = default.after_place_leaves,
	})

	default.register_leafdecay({
		trunks = {"ebiomes:hornbeam_tree"},
		leaves = {"ebiomes:hornbeam_leaves"},
		radius = 3,
	})


local function grow_new_hornbeam_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-3, y = pos.y, z = pos.z-3}, modpath.."/schematics/ebiomes_hornbeam_tree.mts", "0", nil, false)
end


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

if minetest.settings:get_bool("light_mapgen", true) then
	minetest.register_decoration({
		name = "ebiomes:hornbeam_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_warm"},
		sidelen = 16,
		noise_params = {
			offset = 0.02,
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
else
	minetest.register_decoration({
		name = "ebiomes:hornbeam_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_warm"},
		sidelen = 16,
		noise_params = {
			offset = 0.04,
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
end

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
		default.node_sound_wood_defaults(),
		true,
		S("Inner Hornbeam Wood Stair"),
		S("Outer Hornbeam Wood Stair")
	)

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
		material = "ebiomes:hornbeam_wood",
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

--Loot

if minetest.global_exists("dungeon_loot") then
	dungeon_loot.register ({
		{name = "ebiomes:chestnuts_peeled", chance = 0.3, count = {2, 8}},
		{name = "ebiomes:pear", chance = 0.4, count = {1, 4}},
		{name = "ebiomes:dried_quince_pieces", chance = 0.6, count = {1, 8}},
	})
end

--Bonemeal
if minetest.get_modpath("bonemeal") then
	bonemeal:add_deco({
		{"ebiomes:dirt_with_grass_warm", {"ebiomes:grass_warm_1", "ebiomes:grass_warm_2", "ebiomes:grass_warm_3", "ebiomes:grass_warm_4", "ebiomes:grass_warm_5"},
			{"flowers:dandelion_yellow", "flowers:dandelion_white", "flowers:tulip", "flowers:chrysanthemum_green", "ebiomes:larkspur"} }
	})
end

--Peripheral mod support

--sampled from cool_trees
-- stairsplus/moreblocks
if minetest.get_modpath("moreblocks") then

	stairsplus:register_all("pear_tree", "wood", "ebiomes:pear_wood", {
		description = "Pear Wood",
		tiles = {"ebiomes_pear_wood.png"},
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})

	stairsplus:register_all("quince_tree", "wood", "ebiomes:quince_wood", {
		description = "Quince Wood",
		tiles = {"ebiomes_quince_wood.png"},
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})

	stairsplus:register_all("chestnut_tree", "wood", "ebiomes:chestnut_wood", {
		description = "Chestnut Wood",
		tiles = {"ebiomes_chestnut_wood.png"},
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})

	stairsplus:register_all("hornbeam_tree", "wood", "ebiomes:hornbeam_wood", {
		description = "Hornbeam Wood",
		tiles = {"ebiomes_hornbeam_wood.png"},
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})

end

-- Support for flowerpot
if minetest.global_exists("flowerpot") then

	flowerpot.register_node("ebiomes:pear_sapling")
	flowerpot.register_node("ebiomes:quince_sapling")
	flowerpot.register_node("ebiomes:chestnut_sapling")
	flowerpot.register_node("ebiomes:hornbeam_sapling")

	flowerpot.register_node("ebiomes:larkspur")

end
