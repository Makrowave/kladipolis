import crafttweaker.api.loot.modifier.LootModifierManager;
import crafttweaker.api.loot.modifier.CommonLootModifiers;
import crafttweaker.api.loot.condition.LootConditions;
import crafttweaker.api.loot.condition.RandomChanceLootCondition;
import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.resource.ResourceLocation;

val rareDropRate = 0.05;

val rareSwords = [
    <item:simplyswords:caelestis> % rareDropRate,
    <item:simplyswords:soulpyre> % rareDropRate,
    <item:simplyswords:ribboncleaver> % rareDropRate,
    <item:simplyswords:flamewind> % rareDropRate,
    <item:simplyswords:wickpiercer> % rareDropRate,
    <item:simplyswords:hiveheart> % rareDropRate,
    <item:simplyswords:waxweaver> % rareDropRate,
    <item:simplyswords:molten_edge> % rareDropRate,
    <item:simplyswords:soulkeeper> % rareDropRate,
    <item:simplyswords:storms_edge> % rareDropRate,
    <item:simplyswords:whisperwind> % rareDropRate
];


val commonDropRate = 0.25;

val commonSwords = [
    <item:simplyswords:decaying_relic> % commonDropRate,
    <item:simplyswords:dormant_relic> % commonDropRate,
    <item:simplyswords:tainted_relic> % commonDropRate,
    <item:simplyswords:righteous_relic> % commonDropRate,
    <item:simplyswords:shadowsting> % commonDropRate,
    <item:simplyswords:watching_warglaive> % commonDropRate,
    <item:simplyswords:watcher_claymore> % commonDropRate,
    <item:simplyswords:chompolotl> % commonDropRate,
    <item:simplyswords:toxic_longsword> % commonDropRate,
    <item:simplyswords:livyatan> % commonDropRate,
    <item:simplyswords:frostfall> % commonDropRate,
    <item:simplyswords:mjolnir> % commonDropRate,
    <item:simplyswords:brimstone_claymore> % commonDropRate,
    <item:simplyswords:hearthflame> % commonDropRate,
    <item:simplyswords:soulstealer> % commonDropRate,
    <item:simplyswords:arcanethyst> % commonDropRate,
    <item:simplyswords:soulrender> % commonDropRate,
    <item:simplyswords:magiblade> % commonDropRate,
    <item:simplyswords:slumbering_lichblade> % commonDropRate,
    <item:simplyswords:waking_lichblade> % commonDropRate,
    <item:simplyswords:awakened_lichblade> % commonDropRate
];



val addRareSwordsModifier = CommonLootModifiers.addAllWithChance(rareSwords);
val addCommonSwordsModifier = CommonLootModifiers.addAllWithChance(commonSwords);
val allLootTablesSet = loot.tables.ids; // Set

val allLootTablesList = new stdlib.List<ResourceLocation>();

for table in allLootTablesSet {
    allLootTablesList.add(table);
}

val allLootTables = allLootTablesList as ResourceLocation[];

val minecraftChestsResourcePaths = allLootTables.filter(l => "minecraft:chests" in l.toString());

val mvsResourcePaths = allLootTables.filter(l => l.namespace == "mvs" && !("empty" in l.toString()));

val archeologyResourcePaths =  allLootTables.filter(l => "minecraft:archeology" in l.toString());



for path in minecraftChestsResourcePaths {
    loot.tables.getTable(path).addLootModifier("org.makrowave.modifiers.add_rare_swords." + path.toString().replace(':', '.'), addRareSwordsModifier);
}

for path in mvsResourcePaths {
    loot.tables.getTable(path).addLootModifier("org.makrowave.modifiers.add_rare_swords." + path.toString().replace(':', '.'), addRareSwordsModifier);
}

for path in archeologyResourcePaths {
    loot.tables.getTable(path).addLootModifier("org.makrowave.modifiers.add_rare_swords." + path.toString().replace(':', '.'), addCommonSwordsModifier);
}


