import crafttweaker.api.recipe.RecipeHolder;
import crafttweaker.api.recipe.type.CraftingRecipe;
import crafttweaker.api.ingredient.IIngredient;

craftingTable.remove(<item:naturescompass:naturescompass>);

val minecraftRecipes = craftingTable.getRecipesMatching((recipe as RecipeHolder<CraftingRecipe>) => {
    if(recipe.id.namespace != "minecraft") {
        return false;
    }
    
    val path = recipe.id.path;
    if(path == "jukebox" || path == "enchanting_table" || path == "diamond_block" || "smithing" in path) {
        return false;
    }

    val ingredients = recipe.value.ingredients;

    val found = false;
    for ingredient in ingredients {
        if(ingredient.matches(<item:minecraft:diamond>)) {
            found = true;
            print("diament - mc");
        }
    }

    return found;
});

for recipe in minecraftRecipes {
    print(recipe.id.toString());
    craftingTable.removeByName(recipe.id.toString());
}
