import crafttweaker.api.loot.modifier.LootModifierManager;
import crafttweaker.api.loot.modifier.CommonLootModifiers;
import crafttweaker.api.loot.condition.LootConditions;
import crafttweaker.api.loot.condition.RandomChanceLootCondition;
import crafttweaker.api.ingredient.IIngredient;

//Global declarations
val alwaysRemoveCondition = LootConditions.none();


//Remove enchantments
val enchantRemoveModifier = CommonLootModifiers.remove(<item:minecraft:book>);
val enchantRemoveModifierName = "com.makrowave.remove_enchanted_book_modifier";

loot.modifiers.register(enchantRemoveModifierName, alwaysRemoveCondition, enchantRemoveModifier);


val diamondItems = [
    <item:minecraft:diamond_helmet>,
    <item:minecraft:diamond_chestplate>,
    <item:minecraft:diamond_leggings>,
    <item:minecraft:diamond_boots>,
    <item:minecraft:diamond_sword>,
    <item:minecraft:diamond_pickaxe>,
    <item:minecraft:diamond_axe>,
    <item:minecraft:diamond_shovel>,
    <item:minecraft:diamond_hoe>,
    <item:minecraft:diamond>,
] as IIngredient[];

val diamondItemsModifier = CommonLootModifiers.removeAll(diamondItems);
val diamondRemoveModifierName = "com.makrowave.remove_diamond_drops_modifier";
loot.modifiers.register(diamondRemoveModifierName, alwaysRemoveCondition, diamondItemsModifier);