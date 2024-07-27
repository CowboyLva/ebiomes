-- Code borrowed from Ethereal by TenPlus1

local old_biomes = {}
local old_decor = {}


-- backup registered biome data
for key, def in pairs(minetest.registered_biomes) do
	old_biomes[key] = def
end

for key, def in pairs(minetest.registered_decorations) do
	old_decor[key] = def
end


-- clear current biome data
minetest.clear_registered_biomes()
minetest.clear_registered_decorations()
-- minetest.clear_registered_ores()


-- create list of default biomes to remove
local def_biomes = {
	["snowy_grassland"] = 1,
}


-- only re-register biomes that aren't on the list
for key, def in pairs(old_biomes) do

	if not def_biomes[key] then
		minetest.register_biome(def)
	end
end


-- loop through decorations
for key, def in pairs(old_decor) do

	local can_add = true
	local new_biomes = {}

	if type(def.biomes) == "table" then

		-- loop through decoration biomes, only re-add one's not on above list
		for num, bio in pairs(def.biomes) do

			if not def_biomes[bio] then
				table.insert(new_biomes, bio)
			end
		end

		-- if no biomes are left on new list, do not re-add decoration
		if #new_biomes == 0 then
			can_add = false
		end

	elseif type(def.biomes) == "string" then

		if def_biomes[def.biomes] then
			can_add = false
		else
			new_biomes = {def.biomes} -- convert to table
		end

	elseif not def.biomes then
		new_biomes = nil -- keep it nil for re-adding
	end

	if can_add == true then

		def.biomes = new_biomes

		minetest.register_decoration(def)
	end
end


--Snowy grassland new

	-- Pine bush

	-- Snowy grassland

	minetest.register_biome({
		name = "snowy_grassland",
		node_dust = "default:snow",
		node_top = "default:dirt_with_snow",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 1,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 31000,
		y_min = 4,
		heat_point = 20,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "snowy_grassland_ocean",
		node_dust = "default:snow",
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
		heat_point = 20,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "snowy_grassland_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = -400,
		heat_point = 20,
		humidity_point = 35,
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
		biomes = {"snowy_grassland"}
	})

    -- Pine bush

	minetest.register_decoration({
		name = "ebiomes:pine_bush_sg",
		deco_type = "schematic",
		place_on = {"default:dirt_with_snow"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 137,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"snowy_grassland"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("default") .. "/schematics/pine_bush.mts",
		flags = "place_center_x, place_center_z",
	})
