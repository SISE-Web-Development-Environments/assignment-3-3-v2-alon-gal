<template>
<div class="recipe-preview">
  <router-link :to="{name: 'recipe', params:{recipeId: recipe.id, notFromAPIp: notFromAPIp}}" >
    <div  class="recipe-body" v-b-tooltip.hover title="View Recipe">
      <div class="text-center">
        <b-spinner v-if="!isLoaded" variant="primary" label="Text Centered"></b-spinner>
      </div>
      <img :src="recipe.image" class="recipe-image" @load="onImgLoad" />
    </div>
    <div class="recipe-footer">
      <h5>{{ recipe.title }}</h5>
      <img class="icon" src="../assets/clock.png" />
      Duration: {{ recipe.readyInMinutes }}
      <div style="float: right; margin-right: 10px ;">
      <img class="icon" src="../assets/like.png"  />
      Likes: {{recipe.aggregateLikes}}
      </div>
      <br />
      <div v-if="recipe.glutenFree">
        <img class="icon" src="../assets/glutenfree.png" /> Gluten Free
      </div>
      <div v-if="recipe.vegetarian">
        <img class="icon" src="../assets/vegetarian.png" /> Vegetarian
      </div>
      <div v-if="recipe.vegan">
        <img class="icon" src="../assets/vegan.png" /> Vegan
      </div>
    </div>
    </router-link>
    <div class="recipe-icons">
      <img v-if="isFavorite && $root.store.username" v-b-tooltip.hover title="Favorite Recipe" src="../assets/star2.png" class="star">
      <img v-else-if="!isFavorite && $root.store.username && notFromAPIp != 'true'" v-b-tooltip.hover title="Add to Favorites" src="../assets/star.png" class="star" @click="addToFavorites">
      <img v-if="isWatched" v-b-tooltip.hover title="Watched Recipe" src="../assets/watched.png" class="star">
      </div>
  
</div>
</template>

<script>
export default {
  data() {
    return {
      isLoaded: false,
      isFavorite: false,
      isWatched: false
    };
  },
  props: {
    recipe: {
      image: {
        type: String,
        required: false,
        default: function() {
          return { image: "../assets/nophoto.png" };
        }
      },
      title: {
        type: String,
        required: true
      },
      readyInMinutes: {
        type: Number,
        required: true
      },
      vegetarian: {
        type: Boolean,
        required: true
      },
      vegan: {
        type: Boolean,
        required: true
      },
      glutenFree: {
        type: Boolean,
        required: true
      },
      id: {
        type: Number
      },
      aggregateLikes:{
        type: Number,
        required: true
      }
    },
    notFromAPIp:{
      type: String
    }
  },
  mounted() {
    this.checkIfFavorite();
    this.checkIfWatched();
  },
  methods: {
    onImgLoad() {
      this.isLoaded = true;
    },
    async checkIfFavorite() {

      let  a= this.$props.notFromAPIp;
      if(a == true){

      }
      if (this.$root.store.username) {
        let response = await this.axios.get(
          "https://assignment3-3-alon-gal.herokuapp.com/users/favoritesId"
        );
        let rcpid = this.$props.recipe.id;
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
          "https://assignment3-3-alon-gal.herokuapp.com/users/watched"
        );
        let rcpid = this.$props.recipe.id;
        for (let i = 0; i < response.data.myRecipes.length; i++) {
          if (response.data.myRecipes[i] == rcpid) {
            this.isWatched = true;
          }
        }
      }
    },
    async addToFavorites() {
      try {
        await this.axios.post(
          "https://assignment3-3-alon-gal.herokuapp.com/users/favorites",
          {
            recipe_id: this.$props.recipe.id
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
    }
  }
};
</script>

<style scope>
.recipe-preview .recipe-body .recipe-image {
  position: center;
  width: 100%;
  height: 100%;
  position: absolute;
  top: 0;
  left: 0;
  cursor: pointer;
}
.recipe-preview {
  display: inline-block;
  width: 260px;
  border: 1px solid #ccbba5;
  position: relative;
  margin: 10px 10px;
  -webkit-border-radius: 10px;
  border-radius: 10px;
}
.recipe-preview .recipe-body {
  width: 100%;
  height: 150px;
  position: relative;
  cursor: pointer;
}

.recipe-preview .recipe-body .text-center {
  text-align: center;
  width: 100%;
  height: 100%;
  display: inline-block;
  position: absolute;
}

.recipe-preview .recipe-footer{
  background-color: #FFFACD;
}

.recipe-icons{
background-color: #FFFACD;
text-align: right;

}

.icon {
  height: 23px;
  width: 23px;
  position: relative;
}

.star {
  height: 45px;
  width: 45px;
  position:initial;
  cursor: pointer;
}


</style>
