import crafttweaker.api.item.component.ItemAttributeModifiers;
import crafttweaker.api.entity.attribute.AttributeModifier;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.recipe.RecipeHolder;
import crafttweaker.api.recipe.type.Recipe;
import crafttweaker.api.world.Container;
import crafttweaker.api.recipe.input.RecipeInput;
import crafttweaker.api.recipe.replacement.type.NameFilteringRule;
import crafttweaker.api.recipe.replacement.Replacer;
import crafttweaker.api.ingredient.IIngredientWithAmount;
import crafttweaker.api.item.component.ItemAttributeModifiersBuilder;
import crafttweaker.api.entity.equipment.EquipmentSlot;
//Definition of modifier builders
val slow_chest = ItemAttributeModifiers.builder()
    .add(<attribute:minecraft:generic.movement_speed>,
    AttributeModifier.create(<resource:minecraft:movement_speed.chest>, -0.01, <constant:minecraft:attribute/operation:add_value>),
    <constant:minecraft:equipmentslot/group:chest>);
val slow_leggings = ItemAttributeModifiers.builder()
    .add(<attribute:minecraft:generic.movement_speed>,
        AttributeModifier.create(<resource:minecraft:movement_speed.leggings>, -0.02, <constant:minecraft:attribute/operation:add_value>),
        <constant:minecraft:equipmentslot/group:legs>);
val slow_boots = ItemAttributeModifiers.builder()
    .add(<attribute:minecraft:generic.movement_speed>,
    AttributeModifier.create(<resource:minecraft:movement_speed.boots>, -0.01, <constant:minecraft:attribute/operation:add_value>),
    <constant:minecraft:equipmentslot/group:feet>);

//Definition of items to receive modifiers in certain groups
var heavyArmor = {
    "head": [
        <item:magistuarmory:bascinet>
    ],
    "chest": [
        <item:magistuarmory:xivcenturyknight_chestplate>,
        <item:minecraft:iron_chestplate>
    ],
    "legs": [
        <item:magistuarmory:xivcenturyknight_leggings>
    ],
    "feet": [
        <item:magistuarmory:xivcenturyknight_boots>
    ]
};

/**
    Takes list of IItemStack as input and returns list of recipeIds.
*/
val getRecipeNames as function(itemList as stdlib.List<IItemStack>) as stdlib.List<string> = 
    (itemList as stdlib.List<IItemStack>) => 
{
    var recipes = new stdlib.List<RecipeHolder<Recipe<RecipeInput>>>();
    for item in itemList {
        var tempRecipes = craftingTable.getRecipesByOutput(item) as stdlib.List<RecipeHolder<Recipe<RecipeInput>>>;
        for recipe in tempRecipes {
            recipes.add(recipe);
        }
    }
    var strings = new stdlib.List<string>;
    for r in recipes {
        strings.add(r.id.toString());
    }
    return strings;
};

/**
    Takes list of IItemStack and modifier builder(!) as inputs.
    For every item:
        reads and determines type of modifiers,
        adds them to builder
        builds the modifiers and applies to item
        creates pair of prev item and item with effect
    Returns pair of [prevItem as IItemStack, modifiedItem as IItemStack].
*/
val getReplacementPairs as function(itemList as stdlib.List<IItemStack>, modifier as ItemAttributeModifiersBuilder) as stdlib.List<stdlib.List<IItemStack>> =
    (itemList as stdlib.List<IItemStack>, modifier as ItemAttributeModifiersBuilder) => 
{
    //All possible armor slots
    val slotsPossible = [
        <constant:minecraft:equipmentslot:head>,
        <constant:minecraft:equipmentslot:chest>,
        <constant:minecraft:equipmentslot:legs>,
        <constant:minecraft:equipmentslot:feet>
    ] as EquipmentSlot[];
    var result = new stdlib.List<stdlib.List<IItemStack>>;
    for item in itemList {
        var pair = new stdlib.List<IItemStack>;
        val slotGroup = modifier.build().modifiers[0].slot;
        //For every slot possible for armor do application of modifiers
        for slot in slotsPossible {
            var attrs = item.getAttributes(slot);
            for key, value in attrs {
                for attr in value {
                    modifier.add(
                        key,
                        attr,
                        slotGroup);
                }
            }
        }

        val builtMod = modifier.build();
        
        val editedItem = item.withAttributeModifiers(builtMod);
        pair.add(item);
        pair.add(editedItem);
        result.add(pair);
    }
    return result;
};

/**
    Takes list of items, does modifier replacements, filters recipes for them
    and finally modifies the recipes so they result in modified item.
*/
val replace as function(itemList as stdlib.List<IItemStack>, modifier as ItemAttributeModifiersBuilder) as void =
    (itemList as stdlib.List<IItemStack>, modifier as ItemAttributeModifiersBuilder) =>
{
    val filteringRule = NameFilteringRule.anyOf(getRecipeNames(itemList));
    val itemPairs = getReplacementPairs(itemList, modifier);
    var replacer = Replacer
        .create()
        .filter(filteringRule);
    for pair in itemPairs {
        replacer.replace<IItemStack>(<recipecomponent:crafttweaker:output/items>, pair[0], pair[1]);
    }
    replacer.execute();
};

//Replacements
replace(heavyArmor["chest"], slow_chest);
replace(heavyArmor["legs"], slow_leggings);
replace(heavyArmor["feet"], slow_boots);



    


