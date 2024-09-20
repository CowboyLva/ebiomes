local S = minetest.get_translator("ebiomes")

--from runs cooltrees
local modname = "ebiomes"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")

--Mediterranean

--Aliases

minetest.register_alias("dirt_with_med_grass", "ebiomes:dirt_with_grass_med")
minetest.register_alias("dirt_with_med_grass_footsteps", "ebiomes:dirt_with_grass_med_footsteps")

minetest.register_alias("warm_bush_stem", "ebiomes:bush_stem_warm")
minetest.register_alias("warm_bush_leaves", "ebiomes:bush_leaves_warm")
minetest.register_alias("warm_bush_sapling", "ebiomes:bush_sapling_warm")

minetest.register_alias("black_iris", "ebiomes:black_iris")
minetest.register_alias("cladanthus", "ebiomes:cladanthus")
minetest.register_alias("savory", "ebiomes:savory")
minetest.register_alias("staehelina", "ebiomes:staehelina")
minetest.register_alias("persian_buttercup", "ebiomes:buttercup_persian")
minetest.register_alias("yellow_chrysanthemum", "ebiomes:chrysanthemum_yellow")

minetest.register_alias("cypress_tree", "ebiomes:cypress_tree")
minetest.register_alias("cypress_wood", "ebiomes:cypress_wood")
minetest.register_alias("cypress_leaves", "ebiomes:cypress_leaves")
minetest.register_alias("cypress_sapling", "ebiomes:cypress_sapling")
minetest.register_alias("olive_tree", "ebiomes:olive_tree")
minetest.register_alias("olive_wood", "ebiomes:olive_wood")
minetest.register_alias("olive_leaves", "ebiomes:olive_leaves")
minetest.register_alias("olive_sapling", "ebiomes:olive_sapling")
minetest.register_alias("olives", "ebiomes:olives")

--Biome base

	minetest.register_node("ebiomes:dirt_with_grass_med", {
		description = S("Dirt with Mediterranean Grass"),
		tiles = {"ebiomes_grass_med.png", "default_dirt.png",
			{name = "default_dirt.png^ebiomes_grass_med_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
		drop = "default:dirt",
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.25},
		}),
		soil = {
			base = "ebiomes:dirt_with_grass_med",
			dry = "farming:soil",
			wet = "farming:soil_wet"
		}
	})

	minetest.register_node("ebiomes:dirt_with_grass_med_footsteps", {
		description = S("Dirt with Mediterranean Grass and Footsteps"),
		tiles = {"ebiomes_grass_med.png^default_footprint.png", "default_dirt.png",
			{name = "default_dirt.png^ebiomes_grass_med_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1, not_in_creative_inventory = 1},
		drop = "default:dirt",
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.25},
		}),
	})

	minetest.register_node("ebiomes:grass_med_1", {
		description = S("Mediterranean Grass"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"ebiomes_grass_med_1.png"},
		-- Use texture of a taller grass stage in inventory
		inventory_image = "ebiomes_grass_med_3.png",
		wield_image = "ebiomes_grass_med_3.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
			groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1,
		normal_grass = 1, flammable = 1},
		max_items = 1,
			items = {
				{items = {"farming:seed_wheat"}, rarity = 5},
				{items = {"ebiomes:grass_med_1"}},
			},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
		},

		on_place = function(itemstack, placer, pointed_thing)
			-- place a random grass node
			local stack = ItemStack("ebiomes:grass_med_" .. math.random(1,5))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("ebiomes:grass_med_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})

for i = 2, 5 do
	minetest.register_node("ebiomes:grass_med_" .. i, {
		description = S("Mediterranean Grass"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"ebiomes_grass_med_" .. i .. ".png"},
		inventory_image = "ebiomes_grass_med_" .. i .. ".png",
		wield_image = "ebiomes_grass_med_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		drop = "ebiomes:grass_med_1",
		groups = {snappy = 3, flora = 1, attached_node = 1,
			not_in_creative_inventory = 1, grass = 1, flammable = 1},
		max_items = 1,
			items = {
				{items = {"farming:seed_wheat"}, rarity = 5},
				{items = {"ebiomes:grass_med_1"}},
			},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},
	})
end

	minetest.register_biome({
		name = "mediterranean",
		node_top = "ebiomes:dirt_with_grass_med",
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
		heat_point = 70,
		humidity_point = 50,
	})

	minetest.register_biome({
		name = "mediterranean_dunes",
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
		heat_point = 70,
		humidity_point = 50,
	})

	minetest.register_biome({
		name = "mediterranean_ocean",
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
		heat_point = 70,
		humidity_point = 50,
	})

	minetest.register_biome({
		name = "mediterranean_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = -400,
		heat_point = 70,
		humidity_point = 50,
	})


for length = 1, 5 do
	minetest.register_decoration({
		name = "ebiomes:grass_med_"..length,
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_med"},
		sidelen = 16,
		noise_params = {
			offset = 0.032,
			scale = 0.008,
			spread = {x = 100, y = 100, z = 100},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:grass_med_"..length,
	})
end

	--ebiomes folliage

	--Mediterranean

	minetest.register_node("ebiomes:black_iris", {
		description = S("Black Iris"),
		tiles = {"ebiomes_black_iris.png"},
		inventory_image = "ebiomes_black_iris.png",
		wield_image = "ebiomes_black_iris.png",
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
		output = "dye:black 4",
		recipe = {
			{"ebiomes:black_iris"}
		},
	})

	minetest.register_decoration({
		name = "ebiomes:black_iris",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_med"},
		sidelen = 16,
		noise_params = {
			offset = 0.006,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 380,
			octaves = 3,
			persist = 0.05
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:black_iris",
	})




	minetest.register_node("ebiomes:cladanthus", {
		description = S("Cladanthus"),
		tiles = {"ebiomes_cladanthus.png"},
		inventory_image = "ebiomes_cladanthus.png",
		wield_image = "ebiomes_cladanthus.png",
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
		output = "dye:white 4",
		recipe = {
			{"ebiomes:cladanthus"}
		},
	})

	minetest.register_decoration({
		name = "ebiomes:cladanthus",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_med"},
		sidelen = 16,
		noise_params = {
			offset = 0.006,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 381,
			octaves = 3,
			persist = 0.05
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:cladanthus",
	})


	minetest.register_node("ebiomes:savory", {
		description = S("Savory"),
		tiles = {"ebiomes_savory.png"},
		inventory_image = "ebiomes_savory.png",
		wield_image = "ebiomes_savory.png",
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
		output = "dye:white 4",
		recipe = {
			{"ebiomes:savory"}
		},
	})

	minetest.register_decoration({
		name = "ebiomes:savory",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_med"},
		sidelen = 16,
		noise_params = {
			offset = 0.006,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 382,
			octaves = 3,
			persist = 0.05
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:savory",
	})


	minetest.register_node("ebiomes:staehelina", {
		description = S("Staehelina"),
		tiles = {"ebiomes_staehelina.png"},
		inventory_image = "ebiomes_staehelina.png",
		wield_image = "ebiomes_staehelina.png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {flower = 1, snappy = 3, attached_node = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, -4 / 16, 3 / 16},
		}
	})

    minetest.register_craft({
		output = "dye:magenta 4",
		recipe = {
			{"ebiomes:staehelina"}
		},
	})

	minetest.register_decoration({
		name = "ebiomes:staehelina",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_med"},
		sidelen = 16,
		noise_params = {
			offset = 0.006,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 383,
			octaves = 3,
			persist = 0.05
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:staehelina",
	})

		minetest.register_node("ebiomes:buttercup_persian", {
		description = S("Persian Buttercup"),
		tiles = {"ebiomes_buttercup_persian.png"},
		inventory_image = "ebiomes_buttercup_persian.png",
		wield_image = "ebiomes_buttercup_persian.png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {flower = 1, snappy = 3, attached_node = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, -2 / 16, 4 / 16},
		}
	})

    minetest.register_craft({
		output = "dye:orange 4",
		recipe = {
			{"ebiomes:buttercup_persian"}
		},
	})

	minetest.register_decoration({
		name = "ebiomes:buttercup_persian",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_med"},
		sidelen = 16,
		noise_params = {
			offset = 0.006,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 385,
			octaves = 3,
			persist = 0.05
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:buttercup_persian",
	})




	minetest.register_node("ebiomes:chrysanthemum_yellow", {
		description = S("Yellow Chrysanthemum"),
		tiles = {"ebiomes_chrysanthemum_yellow.png"},
		inventory_image = "ebiomes_chrysanthemum_yellow.png",
		wield_image = "ebiomes_chrysanthemum_yellow.png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {flower = 1, snappy = 3, attached_node = 1, flammable = 1, color_yellow = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, -1 / 16, 4 / 16},
		}
	})

    minetest.register_craft({
		output = "dye:yellow 4",
		recipe = {
			{"ebiomes:chrysanthemum_yellow"}
		},
	})

	minetest.register_decoration({
		name = "ebiomes:chrysanthemum_yellow",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_med"},
		sidelen = 16,
		noise_params = {
			offset = 0.006,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 386,
			octaves = 3,
			persist = 0.05
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:chrysanthemum_yellow",
	})

local function grow_new_bush_warm(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-1, y = pos.y-1, z = pos.z-1}, modpath.."/schematics/ebiomes_bush_warm.mts", "0", nil, false)
end

	minetest.register_node("ebiomes:bush_stem_warm", {
		description = S("Warm Biome Bush Stem"),
		drawtype = "plantlike",
		visual_scale = 1.41,
		tiles = {"ebiomes_bush_stem_warm.png"},
		inventory_image = "ebiomes_bush_stem_warm.png",
		wield_image = "ebiomes_bush_stem_warm.png",
		paramtype = "light",
		sunlight_propagates = true,
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
		sounds = default.node_sound_wood_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, 0.5, 7 / 16},
		},
	})

	minetest.register_node("ebiomes:bush_leaves_warm", {
		description = S("Warm Biome Bush Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_bush_leaves_warm.png"},
		paramtype = "light",
		groups = {snappy = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:bush_sapling_warm"}, rarity = 5},
				{items = {"ebiomes:bush_leaves_warm"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = default.after_place_leaves,
	})

	minetest.register_node("ebiomes:bush_sapling_warm", {
		description = S("Warm Biome Bush Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_bush_sapling_warm.png"},
		inventory_image = "ebiomes_bush_sapling_warm.png",
		wield_image = "ebiomes_bush_sapling_warm.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = default.grow_sapling,
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
				"ebiomes:bush_sapling_warm",
				-- minp, maxp to be checked, relative to sapling pos
				{x = -1, y = 0, z = -1},
				{x = 1, y = 1, z = 1},
				-- maximum interval of interior volume check
				2)

			return itemstack
		end,
	})


	default.register_leafdecay({
		trunks = {"ebiomes:bush_stem_warm"},
		leaves = {"ebiomes:bush_leaves_warm"},
		radius = 1,
	})

	minetest.register_decoration({
		name = "ebiomes:bush_warm",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_med"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 137,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"mediterranean"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_bush_warm.mts",
		flags = "place_center_x, place_center_z",
	})

if minetest.get_modpath("bonemeal") ~= nil then
	bonemeal:add_sapling({
		{"ebiomes:bush_sapling_warm", grow_new_bush_warm, "soil"},
	})
end

	minetest.register_craft({
		output = "default:wood",
		recipe = {
			{"ebiomes:bush_stem_warm"},
		}
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "ebiomes:bush_stem_warm",
		burntime = 8,
	})

	--Trees

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

		after_place_node = default.after_place_leaves,
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
		default.node_sound_wood_defaults(),
		true,
		S("Inner Cypress Wood Stair"),
		S("Outer Cypress Wood Stair")
	)

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
		material = "ebiomes:cypress_wood",
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

		after_place_node = default.after_place_leaves,
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
			leafdecay = 3, leafdecay_drop = 1, food_apple = 1, eatable = 2},
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
		default.node_sound_wood_defaults(),
		true,
		S("Inner Olive Wood Stair"),
		S("Outer Olive Wood Stair")
	)

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
		material = "ebiomes:olive_wood",
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

--Other file related objects
if minetest.settings:get_bool("reg_warms", true) then
	minetest.register_decoration({
		name = "ebiomes:larkspurmd",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_med"},
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
end

--Loot

if minetest.global_exists("dungeon_loot") then
	dungeon_loot.register ({
		{name = "ebiomes:olives", chance = 0.5, count = {3, 8}},
	})
end

--Bonemeal
if minetest.get_modpath("bonemeal") then
	if minetest.settings:get_bool("reg_warms", true) then
	bonemeal:add_deco({
		{"ebiomes:dirt_with_grass_med", {"ebiomes:grass_med_1", "ebiomes:grass_med_2", "ebiomes:grass_med_3", "ebiomes:grass_med_4", "ebiomes:grass_med_5"},
			{"ebiomes:black_iris", "ebiomes:cladanthus", "ebiomes:savory", "ebiomes:staehelina", "ebiomes:larkspur", "ebiomes:buttercup_persian", "ebiomes:chrysanthemum_yellow"} }
	})
	else
	bonemeal:add_deco({
		{"ebiomes:dirt_with_grass_med", {"ebiomes:grass_med_1", "ebiomes:grass_med_2", "ebiomes:grass_med_3", "ebiomes:grass_med_4", "ebiomes:grass_med_5"},
			{"ebiomes:black_iris", "ebiomes:cladanthus", "ebiomes:savory", "ebiomes:staehelina", "ebiomes:buttercup_persian", "ebiomes:chrysanthemum_yellow"} }
	})
	end
end





--Peripheral mod support

--Moreblocks

if minetest.get_modpath("moreblocks") then

	stairsplus:register_all("cypress_tree", "wood", "ebiomes:cypress_wood", {
		description = "Cypress Wood",
		tiles = {"ebiomes_cypress_wood.png"},
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})

	stairsplus:register_all("olive_tree", "wood", "ebiomes:olive_wood", {
		description = "Olive Wood",
		tiles = {"ebiomes_olive_wood.png"},
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})

end

-- Support for flowerpot
if minetest.global_exists("flowerpot") then

	flowerpot.register_node("ebiomes:cypress_sapling")
	flowerpot.register_node("ebiomes:olive_sapling")

	flowerpot.register_node("ebiomes:bush_sapling_warm")

	flowerpot.register_node("ebiomes:black_iris")
	flowerpot.register_node("ebiomes:savory")
	flowerpot.register_node("ebiomes:chrysanthemum_yellow")
	flowerpot.register_node("ebiomes:cladanthus")
	flowerpot.register_node("ebiomes:buttercup_persian")
	flowerpot.register_node("ebiomes:staehelina")

end
