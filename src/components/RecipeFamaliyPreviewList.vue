<template>
  <b-container>
    <h1 style="font-family: helloSunshine;">
      {{ title }}:
      <slot></slot>
      
    </h1>
    <b-row v-for="r in recipes" :key="r.id">
      <FamaliyRecipe :notFromAPIp="notFromAPI"  class="recipePreview" :recipe="r"/>
    </b-row>
  </b-container>
</template>

<script>
import FamaliyRecipe from "./FamaliyRecipe.vue";
export default {
  name: "RecipePreviewList",
  components: {
    FamaliyRecipe
  },
  props: {
    title: {
      type: String,
      required: true
    },
    notFromAPI:{
      type: String
    }
  },
  data() {
    return {
      isSearch:false,
      recipes: []
    };
  },
  mounted() {
    this.updateRecipes();
  },
  methods: {
    async updateRecipes() {
      try {
        this.recipes = [];
        let res;
        var response =[];
        response.data = [];


        res = await this.axios.get(
            "https://assignment3-3-alon-gal.herokuapp.com/users/family/"
          );
        for(let i = 0; i < res.data.myRecipes.length; i++){
          response.data.push(res.data.myRecipes[i]);
        }
               

        const recipes = response.data;

        this.recipes.push(...recipes);
        if(this.recipes.length==0){
          alert("no result were found")
        }
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
