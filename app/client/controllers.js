function mainCtrl($scope,$rootScope,xhr,$element){

    $scope.content = null;


    $scope.edit = function(item,model){
        $scope.content = $scope[model];
        $scope.current = model;
        $scope.editable = new Date();

    }

    $scope.save = function(){
//        xhr.save($scope)
    }

    $scope.$watch('content', function (val) {
            $scope[$scope.current] = val;

    });

}