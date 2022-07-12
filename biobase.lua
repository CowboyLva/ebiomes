local S = minetest.get_translator("ebiomes")

--Global

	-- Blob ore.
	-- These before scatter ores to avoid other ores in blobs.

	-- Clay

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "default:clay",
		wherein         = {"default:dirt"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_max           = -1,
		y_min           = -3,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = -316,
			octaves = 1,
			persist = 0.0
		},
		biomes = {"deciduous_forest_cold", "deciduous_forest_cold_shore", "rainforest_humid", "rainforest_humid_swamp", "deciduous_forest_humid", "deciduous_forest_humid_shore", "deciduous_forest_warm", "deciduous_forest_warm_shore"}
	})

	-- Dirt

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "default:dirt",
		wherein         = {"default:stone"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_max           = 31000,
		y_min           = -31,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 17676,
			octaves = 1,
			persist = 0.0
		},
		-- Only where default:dirt is present as surface material
		biomes = {"deciduous_forest_cold", "meditarranean", "warm_steppe", "steppe", "cold_steppe", "deciduous_forest_humid", "deciduous_forest_humid_shore", "deciduous_forest_warm", "deciduous_forest_warm_shore"}
	})




--Global fixes

--Can't implement because mtg likes to place jungle trees on swamp if I remove either vanilla or modded biomes

--[[
minetest.unregister_biome("deciduous_forest")
minetest.unregister_biome("deciduous_forest_shore")

	minetest.register_biome({
		name = "deciduous_forest",
		node_top = "default:dirt_with_grass",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 31000,
		y_min = 6,
		heat_point = 60,
		humidity_point = 68,
	})

	minetest.register_biome({
		name = "deciduous_forest_dunes",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 5,
		y_min = 4,
		heat_point = 60,
		humidity_point = 68,
	})

	minetest.register_biome({
		name = "deciduous_forest_shore",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 4,
		y_min = -1,
		heat_point = 60,
		humidity_point = 68,
	})
--]]





--Cold deciduous
--Because of a bug described above settling with an intermediary beach lenght on y axis

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
		groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1, flammable = 1},
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
			not_in_creative_inventory = 1, grass = 1, flammable = 1},
			max_items = 1,
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
		y_min = -31000,
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
	
	
	
	
	
	
--Mediterranean

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
		groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1, flammable = 1},
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
		y_min = -31000,
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
	
	
--[[	
	
--Mediterranean grassland


	minetest.register_node("ebiomes:dirt_with_grass_med_dry", {
		description = S("Dirt with Dry Mediterranean Grass"),
		tiles = {"ebiomes_grass_med_dry.png", "default_dirt.png",
			{name = "default_dirt.png^ebiomes_grass_med_dry_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
		drop = "default:dirt",
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.25},
		}),
		soil = {
			base = "ebiomes:dirt_with_grass_med_dry",
			dry = "farming:soil",
			wet = "farming:soil_wet"
		}
	})

	minetest.register_node("ebiomes:dirt_with_grass_med_dry_footsteps", {
		description = S("Dirt with Dry Mediterranean Grass and Footsteps"),
		tiles = {"ebiomes_grass_med_dry.png^default_footprint.png", "default_dirt.png",
			{name = "default_dirt.png^ebiomes_grass_med_dry_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1, not_in_creative_inventory = 1},
		drop = "default:dirt",
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.25},
		}),
	})

	minetest.register_node("ebiomes:grass_med_dry_1", {
		description = S("Dry Mediterranean Grass"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"ebiomes_grass_med_dry_1.png"},
		-- Use texture of a taller grass stage in inventory
		inventory_image = "ebiomes_grass_med_dry_3.png",
		wield_image = "ebiomes_grass_med_dry_3.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1, flammable = 1},
		max_items = 1,
			items = {
				{items = {"farming:seed_wheat"}, rarity = 5},
				{items = {"ebiomes:grass_med_dry_1"}},
			},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
		},

		on_place = function(itemstack, placer, pointed_thing)
			-- place a random grass node
			local stack = ItemStack("ebiomes:grass_med_dry_" .. math.random(1,5))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("ebiomes:grass_med_dry_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})

for i = 2, 5 do
	minetest.register_node("ebiomes:grass_med_dry_" .. i, {
		description = S("Dry Mediterranean Grass"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"ebiomes_grass_med_dry_" .. i .. ".png"},
		inventory_image = "ebiomes_grass_med_dry_" .. i .. ".png",
		wield_image = "ebiomes_grass_med_dry_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		drop = "ebiomes:grass_med_dry_1",
		groups = {snappy = 3, flora = 1, attached_node = 1,
			not_in_creative_inventory = 1, grass = 1, flammable = 1},
		max_items = 1,
			items = {
				{items = {"farming:seed_wheat"}, rarity = 5},
				{items = {"ebiomes:grass_med_dry_1"}},
			},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},
	})
end





minetest.register_biome({
		name = "grassland_mediterranean",
		node_top = "ebiomes:dirt_with_grass_med_dry",
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
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "grassland_mediterranean_dunes",
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
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "grassland_mediterranean_ocean",
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
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "grassland_mediterranean_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = -31000,
		heat_point = 70,
		humidity_point = 35,
	})

for length = 1, 5 do
	minetest.register_decoration({
		name = "ebiomes:grass_med_dry_"..length,
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_med_dry"},
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
		decoration = "ebiomes:grass_med_dry_"..length,
	})
end	
--]]	

--Steppes


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
		groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1, flammable = 1},
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
			not_in_creative_inventory = 1, grass = 1, flammable = 1},
			max_items = 1,
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
		y_min = -31000,
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
		groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1, flammable = 1},
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
			not_in_creative_inventory = 1, grass = 1, flammable = 1},
			max_items = 1,
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
		y_min = -31000,
		heat_point = 35,
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
		groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1, flammable = 1},
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
		y_min = -31000,
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
		groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1, flammable = 1},
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
		y_max = 4,
		y_min = 1,
		heat_point = 53,
		humidity_point = 100,
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
		humidity_point = 100,
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
		humidity_point = 100,
	})

	minetest.register_biome({
		name = "swamp_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = -31000,
		heat_point = 53,
		humidity_point = 100,
	})
	
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
		("Swamp Water Bucket"),
		{tool = 1, water_bucket = 1},
		true
	)

--Fix oriented biomes

--Humid rainforest

	minetest.register_biome({
		name = "rainforest_humid",
		node_top = "default:dirt_with_rainforest_litter",
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
		heat_point = 86,
		humidity_point = 100,
	})

	minetest.register_biome({
		name = "rainforest_humid_swamp",
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
		heat_point = 86,
		humidity_point = 100,
	})

	minetest.register_biome({
		name = "rainforest_humid_ocean",
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
		heat_point = 86,
		humidity_point = 100,
	})

	minetest.register_biome({
		name = "rainforest_humid_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = -31000,
		heat_point = 86,
		humidity_point = 100,
	})
	
	
--Humid deciduous

	minetest.register_biome({
		name = "deciduous_forest_humid",
		node_top = "default:dirt_with_grass",
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
		heat_point = 60,
		humidity_point = 75,
	})

	minetest.register_biome({
		name = "deciduous_forest_humid_shore",
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
		heat_point = 60,
		humidity_point = 75,
	})

	minetest.register_biome({
		name = "deciduous_forest_humid_ocean",
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
		humidity_point = 75,
	})

	minetest.register_biome({
		name = "deciduous_forest_humid_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = -31000,
		heat_point = 60,
		humidity_point = 75,
	})
	


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
		groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1, flammable = 1},
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
			not_in_creative_inventory = 1, grass = 1, flammable = 1},
			max_items = 1,
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
		y_min = -31000,
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
		y_min = -31000,
		heat_point = 65,
		humidity_point = 35,
	})






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
		groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1, flammable = 1},
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
			not_in_creative_inventory = 1, grass = 1, flammable = 1},
			max_items = 1,
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
		y_min = -31000,
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
		groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1, flammable = 1},
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
			not_in_creative_inventory = 1, grass = 1, flammable = 1},
			max_items = 1,
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
		y_min = -31000,
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
			offset = 0.04,
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


-- Sandstone desert Buffer

	minetest.register_biome({
		name = "sandstone_desert_buffer",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 1,
		node_stone = "default:sandstone",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:sandstonebrick",
		node_dungeon_stair = "stairs:stair_sandstone_block",
		y_max = 31000,
		y_min = 4,
		heat_point = 60,
		humidity_point = 15,
	})

	minetest.register_biome({
		name = "sandstone_desert_ocean_buffer",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		node_stone = "default:sandstone",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_cave_liquid = "default:water_source",
		node_dungeon = "default:sandstonebrick",
		node_dungeon_stair = "stairs:stair_sandstone_block",
		y_max = 3,
		y_min = -255,
		heat_point = 60,
		humidity_point = 15,
	})

	minetest.register_biome({
		name = "sandstone_desert_under_buffer",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = -31000,
		heat_point = 60,
		humidity_point = 15,
	})

	-- Cold desert Buffer

	minetest.register_biome({
		name = "cold_desert_buffer",
		node_top = "default:silver_sand",
		depth_top = 1,
		node_filler = "default:silver_sand",
		depth_filler = 1,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 31000,
		y_min = 4,
		heat_point = 40,
		humidity_point = 15,
	})

	minetest.register_biome({
		name = "cold_desert_ocean_buffer",
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
		y_max = 3,
		y_min = -255,
		heat_point = 40,
		humidity_point = 15,
	})

	minetest.register_biome({
		name = "cold_desert_under_buffer",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = -31000,
		heat_point = 40,
		humidity_point = 15,
	})
	
