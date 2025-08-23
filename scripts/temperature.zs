var cooling_armor = [
    <item:magistuarmory:greathelm>,
    <item:magistuarmory:crusader_chestplate>,
    <item:magistuarmory:crusader_leggings>,
    <item:magistuarmory:crusader_boots>,
    
    <item:magistuarmory:chainmail_helmet>,
    <item:magistuarmory:chainmail_chestplate>,
    <item:magistuarmory:chainmail_leggings>,

    <item:magistuarmory:platemail_chestplate>,
    <item:magistuarmory:platemail_leggings>,

    <item:magistuarmory:rustedchainmail_helmet>,
    <item:magistuarmory:rustedchainmail_chestplate>,
    <item:magistuarmory:rustedchainmail_leggings>
];

var heating_armor = [
    <item:magistuarmory:brigandine_chestplate>,
    <item:magistuarmory:cuirassier_leggings>,
    <item:magistuarmory:cuirassier_boots>,

    <item:magistuarmory:coif>,
    <item:magistuarmory:gambeson_chestplate>,
    <item:magistuarmory:pantyhose>,
    <item:magistuarmory:gambeson_boots>,

    <item:magistuarmory:maximilian_helmet>,
    <item:magistuarmory:maximilian_chestplate>,
    <item:magistuarmory:maximilian_leggings>,
    <item:magistuarmory:maximilian_boots>
];

for armor in heating_armor {
    <tag:item:toughasnails:heating_armor>.add(armor);
}


for armor in cooling_armor {
    <tag:item:toughasnails:cooling_armor>.add(armor);
}




