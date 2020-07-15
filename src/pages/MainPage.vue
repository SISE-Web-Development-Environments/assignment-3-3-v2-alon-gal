<template>
  <div class="container">
    <h1 class="title" style="font-family: helloSunshine;">{Main Page}</h1>
    <b-container class="bv-example-row">
  <b-row>
    <b-col><RecipePreviewList notFromAPI="false" reqType = "random" title="Explore These Recipes" class="RandomRecipes" :key="componentKey" />
     <button type="button"  v-on:click="onRefresh" class="btn btn-primary">Refresh recipes</button>
    </b-col>
    <b-col>
      <div v-if="$cookies.get('session')">
      <RecipePreviewList notFromAPI="false" reqType = "watched" title="Last watched recipes" class="RandomRecipes" />
      </div>
      <div v-else>
        <LoginPage/>
      </div>
      <!--<div v-else>
        <b-button squared variant="primary" :to="{ name: 'login' }"> <b-icon  icon="person-check"></b-icon> Login</b-button>
         <b-button squared variant="info" style="margin-left: 10px" :to="{ name: 'register' }"><b-icon  icon="pencil-square"></b-icon> Register</b-button>
      <RecipePreviewList notFromAPI="false" reqType = "random" title="Last watched recipes" :class="{
        RandomRecipes: true,
        blur: !$cookies.get('session'),
        center: true
      }">
        </RecipePreviewList >
      </div>
      </-->
    </b-col>
  </b-row>
    </b-container>
    
    <!--<router-link v-if="!$cookies.get('session')" to="/login" tag="button">You need to Login to vue this</router-link>
    {{ !$cookies.get('session') }}
    <RecipePreviewList
      title="Last Viewed Recipes"
      :class="{
        RandomRecipes: true,
        blur: !$cookies.get('session'),
        center: true
      }"
      disabled
    ></RecipePreviewList>-->
    <!-- <div
      style="position: absolute;top: 70%;left: 50%;transform: translate(-50%, -50%);"
    >
      Centeredasdasdad
    </div>-->
  </div>
</template>

<script>
import RecipePreviewList from "../components/RecipePreviewList";
import LoginPage from "../pages/LoginPage";
export default {
    name: "Main",
    data(){
    return{
      componentKey: 0
    }
  },  
  components: {
    RecipePreviewList,
    LoginPage
  },
    methods:{
    onRefresh(){
      this.componentKey++
    },
  }
};
</script>

<style lang="scss" scoped>
.RandomRecipes {
  margin: 10px 0 10px;
}
.blur {
  -webkit-filter: blur(5px); /* Safari 6.0 - 9.0 */
  filter: blur(2px);
}
::v-deep .blur .recipe-preview {
  pointer-events: none;
  cursor: default;
}


</style>
