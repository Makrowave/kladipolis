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
val slowHeadHeavy = ItemAttributeModifiers.builder()
    .add(<attribute:minecraft:generic.movement_speed>,
    AttributeModifier.create(<resource:minecraft:movement_speed.helmet>, -0.01, <constant:minecraft:attribute/operation:add_value>),
    <constant:minecraft:equipmentslot/group:head>).build();
val slowChestHeavy = ItemAttributeModifiers.builder()
    .add(<attribute:minecraft:generic.movement_speed>,
    AttributeModifier.create(<resource:minecraft:movement_speed.chest>, -0.01, <constant:minecraft:attribute/operation:add_value>),
    <constant:minecraft:equipmentslot/group:chest>).build();
val slowLegsHeavy = ItemAttributeModifiers.builder()
    .add(<attribute:minecraft:generic.movement_speed>,
        AttributeModifier.create(<resource:minecraft:movement_speed.leggings>, -0.02, <constant:minecraft:attribute/operation:add_value>),
        <constant:minecraft:equipmentslot/group:legs>).build();
val slowFeetHeavy = ItemAttributeModifiers.builder()
    .add(<attribute:minecraft:generic.movement_speed>,
    AttributeModifier.create(<resource:minecraft:movement_speed.boots>, -0.01, <constant:minecraft:attribute/operation:add_value>),
    <constant:minecraft:equipmentslot/group:feet>).build();


val slowHeadMedium = ItemAttributeModifiers.builder()
    .add(<attribute:minecraft:generic.movement_speed>,
    AttributeModifier.create(<resource:minecraft:movement_speed.helmet>, -0.005, <constant:minecraft:attribute/operation:add_value>),
    <constant:minecraft:equipmentslot/group:head>).build();
val slowChestMedium = ItemAttributeModifiers.builder()
    .add(<attribute:minecraft:generic.movement_speed>,
    AttributeModifier.create(<resource:minecraft:movement_speed.chest>, -0.005, <constant:minecraft:attribute/operation:add_value>),
    <constant:minecraft:equipmentslot/group:chest>).build();
val slowLegsMedium = ItemAttributeModifiers.builder()
    .add(<attribute:minecraft:generic.movement_speed>,
        AttributeModifier.create(<resource:minecraft:movement_speed.leggings>, -0.01, <constant:minecraft:attribute/operation:add_value>),
        <constant:minecraft:equipmentslot/group:legs>).build();
val slowFeetMedium = ItemAttributeModifiers.builder()
    .add(<attribute:minecraft:generic.movement_speed>,
    AttributeModifier.create(<resource:minecraft:movement_speed.boots>, -0.005, <constant:minecraft:attribute/operation:add_value>),
    <constant:minecraft:equipmentslot/group:feet>).build();


val slowHeadCuirassier = ItemAttributeModifiers.builder()
    .add(<attribute:minecraft:generic.movement_speed>,
    AttributeModifier.create(<resource:minecraft:movement_speed.helmet>, -0.005, <constant:minecraft:attribute/operation:add_value>),
    <constant:minecraft:equipmentslot/group:head>).build();
val slowChestCuirassier = ItemAttributeModifiers.builder()
    .add(<attribute:minecraft:generic.movement_speed>,
    AttributeModifier.create(<resource:minecraft:movement_speed.chest>, -0.03, <constant:minecraft:attribute/operation:add_value>),
    <constant:minecraft:equipmentslot/group:chest>).build();

//Definition of items to receive modifiers in certain groups
var heavyArmor = {
    "head": [
        <item:magistuarmory:bascinet>,
        <item:minecraft:iron_helmet>,
        // <item:magistuarmory:maximilian_helmet>,
        <item:magistuarmory:stechhelm>,
        <item:magistuarmory:armet>,
        <item:magistuarmory:sallet>,
        <item:magistuarmory:grand_bascinet>,
        <item:magistuarmory:ceremonialarmet>
    ],
    "chest": [
        <item:magistuarmory:xivcenturyknight_chestplate>,
        <item:minecraft:iron_chestplate>,
        // <item:magistuarmory:maximilian_chestplate>,
        <item:magistuarmory:jousting_chestplate>,
        <item:magistuarmory:knight_chestplate>,
        <item:magistuarmory:gothic_chestplate>,
        <item:magistuarmory:kastenbrust_chestplate>,
        <item:magistuarmory:ceremonial_chestplate>

    ],
    "legs": [
        <item:magistuarmory:xivcenturyknight_leggings>,
        <item:minecraft:iron_leggings>,
        // <item:magistuarmory:maximilian_leggings>,
        <item:magistuarmory:jousting_leggings>,
        <item:magistuarmory:knight_leggings>,
        <item:magistuarmory:gothic_leggings>,
        <item:magistuarmory:kastenbrust_leggings>

    ],
    "feet": [
        <item:magistuarmory:xivcenturyknight_boots>,
        <item:minecraft:iron_boots>,
        // <item:magistuarmory:maximilian_boots>,
        <item:magistuarmory:jousting_boots>,
        <item:magistuarmory:knight_boots>,
        <item:magistuarmory:gothic_boots>,
        <item:magistuarmory:kastenbrust_boots>,
        <item:magistuarmory:ceremonial_boots>

    ]
};

var mediumArmor = {
    "head": [
        <item:magistuarmory:kettlehat>,
        <item:magistuarmory:chainmail_helmet>,
        <item:magistuarmory:norman_helmet>,
        <item:magistuarmory:shishak>,
        <item:magistuarmory:face_helmet>,
        <item:magistuarmory:greathelm>
    ],
    "chest": [
        <item:magistuarmory:platemail_chestplate>,
        <item:magistuarmory:chainmail_chestplate>,
        <item:magistuarmory:brigandine_chestplate>,
        <item:magistuarmory:crusader_chestplate>,
        <item:magistuarmory:lamellar_chestplate>
    ],
    "legs": [
        <item:magistuarmory:chainmail_leggings>,
        <item:magistuarmory:platemail_leggings>,
        <item:magistuarmory:crusader_leggings>

    ],
    "feet": [
        <item:magistuarmory:platemail_boots>
    ],
};

var cuirassArmor = {
    "head" : [
        <item:magistuarmory:cuirassier_helmet>
    ],
    "chest": [
        <item:magistuarmory:cuirassier_chestplate>
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
    Well doesn't take list but does the same just to singular one
    Takes list of IItemStack and modifier as inputs.
    For every item:
        reads and determines type of modifiers,
        adds them to builder
        builds the modifiers and applies to item
        creates pair of prev item and item with effect
    Returns pair of [prevItem as IItemStack, modifiedItem as IItemStack].
*/
public function getReplacementPair(item as IItemStack, modifier as ItemAttributeModifiers) as stdlib.List<IItemStack>
{
    //All possible armor slots
    val slotsPossible = [
        <constant:minecraft:equipmentslot:head>,
        <constant:minecraft:equipmentslot:chest>,
        <constant:minecraft:equipmentslot:legs>,
        <constant:minecraft:equipmentslot:feet>
    ] as EquipmentSlot[];
    var modifierBuilder = ItemAttributeModifiers.builder();
    val modEntry = modifier.modifiers;
    for entry in modEntry {
        modifierBuilder.add(entry.attribute, entry.modifier, entry.slot);
    }
    var pair = new stdlib.List<IItemStack>;
    val slotGroup = modifierBuilder.build().modifiers[0].slot;
    //For every slot possible for armor do application of modifiers
    for slot in slotsPossible {
        var attrs = item.getAttributes(slot);
        for key, value in attrs {
            for attr in value {
                modifierBuilder.add(
                    key,
                    attr,
                    slotGroup);
            }
        }
    }

    var builtMod = modifierBuilder.build();
    val editedItem = item.withAttributeModifiers(builtMod);
    pair.add(item);
    pair.add(editedItem);
    return pair;
}

public function getReplacementPairs(itemList as stdlib.List<IItemStack>, modifier as ItemAttributeModifiers) as stdlib.List<stdlib.List<IItemStack>>
{
    var result = new stdlib.List<stdlib.List<IItemStack>>;
    for item in itemList {
        result.add(getReplacementPair(item, modifier));
    }
    return result;
}

/**
    Takes list of items, does modifier replacements, filters recipes for them
    and finally modifies the recipes so they result in modified item.
*/
val replace as function(itemList as stdlib.List<IItemStack>, modifier as ItemAttributeModifiers) as void =
    (itemList as stdlib.List<IItemStack>, modifier as ItemAttributeModifiers) =>
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
replace(heavyArmor["head"], slowHeadHeavy);
replace(heavyArmor["chest"], slowChestHeavy);
replace(heavyArmor["legs"], slowLegsHeavy);
replace(heavyArmor["feet"], slowFeetHeavy);

replace(mediumArmor["head"], slowHeadMedium);
replace(mediumArmor["chest"], slowChestMedium);
replace(mediumArmor["legs"], slowLegsMedium);
replace(mediumArmor["feet"], slowFeetMedium);

replace(cuirassArmor["head"], slowHeadCuirassier);
replace(cuirassArmor["chest"], slowChestCuirassier);


