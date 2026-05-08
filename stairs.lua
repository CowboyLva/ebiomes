local S = core.get_translator("ebiomes")

if core.settings:get_bool("reg_cswamps", true) then
    if core.global_exists("moreblocks") then
		stairsplus:register_all("ebiomes", "alder_tree", "ebiomes:alder_tree", {
			description = "Alder Tree",
			tiles = {"ebiomes_alder_tree_top.png", "ebiomes_alder_tree_top.png",
				"ebiomes_alder_tree.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes", "alder_wood", "ebiomes:alder_wood", {
			description = "Alder Wood",
			tiles = {"ebiomes_alder_wood.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes", "ash_tree", "ebiomes:ash_tree", {
			description = "Ash Tree",
			tiles = {"ebiomes_ash_tree_top.png", "ebiomes_ash_tree_top.png",
				"ebiomes_ash_tree.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes", "ash_wood", "ebiomes:ash_wood", {
			description = "Ash Wood",
			tiles = {"ebiomes_ash_wood.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes", "birch_tree", "ebiomes:birch_tree", {
			description = "Birch Tree",
			tiles = {"ebiomes_birch_tree_top.png", "ebiomes_birch_tree_top.png",
				"ebiomes_birch_tree.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes", "birch_wood", "ebiomes:birch_wood", {
			description = "Birch Wood",
			tiles = {"ebiomes_birch_wood.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes", "downy_birch_tree", "ebiomes:downy_birch_tree", {
			description = "Downy Birch Tree",
			tiles = {"ebiomes_downy_birch_tree_top.png", "ebiomes_downy_birch_tree_top.png",
				"ebiomes_downy_birch_tree.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes", "downy_birch_wood", "ebiomes:downy_birch_wood", {
			description = "Downy Birch Wood",
			tiles = {"ebiomes_downy_birch_wood.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes", "willow_tree", "ebiomes:willow_tree", {
			description = "Willow Tree",
			tiles = {"ebiomes_willow_tree_top.png", "ebiomes_willow_tree_top.png",
				"ebiomes_willow_tree.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes", "willow_wood", "ebiomes:willow_wood", {
			description = "Willow Wood",
			tiles = {"ebiomes_willow_wood.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})
    --against duplicate stairs
        core.register_alias("stairs:slab_alder_wood", "ebiomes:slab_alder_wood")
        core.register_alias("stairs:stair_alder_wood", "ebiomes:stair_alder_wood")
        core.register_alias("stairs:stair_inner_alder_wood", "ebiomes:stair_alder_wood_inner")
        core.register_alias("stairs:stair_outer_alder_wood", "ebiomes:stair_alder_wood_outer")

        core.register_alias("stairs:slab_ash_wood", "ebiomes:slab_ash_wood")
        core.register_alias("stairs:stair_ash_wood", "ebiomes:stair_ash_wood")
        core.register_alias("stairs:stair_inner_ash_wood", "ebiomes:stair_ash_wood_inner")
        core.register_alias("stairs:stair_outer_ash_wood", "ebiomes:stair_ash_wood_outer")

        core.register_alias("stairs:slab_birch_wood", "ebiomes:slab_birch_wood")
        core.register_alias("stairs:stair_birch_wood", "ebiomes:stair_birch_wood")
        core.register_alias("stairs:stair_inner_birch_wood", "ebiomes:stair_birch_wood_inner")
        core.register_alias("stairs:stair_outer_birch_wood", "ebiomes:stair_birch_wood_outer")

        core.register_alias("stairs:slab_downy_birch_wood", "ebiomes:slab_downy_birch_wood")
        core.register_alias("stairs:stair_downy_birch_wood", "ebiomes:stair_downy_birch_wood")
        core.register_alias("stairs:stair_inner_downy_birch_wood", "ebiomes:stair_downy_birch_wood_inner")
        core.register_alias("stairs:stair_outer_downy_birch_wood", "ebiomes:stair_downy_birch_wood_outer")

        core.register_alias("stairs:slab_willow_wood", "ebiomes:slab_willow_wood")
        core.register_alias("stairs:stair_willow_wood", "ebiomes:stair_willow_wood")
        core.register_alias("stairs:stair_inner_willow_wood", "ebiomes:stair_willow_wood_inner")
        core.register_alias("stairs:stair_outer_willow_wood", "ebiomes:stair_willow_wood_outer")

    else
        --form sampled from pigiron mod
        stairs.register_stair_and_slab("willow_wood", "ebiomes:willow_wood",
    		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
    		{"ebiomes_willow_wood.png"},
    		S("Willow Wood Stair"),
    		S("Willow Wood Slab"),
    		default.node_sound_wood_defaults(),
    		true,
    		S("Inner Willow Wood Stair"),
    		S("Outer Willow Wood Stair")
    	)

    	stairs.register_stair_and_slab("alder_wood", "ebiomes:alder_wood",
    		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
    		{"ebiomes_alder_wood.png"},
    		S("Alder Wood Stair"),
	    	S("Alder Wood Slab"),
	    	default.node_sound_wood_defaults(),
	    	true,
	    	S("Inner Alder Wood Stair"),
	    	S("Outer Alder Wood Stair")
    	)

    	stairs.register_stair_and_slab("ash_wood", "ebiomes:ash_wood",
	    	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	    	{"ebiomes_ash_wood.png"},
	    	S("Ash Wood Stair"),
	    	S("Ash Wood Slab"),
    		default.node_sound_wood_defaults(),
    		true,
    		S("Inner Ash Wood Stair"),
    		S("Outer Ash Wood Stair")
    	)

    	stairs.register_stair_and_slab("birch_wood", "ebiomes:birch_wood",
	    	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	    	{"ebiomes_birch_wood.png"},
	    	S("Birch Wood Stair"),
	    	S("Birch Wood Slab"),
	    	default.node_sound_wood_defaults(),
	    	true,
	    	S("Inner Birch Wood Stair"),
    		S("Outer Birch Wood Stair")
    	)

    	stairs.register_stair_and_slab("downy_birch_wood", "ebiomes:downy_birch_wood",
	    	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	    	{"ebiomes_downy_birch_wood.png"},
	    	S("Downy Birch Wood Stair"),
	    	S("Downy Birch Wood Slab"),
	    	default.node_sound_wood_defaults(),
	    	true,
	    	S("Inner Downy Birch Wood Stair"),
	    	S("Outer Downy Birch Wood Stair")
    	)
    end
end


if core.settings:get_bool("reg_cswamps", true) and core.settings:get_bool("reg_warms", true) and core.settings:get_bool("reg_steppes", true) and core.settings:get_bool("reg_extensions", true) then
    if core.global_exists("moreblocks") then
		stairsplus:register_all("ebiomes", "oak_tree", "ebiomes:oak_tree", {
			description = "Oak Tree",
			tiles = {"ebiomes_oak_tree_top.png", "ebiomes_oak_tree_top.png",
				"ebiomes_oak_tree.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})


		stairsplus:register_all("ebiomes", "oak_wood", "ebiomes:oak_wood", {
			description = "Oak Wood",
			tiles = {"ebiomes_oak_wood.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes", "maple_tree", "ebiomes:maple_tree", {
			description = "Maple Tree",
			tiles = {"ebiomes_maple_tree_top.png", "ebiomes_maple_tree_top.png",
				"ebiomes_maple_tree.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes", "maple_wood", "ebiomes:maple_wood", {
			description = "Maple Wood",
			tiles = {"ebiomes_maple_wood.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

        core.register_alias("stairs:slab_oak_wood", "ebiomes:slab_oak_wood")
        core.register_alias("stairs:stair_oak_wood", "ebiomes:stair_oak_wood")
        core.register_alias("stairs:stair_inner_oak_wood", "ebiomes:stair_oak_wood_inner")
        core.register_alias("stairs:stair_outer_oak_wood", "ebiomes:stair_oak_wood_outer")

        core.register_alias("stairs:slab_maple_wood", "ebiomes:slab_maple_wood")
        core.register_alias("stairs:stair_maple_wood", "ebiomes:stair_maple_wood")
        core.register_alias("stairs:stair_inner_maple_wood", "ebiomes:stair_maple_wood_inner")
        core.register_alias("stairs:stair_outer_maple_wood", "ebiomes:stair_maple_wood_outer")

    else
    	stairs.register_stair_and_slab("oak_wood", "ebiomes:oak_wood",
	    	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	    	{"ebiomes_oak_wood.png"},
	    	S("Oak Wood Stair"),
	    	S("Oak Wood Slab"),
	    	default.node_sound_wood_defaults(),
	    	true,
	    	S("Inner Oak Wood Stair"),
	    	S("Outer Oak Wood Stair")
	    )

	    stairs.register_stair_and_slab("maple_wood", "ebiomes:maple_wood",
	    	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	    	{"ebiomes_maple_wood.png"},
	    	S("Maple Wood Stair"),
	    	S("Maple Wood Slab"),
	    	default.node_sound_wood_defaults(),
    		true,
    		S("Inner Maple Wood Stair"),
    		S("Outer Maple Wood Stair")
    	)
    end
end


if core.settings:get_bool("reg_jprainforest", true) then
    if core.global_exists("moreblocks") then
		stairsplus:register_all("ebiomes", "sugi_tree", "ebiomes:sugi_tree", {
			description = "Sugi Tree",
			tiles = {"ebiomes_sugi_tree_top.png", "ebiomes_sugi_tree_top.png",
				"ebiomes_sugi_tree.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes", "sugi_wood", "ebiomes:sugi_wood", {
			description = "Sugi Wood",
			tiles = {"ebiomes_sugi_wood.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes", "mizunara_tree", "ebiomes:mizunara_tree", {
			description = "Mizunara Tree",
			tiles = {"ebiomes_mizunara_tree_top.png", "ebiomes_mizunara_tree_top.png",
				"ebiomes_mizunara_tree.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes", "mizunara_wood", "ebiomes:mizunara_wood", {
			description = "Mizunara Wood",
			tiles = {"ebiomes_mizunara_wood.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes", "stoneoak_tree", "ebiomes:stoneoak_tree", {
			description = "Stone Oak Tree",
			tiles = {"ebiomes_stoneoak_tree_top.png", "ebiomes_stoneoak_tree_top.png",
				"ebiomes_stoneoak_tree.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes", "stoneoak_wood", "ebiomes:stoneoak_wood", {
			description = "Stone Oak Wood",
			tiles = {"ebiomes_stoneoak_wood.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

        core.register_alias("stairs:slab_sugi_wood", "ebiomes:slab_sugi_wood")
        core.register_alias("stairs:stair_sugi_wood", "ebiomes:stair_sugi_wood")
        core.register_alias("stairs:stair_inner_sugi_wood", "ebiomes:stair_sugi_wood_inner")
        core.register_alias("stairs:stair_outer_sugi_wood", "ebiomes:stair_sugi_wood_outer")

        core.register_alias("stairs:slab_mizunara_wood", "ebiomes:slab_mizunara_wood")
        core.register_alias("stairs:stair_mizunara_wood", "ebiomes:stair_mizunara_wood")
        core.register_alias("stairs:stair_inner_mizunara_wood", "ebiomes:stair_mizunara_wood_inner")
        core.register_alias("stairs:stair_outer_mizunara_wood", "ebiomes:stair_mizunara_wood_outer")

        core.register_alias("stairs:slab_stoneoak_wood", "ebiomes:slab_stoneoak_wood")
        core.register_alias("stairs:stair_stoneoak_wood", "ebiomes:stair_stoneoak_wood")
        core.register_alias("stairs:stair_inner_stoneoak_wood", "ebiomes:stair_stoneoak_wood_inner")
        core.register_alias("stairs:stair_outer_stoneoak_wood", "ebiomes:stair_stoneoak_wood_outer")

    else
        stairs.register_stair_and_slab("sugi_wood", "ebiomes:sugi_wood",
    		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
    		{"ebiomes_sugi_wood.png"},
    		S("Sugi Wood Stair"),
    		S("Sugi Wood Slab"),
    		default.node_sound_wood_defaults(),
    		true,
    		S("Inner Sugi Wood Stair"),
    		S("Outer Sugi Wood Stair")
    	)

    	stairs.register_stair_and_slab("mizunara_wood", "ebiomes:mizunara_wood",
    		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
    		{"ebiomes_mizunara_wood.png"},
    		S("Mizunara Wood Stair"),
    		S("Mizunara Wood Slab"),
    		default.node_sound_wood_defaults(),
    		true,
    		S("Inner Mizunara Wood Stair"),
    		S("Outer Mizunara Wood Stair")
    	)

    	stairs.register_stair_and_slab("stoneoak_wood", "ebiomes:stoneoak_wood",
    		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
    		{"ebiomes_stoneoak_wood.png"},
    		S("Stone Oak Wood Stair"),
    		S("Stone Oak Wood Slab"),
    		default.node_sound_wood_defaults(),
    		true,
    		S("Inner Stone Oak Wood Stair"),
    		S("Outer Stone Oak Wood Stair")
    	)
    end
end


if core.settings:get_bool("reg_hsavanna", true) then
    if core.global_exists("moreblocks") then
		stairsplus:register_all("ebiomes", "afzelia_tree", "ebiomes:afzelia_tree", {
			description = "Afzelia Tree",
			tiles = {"ebiomes_afzelia_tree_top.png", "ebiomes_afzelia_tree_top.png",
				"ebiomes_afzelia_tree.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes", "afzelia_wood", "ebiomes:afzelia_wood", {
			description = "Afzelia Wood",
			tiles = {"ebiomes_afzelia_wood.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes", "limba_tree", "ebiomes:limba_tree", {
			description = "Limba Tree",
			tiles = {"ebiomes_limba_tree_top.png", "ebiomes_limba_tree_top.png",
				"ebiomes_limba_tree.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes", "limba_wood", "ebiomes:limba_wood", {
			description = "Limba Wood",
			tiles = {"ebiomes_limba_wood.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes" , "limba_black_wood", "ebiomes:limba_black_wood", {
			description = "Black Limba Wood",
			tiles = {"ebiomes_limba_black_wood.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes", "siri_tree", "ebiomes:siri_tree", {
			description = "Siri Tree",
			tiles = {"ebiomes_siri_tree_top.png", "ebiomes_siri_tree_top.png",
				"ebiomes_siri_tree.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes", "siri_wood", "ebiomes:siri_wood", {
			description = "Siri Wood",
			tiles = {"ebiomes_siri_wood.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes", "tamarind_tree", "ebiomes:tamarind_tree", {
			description = "Tamarind Tree",
			tiles = {"ebiomes_tamarind_tree_top.png", "ebiomes_tamarind_tree_top.png",
				"ebiomes_tamarind_tree.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})


		stairsplus:register_all("ebiomes", "tamarind_wood", "ebiomes:tamarind_wood", {
			description = "Tamarind Wood",
			tiles = {"ebiomes_tamarind_wood.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

        core.register_alias("stairs:slab_afzelia_wood", "ebiomes:slab_afzelia_wood")
        core.register_alias("stairs:stair_afzelia_wood", "ebiomes:stair_afzelia_wood")
        core.register_alias("stairs:stair_inner_afzelia_wood", "ebiomes:stair_afzelia_wood_inner")
        core.register_alias("stairs:stair_outer_afzelia_wood", "ebiomes:stair_afzelia_wood_outer")

        core.register_alias("stairs:slab_limba_wood", "ebiomes:slab_limba_wood")
        core.register_alias("stairs:stair_limba_wood", "ebiomes:stair_limba_wood")
        core.register_alias("stairs:stair_inner_limba_wood", "ebiomes:stair_limba_wood_inner")
        core.register_alias("stairs:stair_outer_limba_wood", "ebiomes:stair_limba_wood_outer")

        core.register_alias("stairs:slab_limba_black_wood", "ebiomes:slab_limba_black_wood")
        core.register_alias("stairs:stair_limba_black_wood", "ebiomes:stair_limba_black_wood")
        core.register_alias("stairs:stair_inner_limba_black_wood", "ebiomes:stair_limba_black_wood_inner")
        core.register_alias("stairs:stair_outer_limba_black_wood", "ebiomes:stair_limba_black_wood_outer")

        core.register_alias("stairs:slab_siri_wood", "ebiomes:slab_siri_wood")
        core.register_alias("stairs:stair_siri_wood", "ebiomes:stair_siri_wood")
        core.register_alias("stairs:stair_inner_siri_wood", "ebiomes:stair_siri_wood_inner")
        core.register_alias("stairs:stair_outer_siri_wood", "ebiomes:stair_siri_wood_outer")

        core.register_alias("stairs:slab_tamarind_wood", "ebiomes:slab_tamarind_wood")
        core.register_alias("stairs:stair_tamarind_wood", "ebiomes:stair_tamarind_wood")
        core.register_alias("stairs:stair_inner_tamarind_wood", "ebiomes:stair_tamarind_wood_inner")
        core.register_alias("stairs:stair_outer_tamarind_wood", "ebiomes:stair_tamarind_wood_outer")

    else
    	stairs.register_stair_and_slab("afzelia_wood", "ebiomes:afzelia_wood",
	    	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	    	{"ebiomes_afzelia_wood.png"},
	    	S("Afzelia Wood Stair"),
	    	S("Afzelia Wood Slab"),
	    	default.node_sound_wood_defaults(),
	    	true,
    		S("Inner Afzelia Wood Stair"),
    		S("Outer Afzelia Wood Stair")
    	)

    	stairs.register_stair_and_slab("limba_wood", "ebiomes:limba_wood",
    		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
    		{"ebiomes_limba_wood.png"},
    		S("Limba Wood Stair"),
    		S("Limba Wood Slab"),
    		default.node_sound_wood_defaults(),
    		true,
    		S("Inner Limba Wood Stair"),
    		S("Outer Limba Wood Stair")
    	)

    	stairs.register_stair_and_slab("limba_black_wood", "ebiomes:limba_black_wood",
    		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
    		{"ebiomes_limba_black_wood.png"},
    		S("Black Limba Wood Stair"),
    		S("Black Limba Wood Slab"),
    		default.node_sound_wood_defaults(),
    		true,
    		S("Inner Black Limba Wood Stair"),
    		S("Outer Black Limba Wood Stair")
    	)

    	stairs.register_stair_and_slab("siri_wood", "ebiomes:siri_wood",
    		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
    		{"ebiomes_siri_wood.png"},
    		S("Siri Wood Stair"),
    		S("Siri Wood Slab"),
    		default.node_sound_wood_defaults(),
    		true,
    		S("Inner Siri Wood Stair"),
    		S("Outer Siri Wood Stair")
    	)

    	stairs.register_stair_and_slab("tamarind_wood", "ebiomes:tamarind_wood",
    		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
    		{"ebiomes_tamarind_wood.png"},
    		S("Tamarind Wood Stair"),
    		S("Tamarind Wood Slab"),
    		default.node_sound_wood_defaults(),
    		true,
    		S("Inner Tamarind Wood Stair"),
    		S("Outer Tamarind Wood Stair")
    	)
    end
end


if core.settings:get_bool("reg_mediterranean", true) then
    if core.global_exists("moreblocks") then
		stairsplus:register_all("ebiomes", "cypress_tree", "ebiomes:cypress_tree", {
			description = "Cypress Tree",
			tiles = {"ebiomes_cypress_tree_top.png", "ebiomes_cypress_tree_top.png",
				"ebiomes_cypress_tree.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes", "cypress_wood", "ebiomes:cypress_wood", {
			description = "Cypress Wood",
			tiles = {"ebiomes_cypress_wood.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes", "olive_tree", "ebiomes:olive_tree", {
			description = "Olive Tree",
			tiles = {"ebiomes_olive_tree_top.png", "ebiomes_olive_tree_top.png",
				"ebiomes_olive_tree.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes", "olive_wood", "ebiomes:olive_wood", {
			description = "Olive Wood",
			tiles = {"ebiomes_olive_wood.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

        core.register_alias("stairs:slab_cypress_wood", "ebiomes:slab_cypress_wood")
        core.register_alias("stairs:stair_cypress_wood", "ebiomes:stair_cypress_wood")
        core.register_alias("stairs:stair_inner_cypress_wood", "ebiomes:stair_cypress_wood_inner")
        core.register_alias("stairs:stair_outer_cypress_wood", "ebiomes:stair_cypress_wood_outer")

        core.register_alias("stairs:slab_olive_wood", "ebiomes:slab_olive_wood")
        core.register_alias("stairs:stair_olive_wood", "ebiomes:stair_olive_wood")
        core.register_alias("stairs:stair_inner_olive_wood", "ebiomes:stair_olive_wood_inner")
        core.register_alias("stairs:stair_outer_olive_wood", "ebiomes:stair_olive_wood_outer")

    else
    	stairs.register_stair_and_slab("cypress_wood", "ebiomes:cypress_wood",
	    	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	    	{"ebiomes_cypress_wood.png"},
	    	S("Cypress Wood Stair"),
	    	S("Cypress Wood Slab"),
	    	default.node_sound_wood_defaults(),
	    	true,
	    	S("Inner Cypress Wood Stair"),
	    	S("Outer Cypress Wood Stair")
	    )

	    stairs.register_stair_and_slab("olive_wood", "ebiomes:olive_wood",
	    	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	    	{"ebiomes_olive_wood.png"},
	    	S("Olive Wood Stair"),
	    	S("Olive Wood Slab"),
	    	default.node_sound_wood_defaults(),
	    	true,
	    	S("Inner Olive Wood Stair"),
	    	S("Outer Olive Wood Stair")
	    )
    end
end


if core.settings:get_bool("reg_cswamps", true) and core.settings:get_bool("reg_warms", true) and core.settings:get_bool("reg_trainforest", true) then
    if core.global_exists("moreblocks") then
		stairsplus:register_all("ebiomes", "beech_tree", "ebiomes:beech_tree", {
			description = "Beech Tree",
			tiles = {"ebiomes_beech_tree_top.png", "ebiomes_beech_tree_top.png",
				"ebiomes_beech_tree.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes", "beech_wood", "ebiomes:beech_wood", {
			description = "Beech Wood",
			tiles = {"ebiomes_beech_wood.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

        core.register_alias("stairs:slab_beech_wood", "ebiomes:slab_beech_wood")
        core.register_alias("stairs:stair_beech_wood", "ebiomes:stair_beech_wood")
        core.register_alias("stairs:stair_inner_beech_wood", "ebiomes:stair_beech_wood_inner")
        core.register_alias("stairs:stair_outer_beech_wood", "ebiomes:stair_beech_wood_outer")

    else
    	stairs.register_stair_and_slab("beech_wood", "ebiomes:beech_wood",
    		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
    		{"ebiomes_beech_wood.png"},
    		S("Beech Wood Stair"),
    		S("Beech Wood Slab"),
    		default.node_sound_wood_defaults(),
    		true,
    		S("Inner Beech Wood Stair"),
    		S("Outer Beech Wood Stair")
    	)
    end
end


if core.settings:get_bool("reg_warms", true) then
    if core.global_exists("moreblocks") then
		stairsplus:register_all("ebiomes", "pear_tree", "ebiomes:pear_tree", {
			description = "Pear Tree",
			tiles = {"ebiomes_pear_tree_top.png", "ebiomes_pear_tree_top.png",
				"ebiomes_pear_tree.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes", "pear_wood", "ebiomes:pear_wood", {
			description = "Pear Wood",
			tiles = {"ebiomes_pear_wood.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes", "quince_tree", "ebiomes:quince_tree", {
			description = "Quince Tree",
			tiles = {"ebiomes_quince_tree_top.png", "ebiomes_quince_tree_top.png",
				"ebiomes_quince_tree.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes", "quince_wood", "ebiomes:quince_wood", {
			description = "Quince Wood",
			tiles = {"ebiomes_quince_wood.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes", "chestnut_tree", "ebiomes:chestnut_tree", {
			description = "Chestnut Tree",
			tiles = {"ebiomes_chestnut_tree_top.png", "ebiomes_chestnut_tree_top.png",
				"ebiomes_chestnut_tree.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes", "chestnut_wood", "ebiomes:chestnut_wood", {
			description = "Chestnut Wood",
			tiles = {"ebiomes_chestnut_wood.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes", "hornbeam_tree", "ebiomes:hornbeam_tree", {
			description = "Hornbeam Tree",
			tiles = {"ebiomes_hornbeam_tree_top.png", "ebiomes_hornbeam_tree_top.png",
				"ebiomes_hornbeam_tree.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

		stairsplus:register_all("ebiomes", "hornbeam_wood", "ebiomes:hornbeam_wood", {
			description = "Hornbeam Wood",
			tiles = {"ebiomes_hornbeam_wood.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

        core.register_alias("stairs:slab_pear_wood", "ebiomes:slab_pear_wood")
        core.register_alias("stairs:stair_pear_wood", "ebiomes:stair_pear_wood")
        core.register_alias("stairs:stair_inner_pear_wood", "ebiomes:stair_pear_wood_inner")
        core.register_alias("stairs:stair_outer_pear_wood", "ebiomes:stair_pear_wood_outer")

        core.register_alias("stairs:slab_quince_wood", "ebiomes:slab_quince_wood")
        core.register_alias("stairs:stair_quince_wood", "ebiomes:stair_quince_wood")
        core.register_alias("stairs:stair_inner_quince_wood", "ebiomes:stair_quince_wood_inner")
        core.register_alias("stairs:stair_outer_quince_wood", "ebiomes:stair_quince_wood_outer")

        core.register_alias("stairs:slab_chestnut_wood", "ebiomes:slab_chestnut_wood")
        core.register_alias("stairs:stair_chestnut_wood", "ebiomes:stair_chestnut_wood")
        core.register_alias("stairs:stair_inner_chestnut_wood", "ebiomes:stair_chestnut_wood_inner")
        core.register_alias("stairs:stair_outer_chestnut_wood", "ebiomes:stair_chestnut_wood_outer")

        core.register_alias("stairs:slab_hornbeam_wood", "ebiomes:slab_hornbeam_wood")
        core.register_alias("stairs:stair_hornbeam_wood", "ebiomes:stair_hornbeam_wood")
        core.register_alias("stairs:stair_inner_hornbeam_wood", "ebiomes:stair_hornbeam_wood_inner")
        core.register_alias("stairs:stair_outer_hornbeam_wood", "ebiomes:stair_hornbeam_wood_outer")

    else
    	stairs.register_stair_and_slab("pear_wood", "ebiomes:pear_wood",
	    	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	    	{"ebiomes_pear_wood.png"},
	    	S("Pear Wood Stair"),
	    	S("Pear Wood Slab"),
	    	default.node_sound_wood_defaults(),
	    	true,
	    	S("Inner Pear Wood Stair"),
	    	S("Outer Pear Wood Stair")
	    )

	    stairs.register_stair_and_slab("quince_wood", "ebiomes:quince_wood",
	    	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	    	{"ebiomes_quince_wood.png"},
	    	S("Quince Wood Stair"),
	    	S("Quince Wood Slab"),
	    	default.node_sound_wood_defaults(),
	    	true,
	    	S("Inner Quince Wood Stair"),
	    	S("Outer Quince Wood Stair")
	    )

	    stairs.register_stair_and_slab("chestnut_wood", "ebiomes:chestnut_wood",
	    	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	    	{"ebiomes_chestnut_wood.png"},
	    	S("Chestnut Wood Stair"),
	    	S("Chestnut Wood Slab"),
	    	default.node_sound_wood_defaults(),
	    	true,
	    	S("Inner Chestnut Wood Stair"),
	    	S("Outer Chestnut Wood Stair")
	    )

	    stairs.register_stair_and_slab("hornbeam_wood", "ebiomes:hornbeam_wood",
	    	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	    	{"ebiomes_hornbeam_wood.png"},
	    	S("Hornbeam Wood Stair"),
	    	S("Hornbeam Wood Slab"),
	    	default.node_sound_wood_defaults(),
	    	true,
	    	S("Inner Hornbeam Wood Stair"),
	    	S("Outer Hornbeam Wood Stair")
	    )
    end
end


