// pre home
var app = angular.module('saitweet', [
    'ngRoute',
    'queryContainer',
	'whatisit',
	'contact',
	'primary',
	'preview',
	'link2',
	'link3'
])

.config(['$routeProvider', function($routeProvider) {
    $routeProvider.otherwise({
        redirectTo: '/queryContainer'
    });
}]);

