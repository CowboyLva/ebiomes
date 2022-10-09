#########################################
################ebiomes##################
#########################################

Version 1.1.X Dev - By CowboyLv

## Changes

Vqrsion 1.1.0

Reworked swamp - Now has 2 parts. Swampland and Bog.

Version 1.0.1

Added Forgotten Monsters by DuckGo support.

## General 

This is a vanilla themed mod for minetest game, designed to bring vanilla like biomes with least amount of changes to the vanilla minetest.

Several popular mods are supported - bonemeal, mobs_animal, mobs_monster, mobs_npc, mob_horse, moreblocks, flowerpot
Additional supported mods - forgotten_monsters

Due to its nature, it is not compatible with ethereal. Other biome mod compatibility may vary.

Retouches to vanilla - Blueberries are removed from Snowy Grassland. Cowberries have taken their place, they spawn at - Snowy Grassland, Taiga, and Tundra biomes(on moss)

## Additions

- Deciduous forest variants - Warm and Cold Deciduous forests
- A swamp biome on humid Cold Deciduous Forest zones near sea level.
- Mediterranean biome.
- Dry grasslands - Found between grasslands and deserts
- Warm grassland - Intended as a transition biome
- Steppes - Between Grassland and Snowy Grassland

Note - there is a hurful bush in game which can only be cut with bronze or a better sword.

Things lacking - Fireflies on the mods biomes(a bug on mtg end as of July 13th 2022, the code for them is in the mod)

## Issues

To remove blackberry from snowy_grassland the default mod together with other vanilla game mods have had their decorations reregistered. So far there is no method(dev term, look up the minetest modding wiki or doc folder in install/build minetest directory(not .minetest)) designed to remove or change a single decoration.

Fireflies are bugged outside of mtg. Tested this in Ethereal as well.

The possibility to recolor grass textures in lua files with colorize saving file size on mods is known. However the textures are made with Tone Chroma and other color related methods on GIMP and so far the mod author is unsure if one can replicate it using only code.


