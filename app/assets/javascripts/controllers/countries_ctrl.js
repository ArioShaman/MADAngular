app.controller('CountriesCtrl', ['Country', 'action', function (Country, action) {
  var ctrl = this;
  action('index', function(){
    ctrl.countries = Country.query();
  });
}]);