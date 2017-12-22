app.controller 'CountryPlayListCtrl', [
  '$scope', 'CountryPlayList', 'action' 
  ($scope, CountryPlayList, action) -> 

    ctrl = this
    action 'index', () ->

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

    return
]
