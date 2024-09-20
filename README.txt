#########################################
################ebiomes##################
#########################################

Version 1.5.3 - By CowboyLv

## Changes

1.5.3

Toggles for disabling mobs (mobs, forgotten_monsters)
Addition of eatable group
Russian and Latvian translations

1.5.2

Merged changes by adikalon to eliminate conflicts with nether mods

1.5.1

Added setting descriptions
Implemented a setting to make quagmires generate without cranberries

1.5.0

Added Maple and Oak trees which are found in deciduous forest variants if extensions are enabled(default on)
Made cooking recipes with buckets have the cookable item be placed on top, instead of right
Added dyes to flowers - Credit to Skivling
Added sands with debris
Reworked reregistration so it only affects snowy grassland without touching other mods.

1.4.1

Implemented a light mapgen(decorations) toggle to reduce mapgen lag on the denser biomes

1.4.0

Biomes
Jungle Savanna - Biome between Humid Savanna and Rainforest
Temperate Rainforest - Thick wet forest found near various Temperate forest biomes, has beech tree
Grassland and Deciduous Forest extensions that blend with nearby biomes

Color adjustments in steppes and warm grass biomes
Various tweaks and fixes


1.3.0

Code refactor - Biomes made before 1.2.0 release are now toggleable, closely related biomes are lumped into groups.

Cowberries can also be now disabled, disabling them will disable reregistering of decorations even if reregistering toggle is set to enabled. (Since they are the only reason for that to begin with)

Support for nssm. However nssm seems to significantly slow down mapgen, even when it's the only mod active. Therefore it's recommended only for the biggest fans of it. Support toggle can be left on, it's fine as long as nssm isn't actually loaded.

Player can now also disable buffer biomes. (Since 1.2.0 there were only two Sandstone Desert Buffer and Cold Desert Buffer)

Slight adjustments to mob spawns - e.g. Bunnies now spawn in more biomes.

1.2.3

Typo fixes
Uppdated grassland code with normal_grass group to match current minetest game versions
Wilhelmines Animal World (animalworld) by liil support


1.2.2

Warm steppe underground parameters fixed, small general cleanup.
Before version bump - Reeds fixed and cranberries retexture.

1.2.1

Humid Savanna ground layer fix.
Added settings for Humid Savanna and Japanese Rainforest.

1.2.0

Added Humid Savanna and Japanese Rainforest biomes.
Bamboo - Can be turned off if need be. (Don't do this on worlds where it was on)
Filled in missing aliases.
Removed 2 "biome fillers"(Humid Rainforest, Humid Deiciduous Forest). Those do not add anything, they merelly fill space with a preexisting biome to prevent abnormalities.
Tweaks in arid grasslands. Colors and Cool Arid Grassland now has more grass.


1.1.2

Added a setting to disable reregistering decorations, so that the mod can be made compatible with other biome mods.


1.1.1

Reduced the unregisters.
Previously reregister.lua unregistered all biomes, ore and decorations before reregistering them.
Now it unregisters and reregisters decorations only.


1.1.0

Reworked swamp - Now has 2 parts. Swampland and Bog.


1.0.1

Added Forgotten Monsters by DuckGo support.



## General 

This is a vanilla themed mod for minetest game, designed to bring vanilla like biomes with least amount of changes to the vanilla minetest.

Several popular mods are supported - bonemeal, mobs_animal, mobs_monster, mobs_npc, mob_horse, moreblocks, flowerpot
Post 1.0.0 - forgotten_monsters, animalworld, nssm

As of 1.2.0 the player can disable bamboo in Extra Biomes modmenu, either as a preference.
Or if a different mod will be used for adding bamboo.

Some biomes depend on others like:

Jungle Savanna - Humid Savanna
Temperate Rainforest - Cold and Warm Deciduous Forests
Extensions - Cold Deciduous, Warm Deciduous, Steppes

Don't use v6 mapgen, everything else is fine.

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
- Jungle Savanna (1.4.0)
- Temperate Rainforest (1.4.0)
- Grassland and Deciduous Forest Extensions (1.4.0)

## Notes

Tips:

Bonemeal mod is highly recommended

There is a hurful bush in game which can only be cut with bronze or a better sword.

Bog is nasty, watch Your step.

As of version 1.2.0 the player can encounter moss patches in the Japanese Rainforest. Those are useful for making mossy cobblestone. Or the player can use bonemeal to grow the occasional moss patch out of the rainforest litter there.

Bamboo patches occur on Japanese and regular Rainforest. (By default)

Things lacking - Fireflies on the mods biomes(a bug on mtg end as of July 13th 2022, the code for them is in the mod)

## Issues

To remove blackberry from snowy_grassland the default mods snowy grassland biome has been reregistered. So far there is no method(dev term, look up the minetest modding wiki or doc folder in install/build minetest directory(not .minetest)) designed to remove or change a single decoration.

Fireflies are bugged outside of mtg. Has been tested in Ethereal as well.
