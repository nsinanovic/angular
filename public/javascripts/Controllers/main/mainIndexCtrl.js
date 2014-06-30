angular.module('Blog').controller('IndexCtrl', function($scope, $location, $http, advartismentData, userData, employerData, $translate) {
    $translate.use('ba');
    $scope.changeLanguage = function(key) {
        return $translate.use(key);
    };
    $scope.data = advartismentData.data;
    advartismentData.loadAdvartisments(null);
    $scope.data1 = userData.data;
    userData.loadUsers(null);
    $scope.data2 = employerData.data;
    employerData.loadEmployers(null);
    $scope.viewAdvartisment = function(advartismentId) {
        return $location.url('/advartisment/' + advartismentId);
    };
    $scope.navNewAdvartisment = function() {
        return $location.url('/advartisment/new');
    };
} );

Blog.controller('IndexCtrl').$inject = ['$scope', '$location', '$http', 'advartismentData', 'userData', 'employerData', '$translate'];
