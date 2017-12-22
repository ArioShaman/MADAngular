app.controller 'CountriesCtrl', [
  '$scope', 'Country', 'action' 
  ($scope, Country, action) -> 

    ctrl = this
    action 'index', () ->
      ctrl.playlist = Country.query()

    return
]
