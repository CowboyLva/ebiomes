#########################################
################ebiomes##################
#########################################

Version 0.1.9 beta - By CowboyLv

General
This is a vanilla themed mod for minetest game, designed to bring vanilla like biomes with least amount of changes to the vanilla minetest.
Several popular mods are supported - bonemeal, mobs_animal, mobs_monster, mobs_npc, mob_horse, moreblocks, flowerpot
Due to it's nature it is not compatible with ethereal. Other biome mod compatibility may vary.

Retouches to vanilla - Blueberries are removed from Snowy Grassland. Cowberries have taken their place, they spawn at - Snowy Grassland, Taiga, and Tundra biomes(on moss)

Additions
Deciduous forest variants - Warm and Cold Deciduous forests
A swamp biome on humid Cold Deciduous Forest zones near sea level.
Mediterranean biome.
Dry grasslands - Found between grasslands and deserts
Warm grassland - Intended as a transition biome
Steppes - Between Grassland and Snowy Grassland

Note - there is a hurful bush in game which can only be cut with bronze or a better sword.

Things lacking - Fireflies on the mods biomes, dungeon loot for various overworld additions(berries, peas etc.)


############For developers###############

Mod organisation - Lua files

reregister, reregflowers, rereaux - dedicated to reregistering vanilla biomes in order to make customizations
biobase - Where the very basics of biomes are stored (dirt_with_grass, grasses, water)
decors - Where bushes, flowers and other plants are stored
woods - dedicated file for trees, their crafts, fruits etc.
stuff - flowerpot and moreblocks support
bugs - for butterflies and fireflies(as of now baked in reregaux)
(Baking refers to inserting mod specific stuff in a vanilla mtg related lua file)
loot - for dungeon loot
bonemeal - bonemeal suport (for trees and bushes had to include code in their respective files)
mobs - TenPlus1's mob mods


Issues

To remove blackberry from snowy_grassland and as an attempt to make fireflies to spawn in some of the new biomes, the default mod together with other vanilla game mods have been reregistered.

Dungeon loot is a mistery. Has been broken once(therefore is interfaced with), but so far refuses to be extended.

The possibility to recolor grass textures in lua files with colorize saving file size on mod is known. However the textures are made with Tone Chroma and other color related methods on GIMP and so far it's unsure if one can replicate it using only code.

There is a slight worry about crediting people. Some simple things borrowed have later found out to be used by everyone else.