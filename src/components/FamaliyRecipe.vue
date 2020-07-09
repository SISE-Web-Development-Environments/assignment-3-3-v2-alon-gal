<template>

<div class="container">

      <div class="recipe-header mt-3 mb-4">
        <h2 class="title">{{ recipe.recipe_name }}</h2>

        <img :src="recipe.photoUrl" class="recipe-image" @load="onImgLoad" />
      </div>

    <b-container fluid class="bv-example-row">
        <b-row>
            <b-col class="bcol">Owner: {{ recipe.recipes_owner }} </b-col>
            <b-col class="bcol">When Made: {{ recipe.whenMade }} </b-col>                    
        </b-row>    
    </b-container>
  
    <div class="recipe-body">
        <div class="wrapper">
          <div class="wrapped"><b>Ingredients:</b><br><br>
          <div v-html="recipe.ingredients" style="width: 100%; padding-left: 20px; padding-right: 20px; padding-bottom: 20px"></div>
          </div>
          <div class="wrapped"><b>Instructions:</b><br><br>
          <div v-html="recipe.instructions" style="width: 100%; padding-left: 20px; padding-right: 20px; padding-bottom: 20px"></div>
          </div>
        </div>

      
    </div>
<br> <br> 
</div>
    

      

    

  
</template>

<script>
export default {
  props: {
    recipe: {
      photoUrl: {
        type: String,
        required: false,
        default: function() {
          return { image: "../assets/nophoto.png" };
        }
      },
      recipe_name: {
        type: String,
        required: true
      },
      recipes_owner: {
        type: String,
        required: true
      },
      whenMade: {
        type: String,
        required: true
      },
      ingredients: {
        type: String,
        required: true
      },
      instructions: {
        type: String,
        required: true
      },
    //   id: {
    //     type: Number
    //   },
    //   aggregateLikes:{
    //     type: Number,
    //     required: true
    //   }
     },
    notFromAPIp:{
      type: String
    }
  },

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

.recipe-image{
object-fit: cover;
width: 100%;
height: 400px;
}

</style>
