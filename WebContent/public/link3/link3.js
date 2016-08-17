angular.module('link3', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
	$routeProvider.when('/link3', {
		templateUrl: 'public/link3/link3.jsp',
		controller: 'link3Ctrl'
	});
}])

.controller('link3Ctrl', ['$scope', function($scope) {
	console.log("link3 controller...");
}]);

