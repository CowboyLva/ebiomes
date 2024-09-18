local S = minetest.get_translator("ebiomes")

--from runs cooltrees
local modname = "ebiomes"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")

-- Aliases

minetest.register_alias("cowberry_bush_leaves", "ebiomes:cowberry_bush_leaves")
minetest.register_alias("cowberry_bush_leaves", "ebiomes:cowberry_bush_leaves_with_berries")
minetest.register_alias("cowberry_bush_sapling", "ebiomes:cowberry_bush_sapling")
minetest.register_alias("cowberries", "ebiomes:cowberries")

-- Cowberry

local function grow_new_cowberry(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x, y = pos.y, z = pos.z}, modpath.."/schematics/ebiomes_cowberry_bush.mts", "0", nil, false)
end

	minetest.register_craftitem("ebiomes:cowberries", {
		description = S("Cowberries"),
		inventory_image = "ebiomes_cowberries.png",
		groups = {food_cowberries = 1, food_berry = 1, eatable = 2},
		on_use = minetest.item_eat(2),
	})


	minetest.register_node("ebiomes:cowberry_bush_leaves_with_berries", {
		description = S("Cowberry Bush Leaves with Berries"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_cowberry_bush_leaves.png^ebiomes_cowberry_overlay.png"},
		paramtype = "light",
		groups = {snappy = 3, flammable = 2, leaves = 1, dig_immediate = 3},
		walkable = false,
		drop = "ebiomes:cowberries",
		sounds = default.node_sound_leaves_defaults(),
		node_dig_prediction = "ebiomes:cowberry_bush_leaves",

		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			minetest.set_node(pos, {name = "ebiomes:cowberry_bush_leaves"})
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,
	})


	minetest.register_node("ebiomes:cowberry_bush_leaves", {
		description = S("Cowberry Bush Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_cowberry_bush_leaves.png"},
		paramtype = "light",
		groups = {snappy = 3, flammable = 2, leaves = 1},
		walkable = false,
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:cowberry_bush_sapling"}, rarity = 5},
				{items = {"ebiomes:cowberry_bush_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		on_timer = function(pos, elapsed)
			if minetest.get_node_light(pos) < 11 then
				minetest.get_node_timer(pos):start(200)
			else
				minetest.set_node(pos, {name = "ebiomes:cowberry_bush_leaves_with_berries"})
			end
		end,

		after_place_node = default.after_place_leaves,
	})


	minetest.register_node("ebiomes:cowberry_bush_sapling", {
		description = S("Cowberry Bush Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_cowberry_bush_sapling.png"},
		inventory_image = "ebiomes_cowberry_bush_sapling.png",
		wield_image = "ebiomes_cowberry_bush_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_cowberry,
		selection_box = {
			type = "fixed",
			fixed = {-2 / 16, -0.5, -2 / 16, 2 / 16, -1 / 16, 2 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2,
			attached_node = 1, sapling = 1},
		sounds = default.node_sound_leaves_defaults(),

		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
				"ebiomes:cowberry_bush_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				{x = -1, y = 0, z = -1},
				{x = 1, y = 1, z = 1},
				-- maximum interval of interior volume check
				2)

			return itemstack
		end,
	})

	minetest.register_decoration({
		name = "ebiomes:cowberry_bush",
		deco_type = "schematic",
		place_on = {"default:dirt_with_snow", "default:permafrost_with_moss"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 697,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"taiga", "snowy_grassland", "tundra"},
		y_max = 31000,
		y_min = 1,
		place_offset_y = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_cowberry_bush.mts",
		flags = "place_center_x, place_center_z",
	})

if minetest.get_modpath("bonemeal") ~= nil then
	bonemeal:add_sapling({
		{"ebiomes:cowberry_bush_sapling", grow_new_cowberry, "soil"},
	})
end

if minetest.global_exists("flowerpot") then
	flowerpot.register_node("ebiomes:cowberry_bush_sapling")
end
