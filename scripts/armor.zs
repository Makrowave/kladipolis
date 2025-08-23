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
import crafttweaker.api.item.ItemDefinition;

//Definition of modifier builders
val slowHeadHeavy = ItemAttributeModifiers.builder()
    .add(<attribute:minecraft:generic.movement_speed>,
    AttributeModifier.create(<resource:minecraft:movement_speed.helmet>, -0.005, <constant:minecraft:attribute/operation:add_value>),
    <constant:minecraft:equipmentslot/group:head>).build();
val slowChestHeavy = ItemAttributeModifiers.builder()
    .add(<attribute:minecraft:generic.movement_speed>,
    AttributeModifier.create(<resource:minecraft:movement_speed.chest>, -0.01, <constant:minecraft:attribute/operation:add_value>),
    <constant:minecraft:equipmentslot/group:chest>).build();
val slowLegsHeavy = ItemAttributeModifiers.builder()
    .add(<attribute:minecraft:generic.movement_speed>,
        AttributeModifier.create(<resource:minecraft:movement_speed.leggings>, -0.015, <constant:minecraft:attribute/operation:add_value>),
        <constant:minecraft:equipmentslot/group:legs>).build();
val slowFeetHeavy = ItemAttributeModifiers.builder()
    .add(<attribute:minecraft:generic.movement_speed>,
    AttributeModifier.create(<resource:minecraft:movement_speed.boots>, -0.005, <constant:minecraft:attribute/operation:add_value>),
    <constant:minecraft:equipmentslot/group:feet>).build();


val slowHeadMedium = ItemAttributeModifiers.builder()
    .add(<attribute:minecraft:generic.movement_speed>,
    AttributeModifier.create(<resource:minecraft:movement_speed.helmet>, -0.0025, <constant:minecraft:attribute/operation:add_value>),
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
    AttributeModifier.create(<resource:minecraft:movement_speed.boots>, -0.0025, <constant:minecraft:attribute/operation:add_value>),
    <constant:minecraft:equipmentslot/group:feet>).build();


val slowHeadCuirassier = ItemAttributeModifiers.builder()
    .add(<attribute:minecraft:generic.movement_speed>,
    AttributeModifier.create(<resource:minecraft:movement_speed.helmet>, -0.005, <constant:minecraft:attribute/operation:add_value>),
    <constant:minecraft:equipmentslot/group:head>).build();
    
val slowChestCuirassier = ItemAttributeModifiers.builder()
    .add(<attribute:minecraft:generic.armor>,
    AttributeModifier.create(<resource:minecraft:armor.chestplate>, 10, <constant:minecraft:attribute/operation:add_value>),
    <constant:minecraft:equipmentslot/group:chest>)
    .add(<attribute:minecraft:generic.armor_toughness>,
    AttributeModifier.create(<resource:minecraft:armor.chestplate>, 6, <constant:minecraft:attribute/operation:add_value>),
    <constant:minecraft:equipmentslot/group:chest>)
    .add(<attribute:minecraft:generic.movement_speed>,
    AttributeModifier.create(<resource:minecraft:movement_speed.chest>, -0.025, <constant:minecraft:attribute/operation:add_value>),
    <constant:minecraft:equipmentslot/group:chest>)
    .build();

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
    ] as ItemDefinition[],
    "chest": [
        <item:magistuarmory:xivcenturyknight_chestplate>,
        <item:minecraft:iron_chestplate>,
        // <item:magistuarmory:maximilian_chestplate>,
        <item:magistuarmory:jousting_chestplate>,
        <item:magistuarmory:knight_chestplate>,
        <item:magistuarmory:gothic_chestplate>,
        <item:magistuarmory:kastenbrust_chestplate>,
        <item:magistuarmory:ceremonial_chestplate>

    ] as ItemDefinition[],
    "legs": [
        <item:magistuarmory:xivcenturyknight_leggings>,
        <item:minecraft:iron_leggings>,
        // <item:magistuarmory:maximilian_leggings>,
        <item:magistuarmory:jousting_leggings>,
        <item:magistuarmory:knight_leggings>,
        <item:magistuarmory:gothic_leggings>,
        <item:magistuarmory:kastenbrust_leggings>

    ] as ItemDefinition[],
    "feet": [
        <item:magistuarmory:xivcenturyknight_boots>,
        <item:minecraft:iron_boots>,
        // <item:magistuarmory:maximilian_boots>,
        <item:magistuarmory:jousting_boots>,
        <item:magistuarmory:knight_boots>,
        <item:magistuarmory:gothic_boots>,
        <item:magistuarmory:kastenbrust_boots>,
        <item:magistuarmory:ceremonial_boots>

    ] as ItemDefinition[]
};

var mediumArmor = {
    "head": [
        <item:magistuarmory:kettlehat>,
        <item:magistuarmory:chainmail_helmet>,
        <item:magistuarmory:norman_helmet>,
        <item:magistuarmory:shishak>,
        <item:magistuarmory:face_helmet>,
        <item:magistuarmory:greathelm>
    ] as ItemDefinition[],
    "chest": [
        <item:magistuarmory:platemail_chestplate>,
        <item:magistuarmory:chainmail_chestplate>,
        <item:magistuarmory:brigandine_chestplate>,
        <item:magistuarmory:crusader_chestplate>,
        <item:magistuarmory:lamellar_chestplate>
    ] as ItemDefinition[],
    "legs": [
        <item:magistuarmory:chainmail_leggings>,
        <item:magistuarmory:platemail_leggings>,
        <item:magistuarmory:crusader_leggings>

    ] as ItemDefinition[],
    "feet": [
        <item:magistuarmory:platemail_boots>
    ] as ItemDefinition[],
};

var cuirassArmor = {
    "head" : [
        <item:magistuarmory:cuirassier_helmet>
    ] as ItemDefinition[],
    "chest": [
        <item:magistuarmory:cuirassier_chestplate>
    ] as ItemDefinition[]
};


val replace as function(itemList as stdlib.List<ItemDefinition>, modifier as ItemAttributeModifiers) as void =
    (itemList as stdlib.List<IItemStack>, modifier as ItemAttributeModifiers) =>
{
    for item in itemList{
        for m in modifier.modifiers {
            item.addAttributeModifier(m.attribute, m.modifier, m.slot);    
        }
    }
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
