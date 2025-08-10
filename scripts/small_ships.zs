craftingTable.removeByModid("smallships");

craftingTable.addShaped("sail", <item:smallships:sail>, [
    [<tag:item:minecraft:wool>, <tag:item:minecraft:wool>, <tag:item:minecraft:wool>],
    [<tag:item:minecraft:wool>, <tag:item:minecraft:logs>, <tag:item:minecraft:wool>],
    [<item:minecraft:lead>, <tag:item:minecraft:logs>, <item:minecraft:lead>,]
]);

craftingTable.addShaped("cannon_ball", <item:smallships:cannon_ball>, [
    [<item:minecraft:iron_nugget>, <item:minecraft:iron_nugget>, <item:minecraft:iron_nugget>],
    [<item:minecraft:iron_nugget>, <item:minecraft:gunpowder>, <item:minecraft:iron_nugget>],
    [<item:minecraft:iron_nugget>, <item:minecraft:iron_nugget>, <item:minecraft:iron_nugget>],
]);

craftingTable.addShaped("cannon", <item:smallships:cannon>, [
    [<item:minecraft:air>, <item:minecraft:air>, <item:minecraft:string>],
    [<item:minecraft:iron_block>, <item:minecraft:iron_block>, <item:minecraft:iron_block>],
    [<item:minecraft:air>, <tag:item:minecraft:logs>, <tag:item:minecraft:logs>]
]);