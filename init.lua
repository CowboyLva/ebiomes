local path = minetest.get_modpath("ebiomes")

--quick access template
--[[
--from runs cooltrees
local modname = "ebiomes"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")
--]]

if minetest.settings:get_bool("rereg_mtg_decors", true) then
	dofile(path .. "/reregister.lua")
	dofile(path .. "/reregflowers.lua")
	dofile(path .. "/reregaux.lua")	
end

	dofile(path .. "/biobase.lua")
	dofile(path .. "/decors.lua")
	dofile(path .. "/woods.lua")
	dofile(path .. "/bugs.lua")
	dofile(path .. "/stuff.lua")
	dofile(path .. "/loot.lua")

if minetest.settings:get_bool("reg_hsavanna", true) then	
	dofile(path .. "/savanna.lua")
end

if minetest.settings:get_bool("reg_jprainforest", true) then
	dofile(path .. "/jprainforest.lua")
end
	
if minetest.settings:get_bool("reg_bamboo", true) then
	dofile(path .. "/bamboo.lua")
end

--took a good peek at pigiron mod
if minetest.get_modpath("bonemeal") then
	dofile(path .. "/bonemeal.lua")
end

	dofile(path .. "/mobs.lua")

if minetest.get_modpath("forgotten_monsters") then
	dofile(path .. "/forgotten_monsters.lua")
end

if minetest.settings:get_bool("supp_animalworld", true) then
	if minetest.get_modpath("animalworld") then
		dofile(path .. "/animalworld.lua")
	end
end
