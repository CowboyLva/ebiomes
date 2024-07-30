local mm = nssm.multimobs

--[[
nssm = {
	mymapgenis = tonumber(minetest.settings:get("mymapgenis")) or 7,
	multimobs = tonumber(minetest.settings:get("multimobs")) or 1000,
	spiders_litter_web = minetest.settings:get_bool("spiders_litter_web", true)
}
--]]


-- SPIDERS
--[[
		mobs:spawn_specific("nssm:black_widow",
			{"default:dirt_with_rainforest_litter", "default:jungletree", "nssm:web" },
			{"air"}, 0, 20, 30, 4400000/mm, 2, -400, 31000)

		mobs:spawn_specific("nssm:daddy_long_legs",
			{"default:dirt_with_rainforest_litter", "default:jungletree", "nssm:web" },
			{"air"}, 0, 30, 10, 4400000/mm, 2, -400, 31000)

		mobs:spawn_specific("nssm:tarantula",
			{"default:dirt_with_rainforest_litter", "default:jungletree", "nssm:web" },
			{"air"}, 0, 14, 120, 50000000/mm, 1, -400, 31000)

		mobs:spawn_specific("nssm:uloboros",
			{"default:dirt_with_rainforest_litter", "default:jungletree", "nssm:web" },
			{"air"}, 0, 20, 30, 4400000/mm, 1, -400, 31000)
--]]
		-- DUCKS

		mobs:spawn_specific("nssm:duck", {"ebiomes:dirt_with_grass_cold", "ebiomes:dirt_with_grass_swamp", "ebiomes:dirt_with_grass_warm", "ebiomes:dirt_with_grass_steppe_warm", "ebiomes:dirt_with_forest_litter", "ebiomes:dirt_with_japanese_rainforest_litter"},
			{"group:flora"}, 10, 20, 50, 1500000/mm, 1, -400, 40)

		mobs:spawn_specific("nssm:duckking", {"ebiomes:dirt_with_grass_cold", "ebiomes:dirt_with_grass_swamp", "ebiomes:dirt_with_grass_warm", "ebiomes:dirt_with_grass_steppe_warm", "ebiomes:dirt_with_forest_litter", "ebiomes:dirt_with_japanese_rainforest_litter"},
			{"group:flora"}, 10, 20, 400, 120000000/mm, 1, -400, 40)

		mobs:spawn_specific("nssm:enderduck", {"ebiomes:dirt_with_grass_cold", "ebiomes:dirt_with_grass_swamp", "ebiomes:dirt_with_grass_warm", "ebiomes:dirt_with_grass_steppe_warm", "ebiomes:dirt_with_forest_litter", "ebiomes:dirt_with_japanese_rainforest_litter"},
			{"group:flora"}, 0, 10, 120, 5000000/mm, 1, -400, 40)

		mobs:spawn_specific("nssm:flying_duck", {"air"},
			{"group:leaves"}, 10, 20, 120, 8000000/mm, 1, 1, 40)

		mobs:spawn_specific("nssm:flying_duck", {"air"},
			{"group:flora"}, 10, 20, 120, 25000000/mm, 1, 1, 40)

		mobs:spawn_specific("nssm:spiderduck", {"ebiomes:dirt_with_grass_cold", "ebiomes:dirt_with_grass_swamp", "ebiomes:dirt_with_grass_warm", "ebiomes:dirt_with_grass_steppe_warm", "ebiomes:dirt_with_forest_litter", "ebiomes:dirt_with_japanese_rainforest_litter"},
			{"group:flora"}, 0, 10, 120, 5000000/mm, 1, -400, 45)

		mobs:spawn_specific("nssm:swimming_duck", {"default:water_source"},
			{"default:water_source"}, 0, 20, 60, 45000000/mm, 1, -400, 40)

		mobs:spawn_specific("nssm:swimming_duck", {"default:river_water_source"},
			{"default:sand","default:river_water_source"},
			0, 20, 60, 3000000/mm, 1, -400, 300)

		-- MOUNTAINS

		mobs:spawn_specific("nssm:echidna", {"ebiomes:dry_dirt_with_grass_arid"},
			{"default:dry_shrub", "ebiomes:hardy_bush_leaves", "ebiomes:thorn_bush_leaves"}, 0, 20, 200, 100000000/mm, 1, 50, 31000)

		mobs:spawn_specific("nssm:manticore", {"ebiomes:dirt_with_grass_warm", "ebiomes:dirt_with_grass_steppe_warm", "ebiomes:dirt_with_grass_med"},
			{"ebiomes:dirt_with_grass_warm", "ebiomes:dirt_with_grass_steppe_warm", "ebiomes:dirt_with_grass_steppe_cold"}, 10, 20, 60, 13000000/mm, 1, 40, 31000)

		mobs:spawn_specific("nssm:werewolf", {"ebiomes:dirt_with_grass_cold", "ebiomes:dirt_with_grass_swamp", "ebiomes:dirt_with_grass_warm", "ebiomes:dirt_with_grass_steppe_warm", "ebiomes:dirt_with_grass_steppe", "ebiomes:dirt_with_grass_steppe_cold", "ebiomes:dirt_with_japanese_rainforest_litter", "default:dirt_with_coniferous_litter"},
			{"ebiomes:dirt_with_grass_cold", "ebiomes:dirt_with_grass_swamp", "ebiomes:dirt_with_grass_warm", "ebiomes:dirt_with_grass_steppe_warm", "ebiomes:dirt_with_grass_steppe", "ebiomes:dirt_with_grass_steppe_cold", "ebiomes:dirt_with_japanese_rainforest_litter", "default:dirt_with_coniferous_litter"}, 0, 10, 60, 13000000/mm, 1, 40, 31000)
--[[
		-- ICE

		mobs:spawn_specific("nssm:icelamander",
			{"default:snowblock", "default:ice"}, {"default:snowblock", "default:ice"},
			0, 20, 180, 120000000/mm, 1, -400, 31000)

		mobs:spawn_specific("nssm:icesnake",
			{"default:snowblock", "default:ice", "default:dirt_with_snow"},
			{"default:snowblock", "default:ice", "default:dirt_with_snow"},
			0, 20, 40, 20000000/mm, 1, -400, 31000)

		mobs:spawn_specific("nssm:white_werewolf",
			{"default:dirt_with_snow","default:snowblock"},
			{"air"}, 0, 20, 35, 22000000/mm, 1, 50, 31000)

		mobs:spawn_specific("nssm:snow_biter",
			{"default:snowblock", "default:ice", "default:dirt_with_snow"},
			{"default:snowblock", "default:ice", "default:dirt_with_snow"},
			0, 20, 40, 20000000/mm, 1, -400, 31000)
--]]
		-- FOREST

		mobs:spawn_specific("nssm:larva", {"ebiomes:dirt_with_japanese_rainforest_litter", "ebiomes:dirt_with_grass_cold", "ebiomes:dirt_with_grass_warm", "ebiomes:dirt_with_forest_litter"},
			{"ebiomes:mizunara_tree", "ebiomes:alder_tree", "ebiomes:pear_tree"}, 0, 20, 40, 800000/mm, 1, -400, 140)

		mobs:spawn_specific("nssm:masticone", {"ebiomes:dirt_with_japanese_rainforest_litter", "ebiomes:dirt_with_grass_cold", "ebiomes:dirt_with_grass_swamp", "ebiomes:dirt_with_grass_warm", "ebiomes:dirt_with_grass_steppe_warm", "ebiomes:dirt_with_grass_steppe", "ebiomes:dirt_with_forest_litter"},
			{"ebiomes:mizunara_tree", "ebiomes:alder_tree", "ebiomes:pear_tree", "ebiomes:downy_birch_tree"}, 0, 20, 180, 6000000/mm, 2, -400, 140)
--[[
		-- PINE FOREST

		mobs:spawn_specific("nssm:pumpboom_small",
			{"default:dirt_with_coniferous_litter", "default:dirt_with_snow",
			"default:snowblock"}, {"default:pine_tree"},
			0, 20, 80, 1400000/mm, 1, -400, 31000)

		mobs:spawn_specific("nssm:pumpboom_medium",
			{"default:dirt_with_coniferous_litter", "default:dirt_with_snow",
			"default:snowblock"}, {"default:pine_tree"},
			0, 20, 80, 1600000/mm, 1, -400, 31000)

		mobs:spawn_specific("nssm:pumpboom_large",
			{"default:dirt_with_coniferous_litter", "default:dirt_with_snow",
			"default:snowblock"}, {"default:pine_tree"},
			0, 20, 80, 1800000/mm, 1, -400, 31000)

		mobs:spawn_specific("nssm:pumpking",
			{"default:dirt_with_coniferous_litter", "default:dirt_with_snow",
			"default:snowblock"}, {"default:pine_needles", "default:pine_tree"},
			0, 12, 120, 8000000/mm, 1, -400, 31000)
--]]
		-- SAVANNA

		mobs:spawn_specific("nssm:felucco", {"ebiomes:dry_dirt_with_grass_arid",
			"ebiomes:dry_dirt_with_grass_arid"}, {"ebiomes:dry_dirt_with_grass_arid"},
			0, 20, 80, 20000000/mm, 1, -200, 31000)

--[[
if minetest.get_modpath("nssb") then






end
--]]
