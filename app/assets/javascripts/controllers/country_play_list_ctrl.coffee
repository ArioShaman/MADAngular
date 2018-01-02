app.controller 'CountryPlayListCtrl', [
  '$scope', '$rootScope', 'CountryPlayList', 'action' , 'ImportCsv','Upload'
  ($scope, $rootScope, CountryPlayList, action, ImportCsv, Upload) -> 

    ctrl = this
    ctrl.fileUploader = {}

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

      $scope.uploadCSV = (form)->
        data = _.compactObject form
        console.log data
        ImportCsv.import {data: data}, (res)->
          console.log res

      $scope.upload = (file) ->
        if file
          Upload.upload(
            url: Routes.import_import_csvs_path()
            data: {file: file}
          ).then (res)->
            console.log res
    return
]
