local S = minetest.get_translator("ebiomes")

--from runs cooltrees
local modname = "ebiomes"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")

if minetest.global_exists("dungeon_loot") then
	dungeon_loot.register ({
		{name = "ebiomes:peashrub_peas", chance = 0.3, count = {2, 4}},
		{name = "ebiomes:olives", chance = 0.5, count = {3, 8}},
		{name = "ebiomes:cowberries", chance = 0.2, count = {1, 4}},
		{name = "ebiomes:redcurrants", chance = 0.3, count = {1, 4}},
		{name = "ebiomes:blackcurrants", chance = 0.3, count = {1, 4}},
		{name = "ebiomes:gooseberries", chance = 0.3, count = {1, 4}},
		{name = "ebiomes:chestnuts_peeled", chance = 0.3, count = {2, 8}},
		{name = "ebiomes:cranberries", chance = 0.2, count = {1, 6}},
		{name = "ebiomes:pear", chance = 0.4, count = {1, 4}},
		{name = "ebiomes:dried_quince_pieces", chance = 0.6, count = {1, 8}},
	})	
end
