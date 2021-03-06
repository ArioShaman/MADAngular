app.controller 'CountryPlayListCtrl', [
  '$scope', '$rootScope', 'CountryPlayList', 'action' , 'ImportCsv','Upload'
  ($scope, $rootScope, CountryPlayList, action, ImportCsv, Upload) -> 

    ctrl = this
    ctrl.fileUploader = {}

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
            #console.log(event.mapObject.title) - просто проверка

            #Возвращает массив записей по полю Страна, год 
            ctrl.playlist = CountryPlayList.query({country: event.mapObject.title, year: $scope.year})
            #console.log ctrl.playlist            
            $scope.$apply () ->
              $scope.selectCont = event.mapObject.title
              $scope.selectIs = true
        ],
      }

      map = AmCharts.makeChart("map", data)

      $scope.year = 2017
      
      $scope.submit = ()->
        if ($scope.form.file.$valid && $scope.file) 
          $scope.upload($scope.file);

      $scope.upload = (file) ->
        if file
          Upload.upload(
            url: Routes.import_import_csvs_path()
            data: {file: file}
          ).then (res)->
            #console.log res
    return
]
