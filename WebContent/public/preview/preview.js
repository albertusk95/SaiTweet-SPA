angular.module('preview', ['ngRoute'])
 
.config(['$routeProvider', function($routeProvider) {
    $routeProvider.when('/preview', {
        templateUrl: 'public/preview/preview.jsp',
        controller: 'preview_Ctrl'
    });
}])
 
.controller('preview_Ctrl', ['$scope', function($scope) {
    console.log("preview controller"); 
}]);