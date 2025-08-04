import crafttweaker.api.loot.modifier.LootModifierManager;
import crafttweaker.api.loot.modifier.CommonLootModifiers;
import crafttweaker.api.loot.condition.LootConditions;
import crafttweaker.api.loot.condition.RandomChanceLootCondition;
//Global declarations
val allModifiersTable = loot.modifiers.getAll();

//Remove enchantments
val enchantRemoveModifier = CommonLootModifiers.remove(<item:minecraft:book>);
val enchantRemoveModifierName = "com.makrowave.remove_enchanted_book_modifier";
val enchantRemoveConditions = LootConditions.anyOf(RandomChanceLootCondition.create(1));
loot.modifiers.register(enchantRemoveModifierName, enchantRemoveConditions, enchantRemoveModifier);
