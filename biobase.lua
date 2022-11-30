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
		biomes = {"deciduous_forest_cold", "deciduous_forest_cold_shore", "deciduous_forest_warm", "deciduous_forest_warm_shore"}
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
		biomes = {"deciduous_forest_cold", "meditarranean", "warm_steppe", "steppe", "cold_steppe", "deciduous_forest_warm", "deciduous_forest_warm_shore"}
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
		y_min = -31000,
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
		("Swamp Water Bucket"),
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
		default.node_sound_dirt_defaults())

	
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
		groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1, flammable = 1},
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
	
