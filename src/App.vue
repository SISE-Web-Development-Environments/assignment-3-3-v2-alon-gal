<template>
  <div id="app">
    <div>
      <b-navbar fixed="top" toggleable="lg" type="dark" variant="info">
        <img class="icon" style="margin-right: 10px;" src="./assets/icon.png">
        <b-navbar-brand href="#" style="font-family: myFirstFont; margin-right: 20px;">Crazy Taco</b-navbar-brand>

        <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

        <b-collapse id="nav-collapse" is-nav>
          <b-navbar-nav>
            <b-nav-item active :to="{ name: 'main' }"> <b-icon  icon="house-fill"></b-icon> Home</b-nav-item>
            <b-nav-item active :to="{ name: 'search' }"><b-icon  icon="search"></b-icon> Search</b-nav-item>
             <b-avatar style="margin-left: 10px" v-if="$root.store.username" variant="info" :src="$root.store.photoUrl"></b-avatar>
            <b-nav-item-dropdown 
              v-if="!$root.store.username"
              id="my-nav-dropdown"
              text="Hello Guest"
              toggle-class="nav-link-custom"
              right
              active
            >
              <b-dropdown-item :to="{ name: 'login' }"> <b-icon  icon="person-check"></b-icon> Login</b-dropdown-item>
              <b-dropdown-divider></b-dropdown-divider>
              <b-dropdown-item :to="{ name: 'register' }"><b-icon  icon="pencil-square"></b-icon> Register</b-dropdown-item>
            </b-nav-item-dropdown>
            <b-nav-item-dropdown
              v-else
              id="my-nav-dropdown"
              :text="$root.store.username"
              toggle-class="nav-link-custom"
              right
            >
              <b-dropdown-item :to="{ name: 'myrecipes'}"><b-icon  icon="heart"></b-icon> My Recipes</b-dropdown-item>
              <b-dropdown-item :to="{ name: 'myfavoriterecipes'}"><b-icon  icon="star"></b-icon> My Favorite Recipes</b-dropdown-item>
              <b-dropdown-item :to="{ name: 'myfamilyrecipes'}"><b-icon  icon="people"></b-icon> My Family Recipes</b-dropdown-item>
              <b-dropdown-divider></b-dropdown-divider>
              <b-dropdown-item @click="Logout"><b-icon  icon="box-arrow-in-right"></b-icon> Logout</b-dropdown-item>
            </b-nav-item-dropdown>
          </b-navbar-nav>

          <!-- Right aligned nav items -->
          <b-navbar-nav class="ml-auto">
            <b-nav-form>
              <b-nav-item active v-b-modal.modalPopover> <b-icon  icon="info-circle"></b-icon> About</b-nav-item>
              <b-modal id="modalPopover" title="Modal with Popover" ok-only>
                <p>test</p>
              </b-modal>
            </b-nav-form>
          </b-navbar-nav>
        </b-collapse>
      </b-navbar>
    </div>
    <router-view style="padding-top: 73px" />
  </div>
</template>

<script>
export default {
  name: "App",
  methods: {
    Logout() {
      this.$root.store.logout();
      this.$root.toast("Logout", "User logged out successfully", "success");

      this.$router.push("/").catch(() => {
        this.$forceUpdate();
      });
    }
  }
};
</script>

<style lang="scss">
@import "@/scss/form-style.scss";

@font-face {
  font-family: myFirstFont;
  src: url(./assets/Kalam-Bold.ttf);
}

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  min-height: 100vh;
  background-image: url("./assets/bg-kitchen.jpg");
  background-repeat: no-repeat;
  background-size: cover;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>
