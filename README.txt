#########################################
################ebiomes##################
#########################################

Version 1.2.0 - By CowboyLv

## Changes

Version 1.2.0

Added Humid Savanna and Japanese Rainforest biomes.
Bamboo - Can be turned off if need be. (Don't do this on worlds where it was on)
Filled in missing aliases
Removed 2 biome fillers(Humid Rainforest, Humid Deiciduous Forest). Those do not add anything, they merelly fill space with a preexisting biome to prevent anomalies.
Tweaks in arid grasslands. Colors and Cool Arid Grassland now has more grass.


Version 1.1.2

Added a setting to disable reregistering decorations, so that the mod can be made compatible with other biome mods.


Version 1.1.1

Reduced the unregisters.
Previously reregister.lua unregistered all biomes, ore and decorations before reregistering them.
Now it unregisters and reregisters decorations only.


Version 1.1.0

Reworked swamp - Now has 2 parts. Swampland and Bog.


Version 1.0.1

Added Forgotten Monsters by DuckGo support.



## General 

This is a vanilla themed mod for minetest game, designed to bring vanilla like biomes with least amount of changes to the vanilla minetest.

Several popular mods are supported - bonemeal, mobs_animal, mobs_monster, mobs_npc, mob_horse, moreblocks, flowerpot
Additional supported mods - forgotten_monsters

Due to its unregistering and reregistering decorations, it is not compatible with ethereal. Other biome mod compatibility may vary.
The user can DISABLE the setting to gain proper compatibility with ethereal and other mods that involve decorations.

Retouches to vanilla(ENABLED by default, but can be ALTERED as of version 1.1.2) - Blueberries are removed from Snowy Grassland. Cowberries have taken their place, they spawn at - Snowy Grassland, Taiga, and Tundra biomes(on moss)
If rereg_mtg_decors is disabled cowberries will only spawn in tundra and taiga.

As of 1.2.0 the player can disable bamboo in Extra Biomes modmenu, should they use a different mod for adding bamboo. Although it's also recommended to disable reregistering of decorations.

More experienced users can disable Humid Savanna and Japanese rainforest by commenting them out in init.lua. Mod author has not added a toggle for these, because bamboo.lua kind of depends on jprainforest.lua file.

## Additions

- Deciduous forest variants - Warm and Cold Deciduous forests
- A swamp biome on humid Cold Deciduous Forest zones near sea level.
- Mediterranean biome.
- Dry grasslands - Found between grasslands and deserts
- Warm grassland - Intended as a transition biome
- Steppes - Between Grassland and Snowy Grassland
- Bog - Internal Swamp biome (1.1.0)
- Humid Savanna (1.2.0)
- Japanese Rainforest (1.2.0)

## Notes

Tips:

Bonemeal mod is highly recommended

There is a hurful bush in game which can only be cut with bronze or a better sword.

Bog is nasty, watch your step.

As of version 1.2.0 the player can encounter moss patches in the Japanese Rainforest. Those are useful for making mossy cobblestone. Or the player can use bonemeal to grow the occasional moss patch out of the rainforest litter there.

Bamboo patches also occur on regular rainforest. (On default)

Things lacking - Fireflies on the mods biomes(a bug on mtg end as of July 13th 2022, the code for them is in the mod)

## Issues

To remove blackberry from snowy_grassland the default mod together with other vanilla game mods have had their decorations reregistered. So far there is no method(dev term, look up the minetest modding wiki or doc folder in install/build minetest directory(not .minetest)) designed to remove or change a single decoration.

Fireflies are bugged outside of mtg. Tested this in Ethereal as well.

The possibility to recolor grass textures in lua files with colorize saving file size on mods is known. However the textures are made with Tone Chroma and other color related methods on GIMP and so far the mod author is unsure if one can replicate it using only code.




