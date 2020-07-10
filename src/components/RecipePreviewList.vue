<template>
  <b-container>
    <h3 style="font-family: helloSunshine;">
      {{ title }}:
      <slot></slot>
    </h3>
    <div v-if="isSearch">
      <b-button-group size="sm">
        <b-button variant="light" v-on:click="timeSorting">time</b-button>
        <b-button v-on:click="popularitySorting" variant="light">popularity</b-button>
      </b-button-group>
    </div>
    <b-row v-for="r in recipes" :key="r.id">
      <RecipePreview :notFromAPIp="notFromAPI" class="recipePreview" :recipe="r"/>
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
    },
    searchQuery:{
      type: String,
      required: false
    },
    numberOfResult:{
      type: Number,
      required: false
    },
    cuisine:{
      type: String,
      required: false
    },
    diet:{
      type: String,
      required: false
    },
    intolerances:{
      type: String,
      required: false
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
    
    timeSorting(){
      this.recipes.sort(function (a, b) {
        return a.readyInMinutes - b.readyInMinutes;
      })
    },
    popularitySorting(){
        this.recipes.sort(function (a, b) {
        return b.aggregateLikes - a.aggregateLikes;
      })
    },
    test(){
      let a = 2;
    },
    async updateRecipes() {
      try {
        this.recipes = [];
        const type = this.$props.reqType;
        let res;
        let rcp;
        var response =[];
        response.data = [];

        if(type === "random"){
        response = await this.axios.get(
          "https://assignment3-3-alon-gal.herokuapp.com/recipes/getRandomRecipes/3"
        );
        } else if(type === "watched"){
          response = await this.axios.get(
          "https://assignment3-3-alon-gal.herokuapp.com/users/lastThreeWatched/"
          );
        } else if(type === "show"){
          res = await this.axios.get(
          "https://assignment3-3-alon-gal.herokuapp.com/users/getMyRecipes/"
          
        );
        for(let i = 0; i < res.data.myRecipes.length; i++){
          response.data.push(res.data.myRecipes[i]);
        }
        } else if(type === "search"){
          this.isSearch=true
          const number = this.$props.numberOfResult;
          const search = this.$props.searchQuery;
          const cusineSearch = this.$props.cuisine
          const dietSearch = this.$props.diet
          const intolerancesSearch = this.$props.intolerances
          var counter = 0
          var toSend = "https://assignment3-3-alon-gal.herokuapp.com/recipes/searchRecipes/query/" + search + "/" + number
          if(cusineSearch!=""|| dietSearch!="" || intolerancesSearch!=""){
            toSend=toSend+"?"
            if(cusineSearch!=""){
              toSend=toSend+"cuisine="+cusineSearch
              counter++
            }
            if(dietSearch!=""){
              if(counter!=0){
                toSend=toSend+"&"
              }
              toSend=toSend+"diet="+dietSearch
              counter++
            }
            if(intolerancesSearch!=""){
              if(counter!=0){
                toSend=toSend+"&"
              }
              toSend=toSend+"intolerances="+intolerancesSearch
            }
          }
          response = await this.axios.get(toSend);
        }        else if(type === "showFavorite"){
          res = await this.axios.get(
          "https://assignment3-3-alon-gal.herokuapp.com/users/favoritesId/"
          
        );
        for(let i = 0; i < res.data.favoriteRecipes.length; i++){
          rcp = await this.axios.get(
          "https://assignment3-3-alon-gal.herokuapp.com/recipes/getRecipe/" + res.data.favoriteRecipes[i]
        );
          response.data.push(rcp.data);
        }
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
