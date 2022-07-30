local path = minetest.get_modpath("ebiomes")

--translation code from flowerpot

--from runs cooltrees
--[[
local modname = "ebiomes"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")
--]]


	dofile(path .. "/reregister.lua")
	dofile(path .. "/reregflowers.lua")
	dofile(path .. "/reregaux.lua")
	dofile(path .. "/biobase.lua")
	dofile(path .. "/decors.lua")
	dofile(path .. "/woods.lua")
	dofile(path .. "/bugs.lua")
	dofile(path .. "/stuff.lua")
	dofile(path .. "/loot.lua")

--took a good peek at pigiron mod
if minetest.get_modpath("bonemeal") then
	dofile(path .. "/bonemeal.lua")
end

	dofile(path .. "/mobs.lua")

if minetest.get_modpath("forgotten_monsters") then
	dofile(path .. "/forgotten_monsters.lua")
end

