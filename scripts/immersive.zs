import crafttweaker.api.recipe.replacement.Replacer;
import crafttweaker.api.recipe.replacement.type.NameFilteringRule;
import crafttweaker.api.ingredient.IIngredient;


//Conveyor belt
craftingTable.remove(<item:immersiveengineering:conveyor_basic>);
craftingTable.addShaped("immersive/conveyor_cheap", <item:immersiveengineering:conveyor_basic>, [
[<item:immersiveengineering:ersatz_leather>,<item:immersiveengineering:ersatz_leather>,<item:immersiveengineering:ersatz_leather>],
[<tag:item:c:ingots/iron>,<item:immersiveengineering:wire_copper>,<tag:item:c:ingots/iron>]
]);
craftingTable.addShaped("immersive/conveyor_expensive", <item:immersiveengineering:conveyor_basic>*6, [
[<item:immersiveengineering:plate_duroplast>,<item:immersiveengineering:plate_duroplast>,<item:immersiveengineering:plate_duroplast>],
[<tag:item:c:ingots/iron>,<item:immersiveengineering:wire_copper>,<tag:item:c:ingots/iron>]
]);

// //Wire Cutters
craftingTable.remove(<item:immersiveengineering:wirecutter>);
craftingTable.addShaped("immersive/wirecutter", <item:immersiveengineering:wirecutter>, [
[<item:minecraft:air>,<tag:item:c:ingots/iron>,<item:minecraft:air>],
[<tag:item:c:rods/wooden>,<item:create:brass_nugget>,<tag:item:c:ingots/iron>],
[<item:minecraft:air>,<tag:item:c:rods/wooden>,<item:minecraft:air>]
]);

// LV - do naprawy
craftingTable.remove(<item:immersiveengineering:capacitor_lv>);
craftingTable.addJsonRecipe("immersive/capacitor_lv", {
"type": "immersiveengineering:shaped_fluid",
  "key": {
    "r": {
      "type": "immersiveengineering:fluid_stack",
      "amount": 1000,
      "tag": "c:redstone_acid"
    },
    "t": {
        "tag": "immersiveengineering:treated_wood"
    },
    "c": {
        "item": "immersiveengineering:coil_lv"
    },
    "p": {
        "tag": "c:plates/lead"
    }
  },
  "pattern": [
    "tpt",
    "crc",
    "tpt"
  ],
  "result": {
    "count": 1,
    "id": "immersiveengineering:capacitor_lv"
  }
});
// MV
craftingTable.remove(<item:immersiveengineering:capacitor_mv>);
craftingTable.addJsonRecipe("immersive/capacitor_mv", {
"type": "minecraft:crafting_shaped",
  "key": {
    "r": {
      "type": "immersiveengineering:fluid_stack",
      "amount": 1000,
      "tag": "c:redstone_acid"
    },
    "e": {
        "tag": "c:ingots/electrum"
    },
    "s": {
        "tag": "c:ingots/steel"
    },
    "p": {
        "tag": "c:plates/nickel"
    },
    "c": {
        "item": "immersiveengineering:capacitor_lv"
    }
  },
  "pattern": [
    "epe",
    "scs",
    "rpr"
  ],
  "result": {
    "count": 1,
    "id": "immersiveengineering:capacitor_mv"
  }
});
//HV
craftingTable.remove(<item:immersiveengineering:capacitor_hv>);
craftingTable.addJsonRecipe("immersive/capacitor_hv", {
"type": "minecraft:crafting_shaped",
  "key": {
    "r": {
      "type": "immersiveengineering:fluid_stack",
      "amount": 1000,
      "tag": "c:redstone_acid"
    },
    "g": {
        "tag": "c:ingots/hop_graphite"
    },
    "s": {
        "tag": "c:ingots/steel"
    },
    "p": {
        "tag": "c:plates/aluminum"
    },
    "c": {
        "item": "immersiveengineering:capacitor_mv"
    }
  },
  "pattern": [
    "gpg",
    "scs",
    "rpr"
  ],
  "result": {
    "count": 1,
    "id": "immersiveengineering:capacitor_hv"
  }
});

//Coke bricks
craftingTable.removeByName("immersiveengineering:crafting/cokebrick");
craftingTable.addShaped("immersive/cokebrick", <item:immersiveengineering:cokebrick>*3, [
[<item:immersiveengineering:coal_coke>,<item:minecraft:bricks>,<item:immersiveengineering:coal_coke>],
[<item:minecraft:bricks>,<item:minecraft:clay>,<item:minecraft:bricks>],
[<item:immersiveengineering:coal_coke>,<item:minecraft:bricks>,<item:immersiveengineering:coal_coke>]
]);

//Removal
// craftingTable.removeByName("immersiveengineering:crafting/component_steel");
// craftingTable.removeByName("immersiveengineering:crafting/component_iron");

craftingTable.remove(<item:immersiveengineering:hammer>);
