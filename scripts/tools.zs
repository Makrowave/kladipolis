//Pickaxe imports
import crafttweaker.api.item.component.Tool;
import crafttweaker.api.item.component.ToolRule;

//Pickaxe steel

val pickaxeRule = [
    ToolRule.minesAndDrops(<tag:block:minecraft:mineable/pickaxe>, 9),
    ToolRule.minesAndDrops(<tag:block:minecraft:needs_iron_tool>, 9),
    ToolRule.minesAndDrops(<tag:block:minecraft:needs_diamond_tool>, 9)
];

val pickaxeTool = Tool.of(pickaxeRule, 9 , 1);

<item:immersiveengineering:pickaxe_steel>.definition.tool = pickaxeTool;