local path = core.get_modpath("ebiomes")

--quick access template
--[[
--from runs cooltrees
local modname = "ebiomes"
local modpath = core.get_modpath(modname)
local mg_name = core.get_mapgen_setting("mg_name")
--]]

-- Base

    dofile(path .. "/rereg.lua")
	dofile(path .. "/cowberries.lua")


if core.settings:get_bool("reg_arids", true) then
	dofile(path .. "/arids.lua")
end

if core.settings:get_bool("reg_buffers", true) then
	dofile(path .. "/buffers.lua")
end

if core.settings:get_bool("reg_cswamps", true) then
	dofile(path .. "/coldnswamps.lua")
end

if core.settings:get_bool("reg_mediterranean", true) then
	dofile(path .. "/mediterranean.lua")
end

if core.settings:get_bool("reg_steppes", true) then
	dofile(path .. "/steppes.lua")
end

if core.settings:get_bool("reg_warms", true) then
	dofile(path .. "/warms.lua")
end


if core.settings:get_bool("reg_hsavanna", true) then
	dofile(path .. "/savanna.lua")
end

if core.settings:get_bool("reg_jprainforest", true) then
	dofile(path .. "/jprainforest.lua")
end

if core.settings:get_bool("reg_bamboo", true) then
	dofile(path .. "/bamboo.lua")
end

-- Global

	dofile(path .. "/globals.lua")
	dofile(path .. "/bugs.lua")

-- Extended support

if core.settings:get_bool("supp_mobs", true) then
	dofile(path .. "/mobs.lua")
end

if core.settings:get_bool("supp_forgotten_monsters", true) then
	if core.get_modpath("forgotten_monsters") then
		dofile(path .. "/forgotten_monsters.lua")
	end
end

-- Extended support

if core.settings:get_bool("supp_animalworld", true) then
	if core.get_modpath("animalworld") then
		dofile(path .. "/animalworld.lua")
	end
end

if core.settings:get_bool("supp_nssm", true) then
	if core.get_modpath("nssm") then
		dofile(path .. "/nssm.lua")
	end
end




if core.settings:get_bool("reg_hsavanna", true) and core.settings:get_bool("reg_jsavanna", true) then
	dofile(path .. "/jsavanna.lua")
end

if core.settings:get_bool("reg_cswamps", true) and core.settings:get_bool("reg_warms", true) and core.settings:get_bool("reg_trainforest", true) then
	dofile(path .. "/trainforest.lua")
end

if core.settings:get_bool("reg_cswamps", true) and core.settings:get_bool("reg_warms", true) and core.settings:get_bool("reg_steppes", true) and core.settings:get_bool("reg_extensions", true) then
	dofile(path .. "/extensions.lua")
end
