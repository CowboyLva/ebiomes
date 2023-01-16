local path = minetest.get_modpath("ebiomes")

--quick access template
--[[
--from runs cooltrees
local modname = "ebiomes"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")
--]]

-- Base

if minetest.settings:get_bool("reg_cowberries", true) then
	dofile(path .. "/cowberries.lua")
	if minetest.settings:get_bool("rereg_mtg_decors", true) then
		dofile(path .. "/rereg.lua")
	end
end

if minetest.settings:get_bool("reg_arids", true) then
	dofile(path .. "/arids.lua")
end

if minetest.settings:get_bool("reg_buffers", true) then	
	dofile(path .. "/buffers.lua")
end

if minetest.settings:get_bool("reg_cswamps", true) then	
	dofile(path .. "/coldnswamps.lua")
end

if minetest.settings:get_bool("reg_mediterranean", true) then	
	dofile(path .. "/mediterranean.lua")
end	

if minetest.settings:get_bool("reg_steppes", true) then	
	dofile(path .. "/steppes.lua")
end

if minetest.settings:get_bool("reg_warms", true) then
	dofile(path .. "/warms.lua")
end


if minetest.settings:get_bool("reg_hsavanna", true) then	
	dofile(path .. "/savanna.lua")
end

if minetest.settings:get_bool("reg_jprainforest", true) then
	dofile(path .. "/jprainforest.lua")
end
	
if minetest.settings:get_bool("reg_bamboo", true) then
	dofile(path .. "/bamboo.lua")
end

-- Global

	dofile(path .. "/globals.lua")
	dofile(path .. "/bugs.lua")
	dofile(path .. "/mobs.lua")
	
if minetest.get_modpath("forgotten_monsters") then
	dofile(path .. "/forgotten_monsters.lua")
end

-- Extended support

if minetest.settings:get_bool("supp_animalworld", true) then
	if minetest.get_modpath("animalworld") then
		dofile(path .. "/animalworld.lua")
	end
end

if minetest.settings:get_bool("supp_nssm", true) then
	if minetest.get_modpath("nssm") then
		dofile(path .. "/nssm.lua")
	end
end


