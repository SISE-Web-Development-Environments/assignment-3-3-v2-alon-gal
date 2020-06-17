<template>
  <div class="recipe-preview">
    <div class="recipe-body">
      <div :style="{ 'background-image': `url(${recipe.image})` }" class="recipe-image">
      </div>
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
  </div>
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
      image_load: false
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
    }/*,
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
  }
};
</script>

<style scope>
.recipe-preview .recipe-body .recipe-image {
  position: center;
  width: 100%;
  height: 100%;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  background-size: cover;
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
  height: 200px;
  position: relative;
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
