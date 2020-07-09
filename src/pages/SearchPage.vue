<template>
  <div class="container">
    <h1 class="title">Search Page</h1>
    <b-form @submit="onSubmit" @reset="onReset" v-if="show">
      <b-form-group id="input-group-2" label="Your Search:" label-for="input-2">
        <b-form-input
          id="input-2"
          v-model="form.search"
          required
          placeholder="Enter Your Search Query"
          size="lg"
        ></b-form-input>
      </b-form-group>

        <b-row>
          <b-col>
              <b-form-group id="input-group-3" label="Number Of Result:" label-for="input-3">
              <b-form-select
                v-model="form.numOfResult"
                :options="numOfResult"
                value-field="item"
                text-field="name"
                disabled-field="notEnabled"
             ></b-form-select>
             </b-form-group>
          </b-col>
          <b-col></b-col>
          <b-col></b-col>
       </b-row>

        <b-row>
           <b-col>
              <b-form-group id="input-group-4" label="Cusine:" label-for="input-4">
                <b-form-select
                  v-model="form.cusine"
                  :options="cusine"
                  disabled-field="notEnabled"
                  size="sm"
                ></b-form-select>
              </b-form-group>
           </b-col>
           <b-col>
              <b-form-group id="input-group-5" label="Diet:" label-for="input-5">
                <b-form-select
                  v-model="form.diet"
                  :options="diet"
                  disabled-field="notEnabled"
                  size="sm"
                ></b-form-select>
              </b-form-group>
           </b-col>
           <b-col>
              <b-form-group id="input-group-6" label="Intolerances:" label-for="input-6">
                <b-form-select
                  v-model="form.intolerances"
                  :options="intolerances"
                  disabled-field="notEnabled"
                  size="sm"
                ></b-form-select>
              </b-form-group>

           </b-col>
        </b-row>




      <b-button v-on:click="onSubmit" type="submit" variant="primary">Search</b-button>
      <b-button type="reset" variant="danger">Reset</b-button>
    </b-form>
    <br><br>
    <div v-if=flag>
      <RecipePreviewList reqType = "search" title="Search Result" :searchQuery="this.form.search" :numberOfResult="this.form.numOfResult" :cuisine="this.form.cusine" :diet="this.form.diet" :intolerances="this.form.intolerances" class="SearchRecipes" :key="componentKey" />
    </div>

  </div>
</template>

<script>
  import RecipePreviewList from "../components/RecipePreviewList";
  export default {
    data() {
      return {
        componentKey: 0,
        flag:false,
        form: {
          search: '',
          numOfResult: 5,
          cusine: '',
          diet:'',
          intolerances:''
        },
        numOfResult: [ 5, 10, 15 ],
        cusine:['','African','American','British','Cajun','Caribbean','Chinese','Eastern European','European','French','German','Greek','Indian','Irish','Italian','Japanese','Jewish','Korean','Latin American','Mediterranean','Mexican','Middle Eastern','Nordic','Southern','Spanish','Thai','Vietnamese'],
        diet: ['', 'Gluten Free', 'Ketogenic', 'Vegetarian', 'Lacto-Vegetarian','Ovo-Vegetarian','Vegan','Pescetarian','Paleo','Primal','Whole30'],
        intolerances: ['','Dairy','Egg','Gluten','Grain','Peanut','Seafood','Sesame','Shellfish','Soy','Sulfite','Tree Nut','Wheat'],
        show: true
      }
    },
    mounted(){
      // if(localStorage.form){
      //   this.form=localStorage.form
      // }
      if(this.$root.store.username){
        if(localStorage.search){
          this.form.search=localStorage.search
        }
      if(localStorage.numOfResult){
        this.form.numOfResult=localStorage.numOfResult
      }
      if(localStorage.cusine){
        this.form.cusine=localStorage.cusine
      }
      if(localStorage.diet){
        this.form.diet=localStorage.diet
      }
      if( localStorage.intolerances){
        this.form.intolerances= localStorage.intolerances
      }
      if(localStorage.search){
        this.flag = true
        // this.componentKey += 1
      }
      }
    },
    components: {
    RecipePreviewList
  },
    methods: {
      onSubmit(evt) {
        evt.preventDefault()
        this.flag = true
        this.componentKey += 1
        if(this.$root.store.username){
          localStorage.search=this.form.search
          localStorage.numOfResult=this.form.numOfResult
          localStorage.cusine=this.form.cusine
          localStorage.diet=this.form.diet
          localStorage.intolerances=this.form.intolerances
        }
        
        // alert(JSON.stringify(this.form))
      },
      onReset(evt) {
        evt.preventDefault()
        // Reset our form values
        this.form.search = ''
        this.form.numOfResult=5
        this.form.cusine=''
        this.form.diet=''
        this.form.intolerances=''
        // Trick to reset/clear native browser form validation state
        this.show = false
        this.$nextTick(() => {
          this.show = true
        })
      }
    }
  }
</script>
