//var $container = $("#masterTweet");

angular.module('primary', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
	$routeProvider.when('/primary', {
		templateUrl: 'public/primary/primary.jsp',
		controller: 'primaryCtrl'
	});
}])

.controller('primaryCtrl', ['$scope', function($scope) {
	console.log("primary controller...");
	
	// default to Dashboard
	$scope.selectedView = 0;
	
	$scope.setView = function(item) {
		$scope.selectedView = item;
	}
	
	$scope.showDetails = function(item) {
		console.log("showdetail: " + item);
		/*
		$("#"+item).show( "slow", function() {
			// Animation complete.
		});
		*/
		var $target = $("#"+item), $toggle = $(this);
	
	    $target.slideToggle( 500, function () {
	        //$toggle.text(($target.is(':visible') ? 'Hide' : 'Show') + ' My Bag');
	    });
			
	}
	
	/*
	$scope.divID = -1;
	
	$scope.initID = function() {
		$scope.divID = $scope.divID + 1;
		console.log("divID: " + $scope.divID);
	}
	*/
	
	/*
	$scope.getNumber = function(num) {
	    return new Array(num);   
	}
	*/
	
	/*
	var divCount = 0;

	$scope.setID = function () {
		$container.append('<div id="' + $container.children().length + 1 + '"></div>');
	}
	*/
	
}]);

