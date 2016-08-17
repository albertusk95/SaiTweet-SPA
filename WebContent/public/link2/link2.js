angular.module('link2', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
	$routeProvider.when('/link2', {
		templateUrl: 'public/link2/link2.jsp',
		controller: 'link2Ctrl'
	});
}])

.controller('link2Ctrl', ['$scope', function($scope) {
	console.log("link2 controller...");
}]);

