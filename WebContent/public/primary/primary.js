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
		console.log("show details: " + item);
		/*
		$("#"+item).show( "slow", function() {
			// Animation complete.
		});
		*/
		var $target = $("#"+item), $toggle = $(this);
	
	    $target.slideToggle( 500, function () {

	    });
			
	}
	
	$scope.showAnalysis = function(item) {
		console.log("show analysis: " + item);
		
		var $target = $("#analysis"+item), $toggle = $(this);
		
	    $target.slideToggle( 500, function () {
	    	
	    });
	}
	
	
	$scope.selectedID = -1;
	//$scope.selectedMoreMath = -2;
	
	$scope.selectedTweetID = function() {
		
		$scope.selectedID = $scope.selectedOption;
		//$scope.selectedMoreMath = -2;
		
	}
	
	/*
	$scope.initMoreMath = function(item) {
		$scope.selectedMoreMath = item;
		
		console.log("selectedMoreMath: " + $scope.selectedMoreMath);
	}
	*/
	
	/*
	$scope.moreMathValidity = function() {
		if ($scope.selectedID == $scope.selectedMoreMath) {
			console.log("more math is valid");
			return true;
		} else {
			console.log("more math is invalid");
			return false;
		}
	}
	*/
	
}]);

