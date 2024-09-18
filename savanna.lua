local S = minetest.get_translator("ebiomes")

--from runs cooltrees
local modname = "ebiomes"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")

-- Aliases

minetest.register_alias("dry_dirt_humid_savanna_grass", "ebiomes:dry_dirt_with_humid_savanna_grass")
minetest.register_alias("dry_dirt_humid_savanna_grass_footsteps", "ebiomes:dry_dirt_with_humid_savanna_grass_footsteps")
minetest.register_alias("afzelia_tree", "ebiomes:afzelia_tree")
minetest.register_alias("afzelia_wood", "ebiomes:afzelia_wood")
minetest.register_alias("afzelia_leaves", "ebiomes:afzelia_leaves")
minetest.register_alias("afzelia_sapling", "ebiomes:afzelia_sapling")
minetest.register_alias("limba_tree", "ebiomes:limba_tree")
minetest.register_alias("limba_wood", "ebiomes:limba_wood")
minetest.register_alias("limba_leaves", "ebiomes:limba_leaves")
minetest.register_alias("limba_sapling", "ebiomes:limba_sapling")
minetest.register_alias("siri_tree", "ebiomes:siri_tree")
minetest.register_alias("siri_wood", "ebiomes:siri_wood")
minetest.register_alias("siri_leaves", "ebiomes:siri_leaves")
minetest.register_alias("siri_sapling", "ebiomes:siri_sapling")
minetest.register_alias("tamarind_tree", "ebiomes:tamarind_tree")
minetest.register_alias("tamarind_wood", "ebiomes:tamarind_wood")
minetest.register_alias("tamarind_leaves", "ebiomes:tamarind_leaves")
minetest.register_alias("tamarind_sapling", "ebiomes:tamarind_sapling")
minetest.register_alias("tamarind_pods", "ebiomes:tamarind_pods")
minetest.register_alias("tamarind_pulp", "ebiomes:tamarind_pulp")


-- Humid Savanna

	minetest.register_node("ebiomes:dry_dirt_with_humid_savanna_grass", {
		description = S("Dry Dirt with Humid Savanna Grass"),
		tiles = {"ebiomes_humid_savanna_grass.png", "default_dry_dirt.png",
			{name = "default_dry_dirt.png^ebiomes_humid_savanna_grass_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
		drop = "default:dry_dirt",
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.25},
		}),
		soil = {
			base = "ebiomes:dry_dirt_with_humid_savanna_grass",
			dry = "farming:soil",
			wet = "farming:soil_wet"
		}
	})

	minetest.register_node("ebiomes:dry_dirt_with_humid_savanna_grass_footsteps", {
		description = S("Dry Dirt with Humid Savanna Grass and Footsteps"),
		tiles = {"ebiomes_humid_savanna_grass.png^default_footprint.png", "default_dry_dirt.png",
			{name = "default_dry_dirt.png^ebiomes_humid_savanna_grass_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1, not_in_creative_inventory = 1},
		drop = "default:dry_dirt",
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.25},
		}),
		soil = {
			base = "ebiomes:dry_dirt_with_humid_savanna_grass",
			dry = "farming:soil",
			wet = "farming:soil_wet"
		}
	})

	minetest.register_node("ebiomes:humid_savanna_grass_1", {
		description = S("Humid Savanna Grass"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"ebiomes_humid_savanna_grass_1.png"},
		-- Use texture of a taller grass stage in inventory
		inventory_image = "ebiomes_humid_savanna_grass_3.png",
		wield_image = "ebiomes_humid_savanna_grass_3.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1,
		normal_grass = 1, flammable = 1},
		max_items = 1,
			items = {
				{items = {"farming:seed_wheat"}, rarity = 5},
				{items = {"ebiomes:humid_savanna_grass_1"}},
			},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
		},

		on_place = function(itemstack, placer, pointed_thing)
			-- place a random grass node
			local stack = ItemStack("ebiomes:humid_savanna_grass_" .. math.random(1,5))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("ebiomes:humid_savanna_grass_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})

for i = 2, 5 do
	minetest.register_node("ebiomes:humid_savanna_grass_" .. i, {
		description = S("Humid Savanna Grass"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"ebiomes_humid_savanna_grass_" .. i .. ".png"},
		inventory_image = "ebiomes_humid_savanna_grass_" .. i .. ".png",
		wield_image = "ebiomes_humid_savanna_grass_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		drop = "ebiomes:humid_savanna_grass_1",
		groups = {snappy = 3, flora = 1, attached_node = 1,
			not_in_creative_inventory = 1, grass = 1,
			normal_grass = 1, flammable = 1},
		items = {
			{items = {"farming:seed_wheat"}, rarity = 5},
			{items = {"ebiomes:humid_savanna_grass_1"}},
		},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},
	})
end

	minetest.register_biome({
		name = "humid_savanna",
		node_top = "ebiomes:dry_dirt_with_humid_savanna_grass",
		depth_top = 1,
		node_filler = "default:dry_dirt",
		depth_filler = 2,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 31000,
		y_min = 1,
		heat_point = 89,
		humidity_point = 54,
	})

	minetest.register_biome({
		name = "humid_savanna_shore",
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
		heat_point = 89,
		humidity_point = 54,
	})

	minetest.register_biome({
		name = "humid_savanna_ocean",
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
		heat_point = 89,
		humidity_point = 54,
	})

	minetest.register_biome({
		name = "humid_savanna_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = -400,
		heat_point = 89,
		humidity_point = 54,
	})

for length = 1, 5 do
	minetest.register_decoration({
		name = "ebiomes:humid_savanna_grass_"..length,
		deco_type = "simple",
		place_on = {"ebiomes:dry_dirt_with_humid_savanna_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.08,
			scale = 0.02,
			spread = {x = 100, y = 100, z = 100},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:humid_savanna_grass_"..length,
	})
end


--Grasses


	minetest.register_node("ebiomes:jaragua_grass", {
		description = S("Jaragua Grass"),
		drawtype = "plantlike",
--		drawtype = "firelike",
		waving = 1,
		visual_scale = 1.4,
		tiles = {"ebiomes_jaragua_grass.png"},
		inventory_image = "ebiomes_jaragua_grass.png",
		wield_image = "ebiomes_jaragua_grass.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 4 / 16, 4 / 16},
		},
		groups = {snappy = 3, flammable = 2, grass = 1},
		sounds = default.node_sound_leaves_defaults(),
	})

	minetest.register_decoration({
		name = "ebiomes:jaragua_grass",
		deco_type = "simple",
		place_on = {"ebiomes:dry_dirt_with_humid_savanna_grass"},
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
		decoration = "ebiomes:jaragua_grass",
	})

--Decors

--Trees

--New trees


--Afzelia

	minetest.register_node("ebiomes:afzelia_tree", {
		description = S("Afzelia Tree"),
		tiles = {"ebiomes_afzelia_tree_top.png", "ebiomes_afzelia_tree_top.png",
			"ebiomes_afzelia_tree.png"},
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

	minetest.register_node("ebiomes:afzelia_wood", {
		description = S("Afzelia Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"ebiomes_afzelia_wood.png"},
		is_ground_content = false,
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
		sounds = default.node_sound_wood_defaults(),
	})

	minetest.register_craft({
		output = "ebiomes:afzelia_wood 4",
		recipe = {
			{"ebiomes:afzelia_tree"},
		}
	})

	minetest.register_node("ebiomes:afzelia_leaves", {
		description = S("Afzelia Tree Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_afzelia_leaves.png"},
		waving = 1,
		paramtype = "light",
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:afzelia_sapling"}, rarity = 20},
				{items = {"ebiomes:afzelia_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = default.after_place_leaves,
	})

	default.register_leafdecay({
		trunks = {"ebiomes:afzelia_tree"},
		leaves = {"ebiomes:afzelia_leaves"},
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

local function grow_new_afzelia_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-6, y = pos.y, z = pos.z-6}, modpath.."/schematics/ebiomes_afzelia_tree.mts", "0", nil, false)
end

--schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_afzelia_tree.mts"

	minetest.register_node("ebiomes:afzelia_sapling", {
		description = S("Afzelia Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_afzelia_sapling.png"},
		inventory_image = "ebiomes_afzelia_sapling.png",
		wield_image = "ebiomes_afzelia_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_afzelia_tree,
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
				"ebiomes:afzelia_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -6, y = 1, z = -6},
				{x = 6, y = 14, z = 6},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})

	minetest.register_decoration({
		name = "ebiomes:afzelia_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dry_dirt_with_humid_savanna_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.001,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 201,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"humid_savanna"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_afzelia_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		name = "ebiomes:afzelia_log",
		deco_type = "schematic",
		place_on = {"ebiomes:dry_dirt_with_humid_savanna_grass"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0001,
		biomes = {"humid_savanna"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_afzelia_log.mts",
		flags = "place_center_x",
		rotation = "random"
	})

if minetest.get_modpath("bonemeal") ~= nil then
bonemeal:add_sapling({
	{"ebiomes:afzelia_sapling", grow_new_afzelia_tree, "soil"},
})
end
--forms sampled from pigiron mod
	stairs.register_stair_and_slab("afzelia_wood", "ebiomes:afzelia_wood",
		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		{"ebiomes_afzelia_wood.png"},
		S("Afzelia Wood Stair"),
		S("Afzelia Wood Slab"),
		default.node_sound_wood_defaults(),
		true,
		S("Inner Afzelia Wood Stair"),
		S("Outer Afzelia Wood Stair")
	)

	default.register_fence("ebiomes:fence_afzelia_wood", {
		description = S("Afzelia Wood Fence"),
		texture = "ebiomes_fence_afzelia_wood.png",
		inventory_image = "default_fence_overlay.png^ebiomes_fence_afzelia_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^ebiomes_fence_afzelia_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:afzelia_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_fence_rail("ebiomes:fence_rail_afzelia_wood", {
		description = S("Afzelia Wood Fence Rail"),
		texture = "ebiomes_fence_rail_afzelia_wood.png",
		inventory_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_afzelia_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_afzelia_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:afzelia_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_mesepost("ebiomes:mese_post_light_afzelia_wood", {
		description = S("Afzelia Wood Mese Post Light"),
		texture = "ebiomes_fence_afzelia_wood.png",
		material = "ebiomes:afzelia_wood",
	})

	doors.register_fencegate("ebiomes:gate_afzelia_wood", {
		description = S("Afzelia Wood Fence Gate"),
		texture = "ebiomes_afzelia_wood.png",
		material = "ebiomes:afzelia_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3}
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "ebiomes:gate_afzelia_wood_closed",
		burntime = 9,
	})

--Extras

if minetest.get_modpath("moreblocks") then


	stairsplus:register_all("afzelia_tree", "wood", "ebiomes:afzelia_wood", {
		description = "Afzelia Wood",
		tiles = {"ebiomes_afzelia_wood.png"},
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})


end

-- Support for flowerpot
if minetest.global_exists("flowerpot") then

	flowerpot.register_node("ebiomes:afzelia_sapling")

end


--Limba

	minetest.register_node("ebiomes:limba_tree", {
		description = S("Limba Tree"),
		tiles = {"ebiomes_limba_tree_top.png", "ebiomes_limba_tree_top.png",
			"ebiomes_limba_tree.png"},
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

	minetest.register_node("ebiomes:limba_wood", {
		description = S("Limba Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"ebiomes_limba_wood.png"},
		is_ground_content = false,
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
		sounds = default.node_sound_wood_defaults(),
	})

	minetest.register_craft({
		output = "ebiomes:limba_wood 4",
		recipe = {
			{"ebiomes:limba_tree"},
		}
	})

	minetest.register_node("ebiomes:limba_leaves", {
		description = S("Limba Tree Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_limba_leaves.png"},
		waving = 1,
		paramtype = "light",
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:limba_sapling"}, rarity = 20},
				{items = {"ebiomes:limba_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = default.after_place_leaves,
	})

	default.register_leafdecay({
		trunks = {"ebiomes:limba_tree"},
		leaves = {"ebiomes:limba_leaves"},
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

local function grow_new_limba_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-4, y = pos.y, z = pos.z-4}, modpath.."/schematics/ebiomes_limba_tree.mts", "0", nil, false)
end

--schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_limba_tree.mts"

	minetest.register_node("ebiomes:limba_sapling", {
		description = S("Limba Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_limba_sapling.png"},
		inventory_image = "ebiomes_limba_sapling.png",
		wield_image = "ebiomes_limba_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_limba_tree,
		selection_box = {
			type = "fixed",
			fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, 3 / 16, 3 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 3,
			attached_node = 1, sapling = 1},
		sounds = default.node_sound_leaves_defaults(),

		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
				"ebiomes:limba_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 15, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})

	minetest.register_decoration({
		name = "ebiomes:limba_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dry_dirt_with_humid_savanna_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.002,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 202,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"humid_savanna"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_limba_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		name = "ebiomes:limba_log",
		deco_type = "schematic",
		place_on = {"ebiomes:dry_dirt_with_humid_savanna_grass"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0005,
		biomes = {"humid_savanna"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_limba_log.mts",
		flags = "place_center_x",
		rotation = "random"
	})

if minetest.get_modpath("bonemeal") ~= nil then
bonemeal:add_sapling({
	{"ebiomes:limba_sapling", grow_new_limba_tree, "soil"},
})
end
--forms sampled from pigiron mod
	stairs.register_stair_and_slab("limba_wood", "ebiomes:limba_wood",
		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		{"ebiomes_limba_wood.png"},
		S("Limba Wood Stair"),
		S("Limba Wood Slab"),
		default.node_sound_wood_defaults(),
		true,
		S("Inner Limba Wood Stair"),
		S("Outer Limba Wood Stair")
	)

	default.register_fence("ebiomes:fence_limba_wood", {
		description = S("Limba Wood Fence"),
		texture = "ebiomes_fence_limba_wood.png",
		inventory_image = "default_fence_overlay.png^ebiomes_fence_limba_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^ebiomes_fence_limba_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:limba_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_fence_rail("ebiomes:fence_rail_limba_wood", {
		description = S("Limba Wood Fence Rail"),
		texture = "ebiomes_fence_rail_limba_wood.png",
		inventory_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_limba_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_limba_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:limba_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_mesepost("ebiomes:mese_post_light_limba_wood", {
		description = S("Limba Wood Mese Post Light"),
		texture = "ebiomes_fence_limba_wood.png",
		material = "ebiomes:limba_wood",
	})

	doors.register_fencegate("ebiomes:gate_limba_wood", {
		description = S("Limba Wood Fence Gate"),
		texture = "ebiomes_limba_wood.png",
		material = "ebiomes:limba_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3}
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "ebiomes:gate_limba_wood_closed",
		burntime = 9,
	})

--Extras

if minetest.get_modpath("moreblocks") then


	stairsplus:register_all("limba_tree", "wood", "ebiomes:limba_wood", {
		description = "Limba Wood",
		tiles = {"ebiomes_limba_wood.png"},
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})


end

-- Support for flowerpot
if minetest.global_exists("flowerpot") then

	flowerpot.register_node("ebiomes:limba_sapling")

end

--Black Limba wood

	minetest.register_node("ebiomes:limba_black_wood", {
		description = S("Black Limba Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"ebiomes_limba_black_wood.png"},
		is_ground_content = false,
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
		sounds = default.node_sound_wood_defaults(),
	})
--have to do this because a singular item craft is supposed to craft sticks
	minetest.register_craft({
		output = "ebiomes:limba_black_wood 5",
		recipe = {
			{"ebiomes:limba_wood", "", "ebiomes:limba_wood"},
			{"", "ebiomes:limba_wood", ""},
			{"ebiomes:limba_wood", "", "ebiomes:limba_wood"},
		}
	})

	minetest.register_craft({
		output = "ebiomes:limba_wood 5",
		recipe = {
			{"ebiomes:limba_black_wood", "", "ebiomes:limba_black_wood"},
			{"", "ebiomes:limba_black_wood", ""},
			{"ebiomes:limba_black_wood", "", "ebiomes:limba_black_wood"},
		}
	})

--forms sampled from pigiron mod
	stairs.register_stair_and_slab("limba_black_wood", "ebiomes:limba_black_wood",
		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		{"ebiomes_limba_black_wood.png"},
		S("Black Limba Wood Stair"),
		S("Black Limba Wood Slab"),
		default.node_sound_wood_defaults(),
		true,
		S("Inner Black Limba Wood Stair"),
		S("Outer Black Limba Wood Stair")
	)

	default.register_fence("ebiomes:fence_limba_black_wood", {
		description = S("Black Limba Wood Fence"),
		texture = "ebiomes_fence_limba_black_wood.png",
		inventory_image = "default_fence_overlay.png^ebiomes_fence_limba_black_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^ebiomes_fence_limba_black_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:limba_black_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_fence_rail("ebiomes:fence_rail_limba_black_wood", {
		description = S("Black Limba Wood Fence Rail"),
		texture = "ebiomes_fence_rail_limba_black_wood.png",
		inventory_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_limba_black_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_limba_black_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:limba_black_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_mesepost("ebiomes:mese_post_light_limba_black_wood", {
		description = S("Black Limba Wood Mese Post Light"),
		texture = "ebiomes_fence_limba_black_wood.png",
		material = "ebiomes:limba_black_wood",
	})

	doors.register_fencegate("ebiomes:gate_limba_black_wood", {
		description = S("Black Limba Wood Fence Gate"),
		texture = "ebiomes_limba_black_wood.png",
		material = "ebiomes:limba_black_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3}
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "ebiomes:gate_limba_black_wood_closed",
		burntime = 9,
	})

--Extras

if minetest.get_modpath("moreblocks") then


	stairsplus:register_all("" , "wood", "ebiomes:limba_black_wood", {
		description = "Black Limba Wood",
		tiles = {"ebiomes_limba_black_wood.png"},
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})

end

--Siri

	minetest.register_node("ebiomes:siri_tree", {
		description = S("Siri Tree"),
		tiles = {"ebiomes_siri_tree_top.png", "ebiomes_siri_tree_top.png",
			"ebiomes_siri_tree.png"},
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

	minetest.register_node("ebiomes:siri_wood", {
		description = S("Siri Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"ebiomes_siri_wood.png"},
		is_ground_content = false,
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
		sounds = default.node_sound_wood_defaults(),
	})

	minetest.register_craft({
		output = "ebiomes:siri_wood 4",
		recipe = {
			{"ebiomes:siri_tree"},
		}
	})

	minetest.register_node("ebiomes:siri_leaves", {
		description = S("Siri Tree Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_siri_leaves.png"},
		waving = 1,
		paramtype = "light",
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:siri_sapling"}, rarity = 20},
				{items = {"ebiomes:siri_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = default.after_place_leaves,
	})

	default.register_leafdecay({
		trunks = {"ebiomes:siri_tree"},
		leaves = {"ebiomes:siri_leaves"},
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

local function grow_new_siri_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-3, y = pos.y, z = pos.z-2}, modpath.."/schematics/ebiomes_siri_tree.mts", "0", nil, false)
end

--schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_siri_tree.mts"

	minetest.register_node("ebiomes:siri_sapling", {
		description = S("Siri Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_siri_sapling.png"},
		inventory_image = "ebiomes_siri_sapling.png",
		wield_image = "ebiomes_siri_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_siri_tree,
		selection_box = {
			type = "fixed",
			fixed = {-2 / 16, -0.5, -2 / 16, 2 / 16, -3 / 16, 2 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 3,
			attached_node = 1, sapling = 1},
		sounds = default.node_sound_leaves_defaults(),

		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
				"ebiomes:siri_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -3, y = 1, z = -2},
				{x = 4, y = 9, z = 2},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})

	minetest.register_decoration({
		name = "ebiomes:siri_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dry_dirt_with_humid_savanna_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.003,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 203,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"humid_savanna"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_siri_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		name = "ebiomes:siri_log",
		deco_type = "schematic",
		place_on = {"ebiomes:dry_dirt_with_humid_savanna_grass"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0005,
		biomes = {"humid_savanna"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_siri_log.mts",
		flags = "place_center_x",
		rotation = "random"
	})

if minetest.get_modpath("bonemeal") ~= nil then
bonemeal:add_sapling({
	{"ebiomes:siri_sapling", grow_new_siri_tree, "soil"},
})
end
--forms sampled from pigiron mod
	stairs.register_stair_and_slab("siri_wood", "ebiomes:siri_wood",
		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		{"ebiomes_siri_wood.png"},
		S("Siri Wood Stair"),
		S("Siri Wood Slab"),
		default.node_sound_wood_defaults(),
		true,
		S("Inner Siri Wood Stair"),
		S("Outer Siri Wood Stair")
	)

	default.register_fence("ebiomes:fence_siri_wood", {
		description = S("Siri Wood Fence"),
		texture = "ebiomes_fence_siri_wood.png",
		inventory_image = "default_fence_overlay.png^ebiomes_fence_siri_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^ebiomes_fence_siri_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:siri_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_fence_rail("ebiomes:fence_rail_siri_wood", {
		description = S("Siri Wood Fence Rail"),
		texture = "ebiomes_fence_rail_siri_wood.png",
		inventory_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_siri_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_siri_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:siri_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_mesepost("ebiomes:mese_post_light_siri_wood", {
		description = S("Siri Wood Mese Post Light"),
		texture = "ebiomes_fence_siri_wood.png",
		material = "ebiomes:siri_wood",
	})

	doors.register_fencegate("ebiomes:gate_siri_wood", {
		description = S("Siri Wood Fence Gate"),
		texture = "ebiomes_siri_wood.png",
		material = "ebiomes:siri_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3}
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "ebiomes:gate_siri_wood_closed",
		burntime = 9,
	})

--Extras

if minetest.get_modpath("moreblocks") then


	stairsplus:register_all("siri_tree", "wood", "ebiomes:siri_wood", {
		description = "Siri Wood",
		tiles = {"ebiomes_siri_wood.png"},
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})


end

-- Support for flowerpot
if minetest.global_exists("flowerpot") then

	flowerpot.register_node("ebiomes:siri_sapling")

end




--Tamarind

	minetest.register_node("ebiomes:tamarind_tree", {
		description = S("Tamarind Tree"),
		tiles = {"ebiomes_tamarind_tree_top.png", "ebiomes_tamarind_tree_top.png",
			"ebiomes_tamarind_tree.png"},
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

	minetest.register_node("ebiomes:tamarind_wood", {
		description = S("Tamarind Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"ebiomes_tamarind_wood.png"},
		is_ground_content = false,
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
		sounds = default.node_sound_wood_defaults(),
	})

	minetest.register_craft({
		output = "ebiomes:tamarind_wood 4",
		recipe = {
			{"ebiomes:tamarind_tree"},
		}
	})

	minetest.register_node("ebiomes:tamarind_leaves", {
		description = S("Tamarind Tree Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_tamarind_leaves.png"},
		waving = 1,
		paramtype = "light",
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:tamarind_sapling"}, rarity = 20},
				{items = {"ebiomes:tamarind_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = default.after_place_leaves,
	})

	default.register_leafdecay({
		trunks = {"ebiomes:tamarind_tree"},
		leaves = {"ebiomes:tamarind_leaves"},
		radius = 3,
	})

	minetest.register_node("ebiomes:tamarind_pods_hanging", {
		description = S("Hanging Tamarind Pods"),
		drawtype = "plantlike",
		tiles = {"ebiomes_tamarind_pods_hanging.png"},
		inventory_image = "ebiomes_tamarind_pods_hanging.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		is_ground_content = false,
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, 3 / 16, -6 / 16, 6 / 16, 0.5, 6 / 16}
		},
		groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
			leafdecay = 3, leafdecay_drop = 1, food_apple = 1},
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:tamarind_pods"}},
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack)
			minetest.set_node(pos, {name = "ebiomes:tamarind_pods_hanging", param2 = 1})
		end,

		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			if oldnode.param2 == 0 then
				minetest.set_node(pos, {name = "ebiomes:tamarind_pods_mark"})
				minetest.get_node_timer(pos):start(math.random(300, 1500))
			end
		end,
	})

	minetest.register_node("ebiomes:tamarind_pods_hanging_mark", {
		description = S("Hanging Tamarind Pod Marker"),
		inventory_image = "ebiomes_tamarind_pods.png^default_invisible_node_overlay.png",
		wield_image = "ebiomes_tamarind_pods.png^default_invisible_node_overlay.png",
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
				minetest.set_node(pos, {name = "ebiomes:tamarind_pods"})
			end
		end
	})

	minetest.register_craftitem("ebiomes:tamarind_pods", {
		description = S("Tamarind Pods"),
		inventory_image = "ebiomes_tamarind_pods.png",
		groups = {legumes = 1},
	})

	minetest.register_craft({
		output = "ebiomes:tamarind_pulp 2",
		recipe = {
			{"ebiomes:tamarind_pods"},
		}
	})

	minetest.register_craftitem("ebiomes:tamarind_pulp", {
		description = S("Tamarind Pulp"),
		inventory_image = "ebiomes_tamarind_pulp.png",
		groups = {food_pulps = 1, eatable = 3},
		on_use = minetest.item_eat(3),
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

local function grow_new_tamarind_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-2, y = pos.y, z = pos.z-2}, modpath.."/schematics/ebiomes_tamarind_tree.mts", "0", nil, false)
end

--schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_tamarind_tree.mts"

	minetest.register_node("ebiomes:tamarind_sapling", {
		description = S("Tamarind Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_tamarind_sapling.png"},
		inventory_image = "ebiomes_tamarind_sapling.png",
		wield_image = "ebiomes_tamarind_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_tamarind_tree,
		selection_box = {
			type = "fixed",
			fixed = {-2 / 16, -0.5, -2 / 16, 2 / 16, -2 / 16, 2 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 3,
			attached_node = 1, sapling = 1},
		sounds = default.node_sound_leaves_defaults(),

		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
				"ebiomes:tamarind_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -2, y = 1, z = -2},
				{x = 2, y = 8, z = 2},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})

	minetest.register_decoration({
		name = "ebiomes:tamarind_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dry_dirt_with_humid_savanna_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.002,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 204,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"humid_savanna"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_tamarind_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		name = "ebiomes:tamarind_log",
		deco_type = "schematic",
		place_on = {"ebiomes:dry_dirt_with_humid_savanna_grass"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0005,
		biomes = {"humid_savanna"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_tamarind_log.mts",
		flags = "place_center_x",
		rotation = "random"
	})

if minetest.get_modpath("bonemeal") ~= nil then
	bonemeal:add_sapling({
		{"ebiomes:tamarind_sapling", grow_new_tamarind_tree, "soil"},
	})
end
--forms sampled from pigiron mod
	stairs.register_stair_and_slab("tamarind_wood", "ebiomes:tamarind_wood",
		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		{"ebiomes_tamarind_wood.png"},
		S("Tamarind Wood Stair"),
		S("Tamarind Wood Slab"),
		default.node_sound_wood_defaults(),
		true,
		S("Inner Tamarind Wood Stair"),
		S("Outer Tamarind Wood Stair")
	)

	default.register_fence("ebiomes:fence_tamarind_wood", {
		description = S("Tamarind Wood Fence"),
		texture = "ebiomes_fence_tamarind_wood.png",
		inventory_image = "default_fence_overlay.png^ebiomes_fence_tamarind_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^ebiomes_fence_tamarind_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:tamarind_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_fence_rail("ebiomes:fence_rail_tamarind_wood", {
		description = S("Tamarind Wood Fence Rail"),
		texture = "ebiomes_fence_rail_tamarind_wood.png",
		inventory_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_tamarind_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_tamarind_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:tamarind_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_mesepost("ebiomes:mese_post_light_tamarind_wood", {
		description = S("Tamarind Wood Mese Post Light"),
		texture = "ebiomes_fence_tamarind_wood.png",
		material = "ebiomes:tamarind_wood",
	})

	doors.register_fencegate("ebiomes:gate_tamarind_wood", {
		description = S("Tamarind Wood Fence Gate"),
		texture = "ebiomes_tamarind_wood.png",
		material = "ebiomes:tamarind_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3}
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "ebiomes:gate_tamarind_wood_closed",
		burntime = 9,
	})

--Extras

if minetest.global_exists("dungeon_loot") then
	dungeon_loot.register ({
		{name = "ebiomes:tamarind_pulp", chance = 0.3, count = {4, 12}},
	})
end

if minetest.get_modpath("moreblocks") then


	stairsplus:register_all("tamarind_tree", "wood", "ebiomes:tamarind_wood", {
		description = "Tamarind Wood",
		tiles = {"ebiomes_tamarind_wood.png"},
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})


end

-- Support for flowerpot
if minetest.global_exists("flowerpot") then

	flowerpot.register_node("ebiomes:tamarind_sapling")

end

--Additionals

--Ground stuff
if minetest.get_modpath("bonemeal") ~= nil then
	bonemeal:add_deco({
		{"ebiomes:dry_dirt_with_humid_savanna_grass", {"ebiomes:humid_savanna_grass_1", "ebiomes:humid_savanna_grass_2", "ebiomes:humid_savanna_grass_3", "ebiomes:humid_savanna_grass_4", "ebiomes:humid_savanna_grass_5"},
			{"ebiomes:jaragua_grass"} }
	})

end
