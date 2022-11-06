local S = minetest.get_translator("ebiomes")

--[[
if minetest.get_modpath("stairs") then



end
--]]

--sampled from cool_trees
-- stairsplus/moreblocks
if minetest.get_modpath("moreblocks") then
	
	
	stairsplus:register_all("alder_tree", "wood", "ebiomes:alder_wood", {
		description = "Alder Wood",
		tiles = {"ebiomes_alder_wood.png"},
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})
	
	stairsplus:register_all("ash_tree", "wood", "ebiomes:ash_wood", {
		description = "Ash Wood",
		tiles = {"ebiomes_ash_wood.png"},
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})
	
	stairsplus:register_all("birch_tree", "wood", "ebiomes:birch_wood", {
		description = "Birch Wood",
		tiles = {"ebiomes_birch_wood.png"},
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})
	
		stairsplus:register_all("cypress_tree", "wood", "ebiomes:cypress_wood", {
		description = "Cypress Wood",
		tiles = {"ebiomes_cypress_wood.png"},
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})
	
	stairsplus:register_all("downy_birch_tree", "wood", "ebiomes:downy_birch_wood", {
		description = "Downy Birch Wood",
		tiles = {"ebiomes_downy_birch_wood.png"},
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})
	
	stairsplus:register_all("olive_tree", "wood", "ebiomes:olive_wood", {
		description = "Olive Wood",
		tiles = {"ebiomes_olive_wood.png"},
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})	
	
		stairsplus:register_all("willow_tree", "wood", "ebiomes:willow_wood", {
		description = "Willow Wood",
		tiles = {"ebiomes_willow_wood.png"},
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})
	
	stairsplus:register_all("pear_tree", "wood", "ebiomes:pear_wood", {
		description = "Pear Wood",
		tiles = {"ebiomes_pear_wood.png"},
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})
	
	stairsplus:register_all("quince_tree", "wood", "ebiomes:quince_wood", {
		description = "Quince Wood",
		tiles = {"ebiomes_quince_wood.png"},
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})
		
	stairsplus:register_all("chestnut_tree", "wood", "ebiomes:chestnut_wood", {
		description = "Chestnut Wood",
		tiles = {"ebiomes_chestnut_wood.png"},
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})
	
	stairsplus:register_all("hornbeam_tree", "wood", "ebiomes:hornbeam_wood", {
		description = "Hornbeam Wood",
		tiles = {"ebiomes_hornbeam_wood.png"},
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})

--If someone wants glorious peat stuff they may uncomment this. Whether this works righ out of bat, no idea.
--[[	
	stairsplus:register_all("peat_dry", "soil", "ebiomes:peat_dry", {
		description = "Dry Peat",
		tiles = {"ebiomes_peat_dry.png"},
		groups = {crumbly = 2, oddly_breakable_by_hand = 1},
		sounds = default.node_sound_wood_defaults(),
	})
--]]	
	
end

-- Support for flowerpot
if minetest.global_exists("flowerpot") then

	flowerpot.register_node("ebiomes:ash_sapling")
	flowerpot.register_node("ebiomes:alder_sapling")
	flowerpot.register_node("ebiomes:birch_sapling")
	flowerpot.register_node("ebiomes:cypress_sapling")
	flowerpot.register_node("ebiomes:downy_birch_sapling")
	flowerpot.register_node("ebiomes:olive_sapling")
	flowerpot.register_node("ebiomes:willow_sapling")
	flowerpot.register_node("ebiomes:pear_sapling")
	flowerpot.register_node("ebiomes:quince_sapling")
	flowerpot.register_node("ebiomes:chestnut_sapling")
	flowerpot.register_node("ebiomes:hornbeam_sapling")
	
	flowerpot.register_node("ebiomes:blackcurrant_bush_sapling")
	flowerpot.register_node("ebiomes:cowberry_bush_sapling")
	flowerpot.register_node("ebiomes:gooseberry_bush_sapling")
	flowerpot.register_node("ebiomes:peashrub_sapling")
	flowerpot.register_node("ebiomes:redcurrant_bush_sapling")
	flowerpot.register_node("ebiomes:bush_sapling_warm")
	flowerpot.register_node("ebiomes:hardy_bush_sapling")
	flowerpot.register_node("ebiomes:thorn_bush_sapling")
	
	flowerpot.register_node("ebiomes:blue_allium")
	flowerpot.register_node("ebiomes:blue_allium_purple")
	flowerpot.register_node("ebiomes:black_iris")
	flowerpot.register_node("ebiomes:russian_iris")
	flowerpot.register_node("ebiomes:mountain_lily")
	flowerpot.register_node("ebiomes:siberian_lily")
	flowerpot.register_node("ebiomes:altai_tulip")
	flowerpot.register_node("ebiomes:cranberry_patch")
	flowerpot.register_node("ebiomes:marsh_stitchwort") -- All respect to the plant, but lol
	flowerpot.register_node("ebiomes:marigold")
	flowerpot.register_node("ebiomes:sundew")
	flowerpot.register_node("ebiomes:larkspur")
	flowerpot.register_node("ebiomes:savory")
	flowerpot.register_node("ebiomes:chrysanthemum_yellow")
	flowerpot.register_node("ebiomes:cladanthus")
	flowerpot.register_node("ebiomes:buttercup_persian")
	flowerpot.register_node("ebiomes:staehelina")
	
end
