<template>
  <div class="container">
    <div v-if="recipe">
      <div class="text-center">
      
      </div>
      <div class="recipe-header mt-3 mb-4">
        <h1 class="title">{{ recipe.title }}</h1>
        <img :src="recipe.image" class="center" @load="onImgLoad" />
        <img v-if="isFavorite" v-b-tooltip.hover title="Favorite Recipe" src="../assets/star2.png" style="display: inline-block;" class="star">
        <img v-if="isWatched" v-b-tooltip.hover title="Watched Recipe" src="../assets/watched.png" class="star">
      </div>
                    <b-container fluid class="bv-example-row">
                  <b-row>
                    <b-col class="bcol"><img class="icon" src="../assets/clock.png" style="  margin-right: 6px;" />Ready in {{ recipe.readyInMinutes }} minutes</b-col>
                    <b-col class="bcol"><img class="icon" src="../assets/like.png" style="  margin-right: 6px;" />Likes: {{ recipe.aggregateLikes }} likes</b-col>
                    <b-col class="bcol" v-if="recipe.glutenFree"><img class="icon" src="../assets/glutenfree.png" /> Gluten Free</b-col>
                    <b-col class="bcol" v-if="recipe.vegetarian"><img class="icon" src="../assets/vegetarian.png" /> Vegetarian</b-col>
                    <b-col class="bcol" v-if="recipe.vegan"><img class="icon" src="../assets/vegan.png" /> Vegan</b-col>
                    </b-row>
              </b-container>
      <div class="recipe-body">
        <div class="wrapper">
          <div class="wrapped" style="margin-right: 10px;">
            <b>Ingredients:</b><br><br>
            <ul>
              <li
                v-for="(r, index) in recipe.Ingredients"
                :key="index + '_' + r.id"
              >{{ r.original }}</li>
            </ul>
          </div>
          <div class="wrapped"><b>Instructions:</b><br><br>
          <div v-html="recipe.instructions" style="width: 100%; padding-left: 20px; padding-right: 20px;"></div>
          </div>
        </div>
      </div>
      <!-- <pre>
      {{ $route.params }}
      {{ recipe }}
    </pre
      >-->
    </div>
    <div class="options">
        <b-spinner v-if="!isLoaded" variant="primary" label="Text Centered"></b-spinner>
      <b-button
        v-else-if="$root.store.username"
        variant="warning"
        v-on:click="addToFavorites(recipe.id)"
      >
        <b-icon icon="star"></b-icon>Add to Favorites
      </b-button>
    </div>
  </div>
</template>

<script>
export default {
  mounted() {
    if(!this.recipe){
      return;
    }
    this.axios.get(this.recipe.image).then(i => {
      this.image_load = true;
    });

  },
  data() {
    return {
      isLoaded: false,
      recipe: null,
      isFavorite: false,
      isWatched: false
    };
  },
  async created() {
    try {
      let response;
      // response = this.$route.params.response;

      try {
        const id = this.$route.params.recipeId;
        response = await this.axios.get(
          "https://assignment3-3-alon-gal.herokuapp.com/recipes/getRecipe/" + id
        );
        if (this.$root.store.username) {
          await this.axios.post(
            "https://assignment3-3-alon-gal.herokuapp.com/users/watched",
            {
              userName: this.$root.store.username,
              recipe_id: id
            }
          );
          await this.axios.post(
            "https://assignment3-3-alon-gal.herokuapp.com/users/lastThreeWatched",
            {
              userName: this.$root.store.username,
              recipe_id: id
            }
          );
        }
        // console.log("response.status", response.status);
        if (response.status !== 200) this.$router.replace("/NotFound");
      } catch (error) {
        console.log("error.response.status", error.response.status);
        this.$router.replace("/NotFound");
        return;
      }

      let {
        id,
        instructions,
        Ingredients,
        aggregateLikes,
        readyInMinutes,
        image,
        title,
        vegan,
        vegetarian,
        glutenFree,
        servings,
        favorited,
        watched
      } = response.data;

      let _recipe = {
        id,
        instructions,
        Ingredients,
        aggregateLikes,
        readyInMinutes,
        image,
        title,
        vegan,
        vegetarian,
        glutenFree,
        servings,
        favorited,
        watched
      };

      this.recipe = _recipe;
    this.checkIfFavorite();
    this.checkIfWatched();
    } catch (error) {
      console.log(error);
    }
  },

  methods: {
    onImgLoad() {
      this.isLoaded = true;
    },
    async addToFavorites(rcpid) {
      try {
        await this.axios.post(
          "https://assignment3-3-alon-gal.herokuapp.com/users/favorites",
          {
            userName: this.$root.store.username,
            recipe_id: rcpid
          }
        );
        this.$root.toast(
          "Added to Favorites",
          "Recipe added successfully to your favorite list!",
          "warning"
        );
        this.isFavorite = true;
      } catch {
        this.$root.toast(
          "Already added",
          "This recipe is already on your favorite list",
          "primary"
        );
      }
    },
        async checkIfFavorite() {
      if (this.$root.store.username) {
        let response = await this.axios.get(
          "https://assignment3-3-alon-gal.herokuapp.com/users/favoritesId/" +
            this.$root.store.username
        );
        let rcpid = this.recipe.id;
        for (let i = 0; i < response.data.favoriteRecipes.length; i++) {
          if (response.data.favoriteRecipes[i] == rcpid) {
            this.isFavorite = true;
          }
        }
      }
    },
        async checkIfWatched() {
      if (this.$root.store.username) {
        let response = await this.axios.get(
          "https://assignment3-3-alon-gal.herokuapp.com/users/watched/" +
            this.$root.store.username
        );
        let rcpid = this.recipe.id;
        for (let i = 0; i < response.data.myRecipes.length; i++) {
          if (response.data.myRecipes[i] == rcpid) {
            this.isWatched = true;
          }
        }
      }
    }
  }
};
</script>

<style scoped>
.wrapper {
  display: flex;
}
.wrapped {
  width: 50%;
  border-radius: 5px 5px 5px 5px;
  border: 3px double black;
  margin-bottom: 20px;
    background-color: #E6E6FA;

}
.center {
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 50%;
}
.container .options {
  align-content: center;
  text-align: center;
  height: 100px;
}
.bv-example-row {

  text-align: center;
  border-radius: 5px 5px 5px 5px;
  border: 3px double black;
  margin-bottom: 20px;
    background-color: #E6E6FA;
}

.bcol{
  margin-top: 15px;
  margin-bottom: 15px;
    font-weight: bold;
}

.icon {
  height: 30px;
  width: 30px;
  position: relative;
}

.title{
   font: italic 1.2em "Fira Sans", serif; 
   font-size: 50px;
   font-weight: bold;
   margin-bottom: 30px;
}

</style>
