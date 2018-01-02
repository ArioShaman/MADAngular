app.controller 'CountryPlayListCtrl', [
  '$scope', '$rootScope', 'CountryPlayList', 'action' 
  ($scope, $rootScope, CountryPlayList,  action) -> 

    ctrl = this
    action 'index', () ->
      ctrl.playlist = CountryPlayList.query()
      console.log ctrl.playlist

      data = {
        "type": "map",
        "theme":"black",


        dataProvider: {
          map: "worldLow",
          getAreasFromMap: true,

        },

        areasSettings: {
          autoZoom: true,
          selectedColor: "#2B1328",
          color: "#BF03BF",
          outlineColor:"000000"
        },
        listeners: [
          "event": "clickMapObject",
          "method": ( event ) ->
            console.log(event.mapObject.title)
            $scope.$apply () ->
              $scope.selectCont = event.mapObject.title
              $scope.selectIs = true
        ],
      }

      map = AmCharts.makeChart("map", data)
      ctrl.playlist = CountryPlayList.query()

      $scope.sendForm = (param)->
        console.log param

    return
]
