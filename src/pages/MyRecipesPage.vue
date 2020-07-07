<template>
  <div class="container">
      <RecipePreviewList notFromAPI = "true" reqType = "show" title="My Recipes" class="ShowRecipes"  />
  </div>
</template>

<script>
import RecipePreviewList from "../components/RecipePreviewList";
export default {
  
  name: "MyRecipesPage",
    components: {
    RecipePreviewList
  }
};

</script>
<style lang="scss" scoped>
</style>
