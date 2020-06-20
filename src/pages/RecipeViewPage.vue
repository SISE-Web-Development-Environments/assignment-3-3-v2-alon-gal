<template>
  <div class="container">
    <div v-if="recipe">
      <div class="text-center">
      
      </div>
      <div class="recipe-header mt-3 mb-4">
        <h1>{{ recipe.title }}</h1>
        <img :src="recipe.image" class="center" @load="onImgLoad" />
      </div>
      <div class="recipe-body">
        <div class="wrapper">
          <div class="wrapped">
            <div class="mb-3">
              <div>Ready in {{ recipe.readyInMinutes }} minutes</div>
              <div>Likes: {{ recipe.aggregateLikes }} likes</div>
            </div>Ingredients:
            <ul>
              <li
                v-for="(r, index) in recipe.Ingredients"
                :key="index + '_' + r.id"
              >{{ r.original }}</li>
            </ul>
          </div>Instructions:
          <div class="wrapped" v-html="recipe.instructions"></div>
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
        variant="outline-primary"
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
      recipe: null
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
      } catch {
        this.$root.toast(
          "Already added",
          "This recipe is already on your favorite list",
          "primary"
        );
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
/* .recipe-header{

} */
</style>
