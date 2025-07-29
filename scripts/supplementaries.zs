craftingTable.remove(<item:supplementaries:rope>);
craftingTable.remove(<item:supplementaries:rope_arrow>);
craftingTable.remove(<item:supplementaries:cannon>);
craftingTable.remove(<item:supplementaries:lumisene_bottle>);
craftingTable.remove(<item:supplementaries:lumisene_bucket>);
craftingTable.remove(<item:supplementaries:slingshot>);
craftingTable.removeByName("supplementaries:rope_arrow_create");
craftingTable.removeByName("supplementaries:rope_arrow_add");

import mods.jei.JEI;
JEI.hide("supplementaries:rope_arrow_create_display");
JEI.hide("supplementaries:rope_arrow_add_display");
