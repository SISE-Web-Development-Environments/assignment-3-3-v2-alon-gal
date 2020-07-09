<template>
  <div class="container">
       <RecipeFamaliyPreviewList notFromAPI = "true" title="My Family Recipes" class="ShowRecipes" />
  </div>
</template>

<script>
import RecipeFamaliyPreviewList from "../components/RecipeFamaliyPreviewList";
export default {
  
  name: "MyRecipesPage",
    components: {
    RecipeFamaliyPreviewList
  }
};
</script>
<style lang="scss" scoped>
</style>
