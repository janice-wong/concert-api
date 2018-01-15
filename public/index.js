/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      concerts: [],
      name: "",
      date: "",
      duration: "",
      cost: ""
    };
  },
  created: function() {
    axios.get('/v1/concerts').then(function(response) {
      this.concerts = response.data;
    }.bind(this));
  },
  methods: {
    addConcert() {
      var params = {
        name: this.name,
        date: this.date,
        duration: this.duration,
        cost: this.cost
      };
      axios.post('v1/concerts', params).then(function(response) {
        console.log(response.data);
        this.concerts.push(response.data);
      }.bind(this));
      this.name = "";
      this.date = "";
      this.duration = "";
      this.cost = "";

    },

    removeConcert(inputConcert) {
      axios.delete(`v1/concerts/${inputConcert.id}`).then(function(response) {
        console.log(response.data);
        var index = this.concerts.indexOf(inputConcert);
        this.concerts.splice(index, 1);
      }.bind(this));
    }
  },
  computed: {}
};

var router = new VueRouter({
  routes: [{ path: "/", component: HomePage }],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router
});
