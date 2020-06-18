<template>
  <b-container>
    <h3>
      {{ title }}:
      <slot></slot>
    </h3>
    <b-row v-for="r in recipes" :key="r.id">
      <RecipePreview class="recipePreview" :recipe="r" />
    </b-row>
  </b-container>
</template>

<script>
import RecipePreview from "./RecipePreview.vue";
export default {
  name: "RecipePreviewList",
  components: {
    RecipePreview
  },
  props: {
    title: {
      type: String,
      required: true
    },
    reqType: {
      type: String,
      required: true
    }
  },
  data() {
    return {
      recipes: []
    };
  },
  mounted() {
    this.updateRecipes();
  },
  methods: {
    async updateRecipes() {
      try {

        const type = this.$props.reqType;

        var response;

        if(type === "random"){
        response = await this.axios.get(
          "https://assignment3-3-alon-gal.herokuapp.com/recipes/getRandomRecipes/3"
        );
        } else if(type === "watched"){
          const user = this.$root.store.username;
          response = await this.axios.get(
          "https://assignment3-3-alon-gal.herokuapp.com/users/lastThreeWatched/" + user
          );
        }
        
        // console.log(response);
        const recipes = response.data;
        this.recipes.push(...recipes);
        // console.log(this.recipes);
      } catch (error) {
        console.log(error);
      }
    }
  }
};
</script>

<style lang="scss" scoped>
.container {
  min-height: 400px;
}
</style>
