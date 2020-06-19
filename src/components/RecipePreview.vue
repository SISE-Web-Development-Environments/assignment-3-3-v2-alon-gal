<template>
<router-link :to="{name: 'recipe', params:{recipeId: recipe.id}}" class="recipe-preview">
    <div class="recipe-body">
              <div class="text-center">
                  <b-spinner v-if="!isLoaded"  variant="primary" label="Text Centered"></b-spinner>
              </div>
          <img :src="recipe.image" class="recipe-image" @load="onImgLoad">

    </div>
    <div class="recipe-footer">
      <h5> {{ recipe.title }} </h5>
      <img class="icon" src="../assets/clock.png"> Duration: {{ recipe.readyInMinutes }}<br>
      <div v-if="recipe.glutenFree">
      <img  class="icon" src="../assets/glutenfree.png"> Gluten Free
      </div>
      <div v-if="recipe.vegetarian">
        <img  class="icon" src="../assets/vegetarian.png"> Vegetarian
      </div>
      <div v-if="recipe.vegan">
        <img  class="icon" src="../assets/vegan.png"> Vegan
      </div>
      <br>
    </div>
</router-link>
</template>

<script>
export default {
  mounted() {
    this.axios.get(this.recipe.image).then(i => {
      this.image_load = true;
    });
  },
  data() {
    return {
      isLoaded: false
    };
  },
  props: {
    recipe: {
      image: {
      type: String,
      required: false,
      default: function () {
        return { image: "../assets/nophoto.png" }
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
    vegetarian:{
      type: String,
      required: true
    },
    vegan:{
      type: String,
      required: true
    },
    glutenFree:{
      type: Boolean,
      required: true
    },
    id:{
      type: Number
    }
    /*,
    watched:{
      type: Boolean,
      required: true
    },
    favorites:{
        type: Boolean,
      required: true
    }
    */
    }
  },

  methods: {
    onImgLoad () {
      this.isLoaded = true
    },

  }
};
</script>

<style scope>
.recipe-preview .recipe-body .recipe-image {
  position: center;
  width: 100%;
  height: 100%;
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
  z-index: -1;
  width: 100%;
  height: 150px;
  position: relative;
}

.recipe-preview .recipe-body .text-center {
  text-align: center;
  width: 100%;
  height: 100%;
  display: inline-block;
  position: absolute;
}

.recipe-preview .recipe-body .recipe-image .star {
  position: left;
  height: 50px;
  width: 50px;

}

.recipe-preview .recipe-footer .icon{
  height: 23px;
  width: 23px;
}

</style>
