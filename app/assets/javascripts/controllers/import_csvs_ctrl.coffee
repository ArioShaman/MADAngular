app.controller 'ImportCsvsCtrl', [
  '$scope', 'ImportCsv', 'action' 
  ($scope, ImportCsv, action) -> 

    console.log 'hello'
    ctrl = this
    action 'index', () ->
      # ctrl.playlist = Country.query()
      # console.log ctrl.playlist
    return
]
