--Forgotten monsters compatibility
--For specified mobs(ones that dont spawn in a highly generalized way like in air or on stone)

--hungry
if not mobs.custom_spawn_monster then
mobs:spawn({
	name = "hungry:hungry",
--	nodes = {"default:dirt_with_grass","default:dirt_with_rainforest_litter"},
	nodes = {"ebiomes:dirt_with_grass_warm", "ebiomes:dirt_with_grass_cold", "ebiomes:dirt_with_grass_med", "ebiomes:dirt_with_grass_steppe_warm", "ebiomes:dirt_with_japanese_rainforest_litter"},
--	biomes = {"deciduous_forest_cold", "deciduous_forest_warm"},
	min_light = 14,
	--interval = 30, -- 60
	chance = 9000,
	min_height = 0,
	max_height = 200,
})
end

--skullmobs
local fmeb = {
"ebiomes:dirt_with_grass_cold",
"ebiomes:dirt_with_grass_warm",
"ebiomes:dirt_with_grass_med",
"ebiomes:dirt_with_grass_swamp",
"ebiomes:dry_dirt_with_grass_arid",
"ebiomes:dry_dirt_with_grass_arid_cool",
"ebiomes:dirt_with_grass_steppe_cold",
"ebiomes:dirt_with_grass_steppe",
"ebiomes:dirt_with_grass_steppe_warm",
"ebiomes:peat_with_swamp_moss_yellow",
"ebiomes:dirt_with_japanese_rainforest_litter",
"ebiomes:dry_dirt_with_humid_savanna_grass",
"ebiomes:dirt_with_forest_litter",
"ebiomes:dirt_with_jungle_savanna_grass"

}

--skull archers
if not mobs.custom_spawn_monster then
mobs:spawn({
	name = "skullarchers:sarchers",
	nodes = fmeb,
	min_light = 0,
	max_light = 14,
	chance = 7000,
	--min_height = 0,
	--max_height = 200,
	max_height = 200,
})
end

--skulls
if not mobs.custom_spawn_monster then
mobs:spawn({
	name = "skulls:skull",
	nodes = fmeb,
	min_light = 0,
	max_light = 14,
	chance = 7000,
	--min_height = 0,
	--max_height = 200,
	max_height = 200,

})
end

--skullswords
if not mobs.custom_spawn_monster then
mobs:spawn({
	name = "skullsword:ssword",
	nodes = fmeb,
	min_light = 0,
	max_light = 14,
	chance = 7000,
	--min_height = 0,
	--max_height = 200,
	max_height = 200,
})
end

--berserker
mobs:spawn({
	name = "forgotten_monsters:skull_berserker",
	nodes = fmeb,
	neighbors = "air",
	min_light = 0,
	max_light = max_light_skull,
	chance = 7000,
	--min_height = 0,
	--max_height = 200,
	max_height = 200,
})
--[[
--spoky (old version monster)
if not mobs.custom_spawn_monster then
mobs:spawn({
	name = "spoky:spoky",
	nodes = fmeb,
	min_light = 0,
	max_light = 14,
	interval = 60,
	chance = 15000,
	--min_height = 0,
	--max_height = 200,
	max_height = 200,

})
end
--]]





