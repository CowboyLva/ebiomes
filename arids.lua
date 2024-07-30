local S = minetest.get_translator("ebiomes")

--from runs cooltrees
local modname = "ebiomes"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")

-- Aliases

minetest.register_alias("dry_dirt_with_grass", "ebiomes:dry_dirt_with_grass_arid")
minetest.register_alias("dry_dirt_with_grass_footsteps", "ebiomes:dry_dirt_with_grass_arid_footsteps")
minetest.register_alias("cool_dry_dirt_with_grass", "ebiomes:dry_dirt_with_grass_arid_cool")
minetest.register_alias("cool_dry_dirt_with_grass_footsteps", "ebiomes:dry_dirt_with_grass_arid_cool_footsteps")

minetest.register_alias("hardy_bush_stem", "ebiomes:hardy_bush_stem")
minetest.register_alias("hardy_bush_leaves", "ebiomes:hardy_bush_leaves")
minetest.register_alias("hardy_bush_sapling", "ebiomes:hardy_bush_sapling")
minetest.register_alias("thorn_bush_leaves", "ebiomes:thorn_bush_leaves")
minetest.register_alias("thorn_bush_sapling", "ebiomes:thorn_bush_sapling")


-- Biome bases

-- Arid grassland

	minetest.register_node("ebiomes:dry_dirt_with_grass_arid", {
		description = S("Dry Dirt with Arid Grass"),
		tiles = {"ebiomes_grass_arid.png", "default_dry_dirt.png",
			{name = "default_dry_dirt.png^ebiomes_grass_arid_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
		drop = "default:dry_dirt",
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.25},
		}),
	})

	minetest.register_node("ebiomes:dry_dirt_with_grass_arid_footsteps", {
		description = S("Dry Dirt with Arid Grass and Footsteps"),
		tiles = {"ebiomes_grass_arid.png^default_footprint.png", "default_dry_dirt.png",
			{name = "default_dry_dirt.png^ebiomes_grass_arid_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1, not_in_creative_inventory = 1},
		drop = "default:dry_dirt",
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.25},
		}),
	})

	minetest.register_node("ebiomes:grass_arid_1", {
		description = S("Arid Grass"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"ebiomes_grass_arid_1.png"},
		-- Use texture of a taller grass stage in inventory
		inventory_image = "ebiomes_grass_arid_3.png",
		wield_image = "ebiomes_grass_arid_3.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
			groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1,
		normal_grass = 1, flammable = 1},
		max_items = 1,
			items = {
				{items = {"farming:seed_wheat"}, rarity = 5},
				{items = {"ebiomes:grass_arid_1"}},
			},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
		},

		on_place = function(itemstack, placer, pointed_thing)
			-- place a random grass node
			local stack = ItemStack("ebiomes:grass_arid_" .. math.random(1,5))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("ebiomes:grass_arid_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})

for i = 2, 5 do
	minetest.register_node("ebiomes:grass_arid_" .. i, {
		description = S("Arid Grass"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"ebiomes_grass_arid_" .. i .. ".png"},
		inventory_image = "ebiomes_grass_arid_" .. i .. ".png",
		wield_image = "ebiomes_grass_arid_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		drop = "ebiomes:grass_arid_1",
		groups = {snappy = 3, flora = 1, attached_node = 1,
			not_in_creative_inventory = 1, grass = 1,
			normal_grass = 1, flammable = 1},
		items = {
			{items = {"farming:seed_wheat"}, rarity = 5},
			{items = {"ebiomes:grass_arid_1"}},
		},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},
	})
end

	minetest.register_biome({
		name = "grassland_arid",
		node_top = "ebiomes:dry_dirt_with_grass_arid",
		depth_top = 1,
		node_filler = "default:dry_dirt",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 31000,
		y_min = 6,
		heat_point = 60,
		humidity_point = 20,
	})

	minetest.register_biome({
		name = "grassland_arid_shore",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 5,
		y_min = -1,
		heat_point = 60,
		humidity_point = 20,
	})

	minetest.register_biome({
		name = "grassland_arid_ocean",
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
		humidity_point = 20,
	})

	minetest.register_biome({
		name = "grassland_arid_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = -400,
		heat_point = 60,
		humidity_point = 20,
	})

for length = 1, 5 do
	minetest.register_decoration({
		name = "ebiomes:grass_arid_"..length,
		deco_type = "simple",
		place_on = {"ebiomes:dry_dirt_with_grass_arid"},
		sidelen = 16,
		noise_params = {
			offset = 0.04,
			scale = 0.02,
			spread = {x = 100, y = 100, z = 100},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:grass_arid_"..length,
	})
end

-- Arid grassland Cool

	minetest.register_node("ebiomes:dry_dirt_with_grass_arid_cool", {
		description = S("Dry Dirt with Cool Arid Grass"),
		tiles = {"ebiomes_grass_arid_cool.png", "default_dry_dirt.png",
			{name = "default_dry_dirt.png^ebiomes_grass_arid_cool_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
		drop = "default:dry_dirt",
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.25},
		}),
	})

	minetest.register_node("ebiomes:dry_dirt_with_grass_arid_cool_footsteps", {
		description = S("Dry Dirt with Cool Arid Grass and Footsteps"),
		tiles = {"ebiomes_grass_arid_cool.png^default_footprint.png", "default_dry_dirt.png",
			{name = "default_dry_dirt.png^ebiomes_grass_arid_cool_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1, not_in_creative_inventory = 1},
		drop = "default:dry_dirt",
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.25},
		}),
	})

	minetest.register_node("ebiomes:grass_arid_cool_1", {
		description = S("Cool Arid Grass"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"ebiomes_grass_arid_cool_1.png"},
		-- Use texture of a taller grass stage in inventory
		inventory_image = "ebiomes_grass_arid_cool_3.png",
		wield_image = "ebiomes_grass_arid_cool_3.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
			groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1,
		normal_grass = 1, flammable = 1},
		max_items = 1,
			items = {
				{items = {"farming:seed_wheat"}, rarity = 5},
				{items = {"ebiomes:grass_arid_cool_1"}},
			},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
		},

		on_place = function(itemstack, placer, pointed_thing)
			-- place a random grass node
			local stack = ItemStack("ebiomes:grass_arid_cool_" .. math.random(1,5))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("ebiomes:grass_arid_cool_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})

for i = 2, 5 do
	minetest.register_node("ebiomes:grass_arid_cool_" .. i, {
		description = S("Cool Arid Grass"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"ebiomes_grass_arid_cool_" .. i .. ".png"},
		inventory_image = "ebiomes_grass_arid_cool_" .. i .. ".png",
		wield_image = "ebiomes_grass_arid_cool_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		drop = "ebiomes:grass_arid_cool_1",
		groups = {snappy = 3, flora = 1, attached_node = 1,
			not_in_creative_inventory = 1, grass = 1,
			normal_grass = 1, flammable = 1},
		items = {
			{items = {"farming:seed_wheat"}, rarity = 5},
			{items = {"ebiomes:grass_arid_cool_1"}},
		},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},
	})
end

	minetest.register_biome({
		name = "grassland_arid_cool",
		node_top = "ebiomes:dry_dirt_with_grass_arid_cool",
		depth_top = 1,
		node_filler = "default:dry_dirt",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 31000,
		y_min = 6,
		heat_point = 40,
		humidity_point = 20,
	})

	minetest.register_biome({
		name = "grassland_arid_cool_shore",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 5,
		y_min = -1,
		heat_point = 40,
		humidity_point = 20,
	})

	minetest.register_biome({
		name = "grassland_arid_cool_ocean",
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
		heat_point = 40,
		humidity_point = 20,
	})

	minetest.register_biome({
		name = "grassland_arid_cool_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = -400,
		heat_point = 40,
		humidity_point = 20,
	})

for length = 1, 5 do
	minetest.register_decoration({
		name = "ebiomes:grass_arid_cool_"..length,
		deco_type = "simple",
		place_on = {"ebiomes:dry_dirt_with_grass_arid_cool"},
		sidelen = 16,
		noise_params = {
			offset = 0.07,
			scale = 0.02,
			spread = {x = 100, y = 100, z = 100},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:grass_arid_cool_"..length,
	})
end

--Folliage

--Biome specific

--Hardy bush

local function grow_new_hardy_bush(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-1, y = pos.y-1, z = pos.z-1}, modpath.."/schematics/ebiomes_hardy_bush.mts", "0", nil, false)
end

	minetest.register_node("ebiomes:hardy_bush_stem", {
		description = S("Hardy Bush Stem"),
		drawtype = "plantlike",
		visual_scale = 1.41,
		tiles = {"ebiomes_hardy_bush_stem.png"},
		inventory_image = "ebiomes_hardy_bush_stem.png",
		wield_image = "ebiomes_hardy_bush_stem.png",
		paramtype = "light",
		sunlight_propagates = true,
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 1},
		sounds = default.node_sound_wood_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, 0.5, 7 / 16},
		},
	})

	minetest.register_node("ebiomes:hardy_bush_leaves", {
		description = S("Hardy Bush Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_hardy_bush_leaves.png"},
		paramtype = "light",
		groups = {snappy = 3, flammable = 1, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:hardy_bush_sapling"}, rarity = 5},
				{items = {"ebiomes:hardy_bush_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = default.after_place_leaves,
	})

	minetest.register_node("ebiomes:hardy_bush_sapling", {
		description = S("Hardy Bush Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_hardy_bush_sapling.png"},
		inventory_image = "ebiomes_hardy_bush_sapling.png",
		wield_image = "ebiomes_hardy_bush_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = default.grow_sapling,
		selection_box = {
			type = "fixed",
			fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, -2 / 16, 3 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2,
			attached_node = 1, sapling = 1},
		sounds = default.node_sound_leaves_defaults(),

		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
				"ebiomes:hardy_bush_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				{x = -1, y = 0, z = -1},
				{x = 1, y = 1, z = 1},
				-- maximum interval of interior volume check
				2)

			return itemstack
		end,
	})


	default.register_leafdecay({
		trunks = {"ebiomes:hardy_bush_stem"},
		leaves = {"ebiomes:hardy_bush_leaves"},
		radius = 1,
	})

	minetest.register_decoration({
		name = "ebiomes:hardy_bush",
		deco_type = "schematic",
		place_on = {"ebiomes:dry_dirt_with_grass_arid", "ebiomes:dry_dirt_with_grass_arid_cool"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 137,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"grassland_arid", "grassland_arid_cool"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_hardy_bush.mts",
		flags = "place_center_x, place_center_z",
	})

if minetest.get_modpath("bonemeal") ~= nil then
	bonemeal:add_sapling({
		{"ebiomes:hardy_bush_sapling", grow_new_hardy_bush, "soil"},
	})
end

	minetest.register_craft({
		output = "default:wood",
		recipe = {
			{"ebiomes:hardy_bush_stem"},
		}
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "ebiomes:hardy_bush_stem",
		burntime = 8,
	})


--Thorn bush

local function grow_new_thorn_bush(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-1, y = pos.y, z = pos.z-1}, modpath.."/schematics/ebiomes_thorn_bush.mts", "0", nil, false)
end

	minetest.register_node("ebiomes:thorn_bush_leaves", {
		description = S("Thorn Bush Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_thorn_bush_leaves.png"},
		paramtype = "light",
		groups = {snappy = 1, flammable = 1, leaves = 1},
		walkable = false,
		damage_per_second = 2,
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:thorn_bush_sapling"}, rarity = 5},
				{items = {"ebiomes:thorn_bush_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = default.after_place_leaves,
	})

	minetest.register_node("ebiomes:thorn_bush_sapling", {
		description = S("Thorn Bush Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_thorn_bush_sapling.png"},
		inventory_image = "ebiomes_thorn_bush_sapling.png",
		wield_image = "ebiomes_thorn_bush_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_thorn_bush,
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
				"ebiomes:thorn_bush_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				{x = -1, y = 0, z = -1},
				{x = 1, y = 1, z = 1},
				-- maximum interval of interior volume check
				2)

			return itemstack
		end,
	})

	minetest.register_decoration({
		name = "ebiomes:thorn_bush",
		deco_type = "schematic",
		place_on = {"ebiomes:dry_dirt_with_grass_arid", "ebiomes:dry_dirt_with_grass_arid_cool"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 969,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"grassland_arid", "grassland_arid_cool"},
		y_max = 31000,
		y_min = 1,
		place_offset_y = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_thorn_bush.mts",
		flags = "place_center_x, place_center_z",
	})

if minetest.get_modpath("bonemeal") ~= nil then
bonemeal:add_sapling({
	{"ebiomes:thorn_bush_sapling", grow_new_thorn_bush, "soil"},
})
end

--Bonemeal
if minetest.get_modpath("bonemeal") then
	bonemeal:add_deco({
		{"ebiomes:dry_dirt_with_grass_arid", {"ebiomes:grass_arid_1", "ebiomes:grass_arid_2", "ebiomes:grass_arid_3", "ebiomes:grass_arid_4", "ebiomes:grass_arid_5"},
			{"default:dry_shrub"} }
	})

	bonemeal:add_deco({
		{"ebiomes:dry_dirt_with_grass_arid_cool", {"ebiomes:grass_arid_cool_1", "ebiomes:grass_arid_cool_2", "ebiomes:grass_arid_cool_3", "ebiomes:grass_arid_cool_4", "ebiomes:grass_arid_cool_5"},
			{"default:dry_shrub"} }
	})
end


-- Peripheral mod support

-- Support for flowerpot
if minetest.global_exists("flowerpot") then
	flowerpot.register_node("ebiomes:hardy_bush_sapling")
	flowerpot.register_node("ebiomes:thorn_bush_sapling")
end
