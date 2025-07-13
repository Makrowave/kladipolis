//Mechanical belt
craftingTable.remove(<item:create:belt_connector>);
craftingTable.addShaped("create/mechanical_belt", <item:create:belt_connector>, [
[<item:immersiveengineering:plate_duroplast>,<item:immersiveengineering:plate_duroplast>,<item:immersiveengineering:plate_duroplast>],
[<item:immersiveengineering:plate_duroplast>,<item:immersiveengineering:plate_duroplast>,<item:immersiveengineering:plate_duroplast>]
]);

//Superglue
craftingTable.remove(<item:create:super_glue>);
craftingTable.addShaped("create/super_glue", <item:create:super_glue>, [
[<item:create:iron_sheet>,      <item:minecraft:slime_block>,<item:create:iron_sheet>],
[<item:minecraft:slime_block>,  <item:minecraft:slime_block>,<item:minecraft:slime_block>],
[<item:minecraft:iron_nugget>,  <item:minecraft:slime_block>,<item:create:iron_sheet>]
]);

//Removal
craftingTable.remove(<item:create:mechanical_roller>);
craftingTable.remove(<item:create:mechanical_plough>);
craftingTable.remove(<item:create:mechanical_harvester>);
craftingTable.remove(<item:create:mechanical_saw>);
craftingTable.remove(<item:create:mechanical_drill>);

//Recipe removal only
<recipetype:create:mixing>.remove(<item:create:brass_ingot>);

<recipetype:create:mixing>.remove(<item:create:crafting/materials/andesite_alloy>);
<recipetype:create:mixing>.remove(<item:create:crafting/materials/andesite_alloy_from_zinc>);