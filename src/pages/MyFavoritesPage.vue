<template>
  <div class="container">
       <RecipePreviewList reqType = "showFavorite" title="My Favorites" class="ShowRecipes" />
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
