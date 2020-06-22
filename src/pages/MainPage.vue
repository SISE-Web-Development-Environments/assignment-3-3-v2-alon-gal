<template>
  <div class="container">
    <h1 class="title">Main Page</h1>
    <b-container class="bv-example-row">
  <b-row>
    <b-col><RecipePreviewList fromAPI="false" reqType = "random" title="Explore These Recipes" class="RandomRecipes" :key="componentKey" />
     <button type="button"  v-on:click="onRefresh" class="btn btn-primary">Refresh recipes</button>
    </b-col>
    <b-col>
      <div v-if="$root.store.username">
      <RecipePreviewList fromAPI="false" reqType = "watched" title="Last watched recipes" class="RandomRecipes" />
      </div>
      <div v-else>
        <br><h6> You need to Login to view this</h6>
      <RecipePreviewList fromAPI="false" reqType = "random" title="Last watched recipes" :class="{
        RandomRecipes: true,
        blur: !$root.store.username,
        center: true
      }">
        </RecipePreviewList >
      </div>
    </b-col>
  </b-row>
    </b-container>
    
    <!--<router-link v-if="!$root.store.username" to="/login" tag="button">You need to Login to vue this</router-link>
    {{ !$root.store.username }}
    <RecipePreviewList
      title="Last Viewed Recipes"
      :class="{
        RandomRecipes: true,
        blur: !$root.store.username,
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
export default {
    name: "Main",
    data(){
    return{
      componentKey: 0
    }
  },  
  components: {
    RecipePreviewList
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
