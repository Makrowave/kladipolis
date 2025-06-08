import crafttweaker.api.game.Game;

//remove all trades
for profession in game.villagerProfessions {
    villagerTrades.removeAllTrades(profession, 1);
}

//farmer
villagerTrades.addTrade(<profession:minecraft:farmer>, 1, <item:minecraft:oak_log> * 10,<item:minecraft:air>, <item:minecraft:bread> * 1, 5, 2, 0.5);