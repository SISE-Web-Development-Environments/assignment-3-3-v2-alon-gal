(function(e){function t(t){for(var r,a,s=t[0],c=t[1],u=t[2],l=0,d=[];l<s.length;l++)a=s[l],Object.prototype.hasOwnProperty.call(o,a)&&o[a]&&d.push(o[a][0]),o[a]=0;for(r in c)Object.prototype.hasOwnProperty.call(c,r)&&(e[r]=c[r]);p&&p(t);while(d.length)d.shift()();return i.push.apply(i,u||[]),n()}function n(){for(var e,t=0;t<i.length;t++){for(var n=i[t],r=!0,a=1;a<n.length;a++){var s=n[a];0!==o[s]&&(r=!1)}r&&(i.splice(t--,1),e=c(c.s=n[0]))}return e}var r={},a={app:0},o={app:0},i=[];function s(e){return c.p+"js/"+({}[e]||e)+"."+{"chunk-057ef974":"8512245b","chunk-07e738dd":"24334cdd","chunk-14f3f3d2":"6d266062","chunk-746908e5":"579978b6"}[e]+".js"}function c(t){if(r[t])return r[t].exports;var n=r[t]={i:t,l:!1,exports:{}};return e[t].call(n.exports,n,n.exports,c),n.l=!0,n.exports}c.e=function(e){var t=[],n={"chunk-057ef974":1,"chunk-07e738dd":1,"chunk-14f3f3d2":1};a[e]?t.push(a[e]):0!==a[e]&&n[e]&&t.push(a[e]=new Promise((function(t,n){for(var r="css/"+({}[e]||e)+"."+{"chunk-057ef974":"4997241b","chunk-07e738dd":"7a94eefe","chunk-14f3f3d2":"064eae04","chunk-746908e5":"31d6cfe0"}[e]+".css",o=c.p+r,i=document.getElementsByTagName("link"),s=0;s<i.length;s++){var u=i[s],l=u.getAttribute("data-href")||u.getAttribute("href");if("stylesheet"===u.rel&&(l===r||l===o))return t()}var d=document.getElementsByTagName("style");for(s=0;s<d.length;s++){u=d[s],l=u.getAttribute("data-href");if(l===r||l===o)return t()}var p=document.createElement("link");p.rel="stylesheet",p.type="text/css",p.onload=t,p.onerror=function(t){var r=t&&t.target&&t.target.src||o,i=new Error("Loading CSS chunk "+e+" failed.\n("+r+")");i.code="CSS_CHUNK_LOAD_FAILED",i.request=r,delete a[e],p.parentNode.removeChild(p),n(i)},p.href=o;var f=document.getElementsByTagName("head")[0];f.appendChild(p)})).then((function(){a[e]=0})));var r=o[e];if(0!==r)if(r)t.push(r[2]);else{var i=new Promise((function(t,n){r=o[e]=[t,n]}));t.push(r[2]=i);var u,l=document.createElement("script");l.charset="utf-8",l.timeout=120,c.nc&&l.setAttribute("nonce",c.nc),l.src=s(e);var d=new Error;u=function(t){l.onerror=l.onload=null,clearTimeout(p);var n=o[e];if(0!==n){if(n){var r=t&&("load"===t.type?"missing":t.type),a=t&&t.target&&t.target.src;d.message="Loading chunk "+e+" failed.\n("+r+": "+a+")",d.name="ChunkLoadError",d.type=r,d.request=a,n[1](d)}o[e]=void 0}};var p=setTimeout((function(){u({type:"timeout",target:l})}),12e4);l.onerror=l.onload=u,document.head.appendChild(l)}return Promise.all(t)},c.m=e,c.c=r,c.d=function(e,t,n){c.o(e,t)||Object.defineProperty(e,t,{enumerable:!0,get:n})},c.r=function(e){"undefined"!==typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})},c.t=function(e,t){if(1&t&&(e=c(e)),8&t)return e;if(4&t&&"object"===typeof e&&e&&e.__esModule)return e;var n=Object.create(null);if(c.r(n),Object.defineProperty(n,"default",{enumerable:!0,value:e}),2&t&&"string"!=typeof e)for(var r in e)c.d(n,r,function(t){return e[t]}.bind(null,r));return n},c.n=function(e){var t=e&&e.__esModule?function(){return e["default"]}:function(){return e};return c.d(t,"a",t),t},c.o=function(e,t){return Object.prototype.hasOwnProperty.call(e,t)},c.p="/",c.oe=function(e){throw console.error(e),e};var u=window["webpackJsonp"]=window["webpackJsonp"]||[],l=u.push.bind(u);u.push=t,u=u.slice();for(var d=0;d<u.length;d++)t(u[d]);var p=l;i.push(["56d7","chunk-vendors"]),n()})({"183b":function(e,t,n){e.exports=n.p+"img/vegetarian.01ad9929.png"},"19b7":function(e,t,n){},"2b5f":function(e,t,n){e.exports=n.p+"img/clock.621394e6.png"},"56d7":function(e,t,n){"use strict";n.r(t);n("4160"),n("d3b7"),n("159b"),n("e260"),n("e6cf"),n("cca6"),n("a79d");var r=n("2b0e"),a=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{attrs:{id:"app"}},[n("div",[n("b-navbar",{attrs:{toggleable:"lg",type:"dark",variant:"info"}},[n("b-navbar-brand",{attrs:{href:"#"}},[e._v("NavBar")]),n("b-navbar-toggle",{attrs:{target:"nav-collapse"}}),n("b-collapse",{attrs:{id:"nav-collapse","is-nav":""}},[n("b-navbar-nav",[n("b-nav-item",{attrs:{active:"",to:{name:"main"}}},[e._v("Home")]),n("b-nav-item",{attrs:{to:{name:"search"}}},[e._v("Search")]),e.$cookies.get('session')?n("b-nav-item-dropdown",{attrs:{id:"my-nav-dropdown",text:e.$cookies.get('session'),"toggle-class":"nav-link-custom",right:""}},[n("b-dropdown-item",{on:{click:e.Logout}},[e._v("Logout")])],1):n("b-nav-item-dropdown",{attrs:{id:"my-nav-dropdown",text:"Hello Guest","toggle-class":"nav-link-custom",right:""}},[n("b-dropdown-item",{attrs:{to:{name:"login"}}},[e._v("Login")]),n("b-dropdown-divider"),n("b-dropdown-item",{attrs:{to:{name:"register"}}},[e._v("Register")])],1)],1),n("b-navbar-nav",{staticClass:"ml-auto"},[n("b-nav-form",[n("b-nav-item",[e._v("About")])],1)],1)],1)],1)],1),n("router-view")],1)},o=[],i={name:"App",methods:{Logout:function(){var e=this;this.$root.store.logout(),this.$root.toast("Logout","User logged out successfully","success"),this.$router.push("/")["catch"]((function(){e.$forceUpdate()}))}}},s=i,c=(n("5c0b"),n("2877")),u=Object(c["a"])(s,a,o,!1,null,null,null),l=u.exports,d=n("a7fe"),p=n.n(d),f=n("bc3a"),m=n.n(f),v=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{staticClass:"container"},[n("h1",{staticClass:"title"},[e._v("Main Page")]),n("b-container",{staticClass:"bv-example-row"},[n("b-row",[n("b-col",[n("RecipePreviewList",{staticClass:"RandomRecipes",attrs:{reqType:"random",title:"Explore These Recipes"}})],1),n("b-col",[e.$cookies.get('session')?n("div",[n("RecipePreviewList",{staticClass:"RandomRecipes",attrs:{reqType:"watched",title:"Last watched recipes"}})],1):n("div",[n("br"),n("h6",[e._v(" You need to Login to view this")]),n("RecipePreviewList",{class:{RandomRecipes:!0,blur:!e.$cookies.get('session'),center:!0},attrs:{reqType:"random",title:"Last watched recipes"}})],1)])],1)],1)],1)},h=[],g=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("b-container",[n("h3",[e._v(" "+e._s(e.title)+": "),e._t("default")],2),e._l(e.recipes,(function(e){return n("b-row",{key:e.id},[n("RecipePreview",{staticClass:"recipePreview",attrs:{recipe:e}})],1)}))],2)},b=[],y=n("2909"),w=(n("96cf"),n("1da1")),_=function(){var e=this,t=e.$createElement,r=e._self._c||t;return r("div",{staticClass:"recipe-preview"},[r("div",{staticClass:"recipe-body"},[r("div",{staticClass:"text-center"},[e.isLoaded?e._e():r("b-spinner",{attrs:{variant:"primary",label:"Text Centered"}})],1),r("img",{staticClass:"recipe-image",attrs:{src:e.recipe.image},on:{load:e.onImgLoad}})]),r("div",{staticClass:"recipe-footer"},[r("h5",[e._v(" "+e._s(e.recipe.title)+" ")]),r("img",{staticClass:"icon",attrs:{src:n("2b5f")}}),e._v(" Duration: "+e._s(e.recipe.readyInMinutes)),r("br"),e.recipe.glutenFree?r("div",[r("img",{staticClass:"icon",attrs:{src:n("97fd")}}),e._v(" Gluten Free ")]):e._e(),e.recipe.vegetarian?r("div",[r("img",{staticClass:"icon",attrs:{src:n("183b")}}),e._v(" Vegetarian ")]):e._e(),e.recipe.vegan?r("div",[r("img",{staticClass:"icon",attrs:{src:n("7bea")}}),e._v(" Vegan ")]):e._e(),r("br")])])},k=[],x=(n("a9e3"),{mounted:function(){var e=this;this.axios.get(this.recipe.image).then((function(t){e.image_load=!0}))},data:function(){return{isLoaded:!1}},props:{recipe:{image:{type:String,required:!1,default:function(){return{image:"../assets/nophoto.png"}}},title:{type:String,required:!0},readyInMinutes:{type:Number,required:!0},vegetarian:{type:String,required:!0},vegan:{type:String,required:!0},glutenFree:{type:Boolean,required:!0}}},methods:{onImgLoad:function(){this.isLoaded=!0}}}),C=x,L=(n("a2cf"),Object(c["a"])(C,_,k,!1,null,null,null)),P=L.exports,R={name:"RecipePreviewList",components:{RecipePreview:P},props:{title:{type:String,required:!0},reqType:{type:String,required:!0}},data:function(){return{recipes:[]}},mounted:function(){this.updateRecipes()},methods:{updateRecipes:function(){var e=this;return Object(w["a"])(regeneratorRuntime.mark((function t(){var n,r,a,o,i;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:if(t.prev=0,r=e.$props.reqType,"random"!==r){t.next=8;break}return t.next=5,e.axios.get("http://localhost:4000/recipes/getRandomRecipes/3");case 5:a=t.sent,t.next=13;break;case 8:if("watched"!==r){t.next=13;break}return o=e.$cookies.get('session'),t.next=12,e.axios.get("http://localhost:4000/users/lastThreeWatched/"+o);case 12:a=t.sent;case 13:i=a.data,(n=e.recipes).push.apply(n,Object(y["a"])(i)),t.next=20;break;case 17:t.prev=17,t.t0=t["catch"](0),console.log(t.t0);case 20:case"end":return t.stop()}}),t,null,[[0,17]])})))()}}},j=R,O=(n("6e03"),Object(c["a"])(j,g,b,!1,null,"db444a1c",null)),S=O.exports,T={name:"Main",components:{RecipePreviewList:S}},E=T,$=(n("d500"),Object(c["a"])(E,v,h,!1,null,"371e42be",null)),q=$.exports,A=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{staticClass:"container"},[n("h1",[e._v("Four Oh Four you didn't")]),n("router-link",{attrs:{to:"/",exact:""}},[e._v("ET Go Home")])],1)},I=[],M={},F=Object(c["a"])(M,A,I,!1,null,null,null),N=F.exports,B=[{path:"/",name:"main",component:q},{path:"/register",name:"register",component:function(){return n.e("chunk-14f3f3d2").then(n.bind(null,"eaff"))}},{path:"/login",name:"login",component:function(){return n.e("chunk-07e738dd").then(n.bind(null,"62cc"))}},{path:"/search",name:"search",component:function(){return n.e("chunk-746908e5").then(n.bind(null,"37906"))}},{path:"/recipe/:recipeId",name:"recipe",component:function(){return n.e("chunk-057ef974").then(n.bind(null,"6619"))}},{path:"*",name:"notFound",component:N}],H=B,D=n("8c4f"),G=n("1dce"),U=n.n(G),J=(n("f9e3"),n("2dd8"),n("1073")),V=n("cbd0"),K=n("b1fc"),W=n("7049"),Y=n("a7e2"),z=n("8c60"),Q=n("f9bc"),X=n("44d4"),Z=n("cca8"),ee=n("51c2"),te=n("498a"),ne=n("b519"),re=n("6e5c");m.a.defaults.withCredentials=!0,r["default"].use(D["a"]);var ae=new D["a"]({routes:H});[J["a"],V["a"],K["a"],W["a"],Y["a"],z["a"],Q["a"],X["a"],Z["a"],ee["a"],te["a"],ne["a"],re["a"]].forEach((function(e){return r["default"].use(e)})),r["default"].use(U.a),r["default"].use(ne["a"]),r["default"].use(re["a"]),r["default"].use(z["a"]),m.a.interceptors.request.use((function(e){return e}),(function(e){return Promise.reject(e)})),m.a.interceptors.response.use((function(e){return e}),(function(e){return Promise.reject(e)})),r["default"].use(p.a,m.a),r["default"].config.productionTip=!1;var oe={username:localStorage.username,login:function(e){localStorage.setItem("username",e),this.username=e,console.log("login",this.username)},logout:function(){console.log("logout"),localStorage.removeItem("username"),this.username=void 0}};console.log(oe),new r["default"]({router:ae,data:function(){return{store:oe}},methods:{toast:function(e,t){var n=arguments.length>2&&void 0!==arguments[2]?arguments[2]:null,r=arguments.length>3&&void 0!==arguments[3]&&arguments[3];this.$bvToast.toast("".concat(t),{title:"".concat(e),toaster:"b-toaster-top-center",variant:n,solid:!0,appendToast:r,autoHideDelay:3e3})}},render:function(e){return e(l)}}).$mount("#app")},"5c0b":function(e,t,n){"use strict";var r=n("9c0c"),a=n.n(r);a.a},"6e03":function(e,t,n){"use strict";var r=n("b3f3"),a=n.n(r);a.a},"7bea":function(e,t,n){e.exports=n.p+"img/vegan.13ea0d24.png"},"97fd":function(e,t,n){e.exports=n.p+"img/glutenfree.ece0273b.png"},"9ab0":function(e,t,n){},"9c0c":function(e,t,n){},a2cf:function(e,t,n){"use strict";var r=n("19b7"),a=n.n(r);a.a},b3f3:function(e,t,n){},d500:function(e,t,n){"use strict";var r=n("9ab0"),a=n.n(r);a.a}});
//# sourceMappingURL=app.961aa717.js.map