import crafttweaker.api.game.Game;
import crafttweaker.api.world.map.MapDecorationType;
import crafttweaker.api.villager.trade.type.TreasureMapForEmeralds;  

//remove all trades
for profession in game.villagerProfessions {
	if (profession.registryName.toString() == "minecraft:cartographer") {
		continue;
	}

	var level = 1;
    while level <= 5 {
		villagerTrades.removeAllTrades(profession, level);
		level += 1;
	}
}

//farmer
villagerTrades.addTrade(<profession:minecraft:farmer>, 1, <item:minecraft:oak_log> * 10,<item:minecraft:stick>, <item:minecraft:bread> * 1, 5, 2, 0.5);

//weaponsmith
villagerTrades.addTrade(<profession:minecraft:weaponsmith>, 1, <item:minecraft:coal> * 20, <item:minecraft:stick>, <item:magistuarmory:iron_stylet> * 1, 2, 2, 0);

// Armorer
villagerTrades.addTrade(<profession:minecraft:armorer>, 1, <item:minecraft:campfire> * 5, <item:minecraft:stick>, <item:toughasnails:wool_chestplate> * 1, 2, 2, 0.5);

// Shepherd
villagerTrades.addTrade(<profession:minecraft:shepherd>, 1, <item:minecraft:emerald> * 10, <item:minecraft:stick>, <item:magistuarmory:dragon_pattern> * 1, 2, 2, 0.5);
villagerTrades.addTrade(<profession:minecraft:shepherd>, 1, <item:minecraft:emerald> * 10, <item:minecraft:stick>, <item:magistuarmory:sun_pattern> * 1, 2, 2, 0.5);
