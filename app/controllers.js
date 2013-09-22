mcms.controller('mainCtrl', ['$scope', '$rootScope','socket', function($scope,$rootScope,socket) {


    $scope.dir = './';


    $scope.reset = function(){
        $scope.files = [];
        $scope.allFiles = [];
        $scope.projectFiles = [];
        $scope.openedFiles = [];
        $scope.root = {};
    }

    $scope.reset();

    socket.on('dirResults', function (data) {
        if (typeof $scope.root.file == 'undefined'){
            $scope.files = data;
            $scope.allFiles = data;
        }
        else {
            for (var a in data){
                $scope.allFiles.push(data[a]);
            }
            $scope.files[$scope.allFiles.indexOf($scope.root)].children = data;
        }


    });
    socket.on('fileReady', function (data) {
        $scope.downloadFile = true;
    });

    $scope.getFiles = function(){
        $scope.reset();
        socket.emit('send:files', {
            dir: $scope.dir
        });
    }

//    $scope.getFiles();

    $scope.open = function(file){
        if ($scope.openedFiles.indexOf(file) != -1) {
            file.shown = (file.shown === true) ? false : true;
            return;
        }
        else {
            file.shown = true;
            $scope.openedFiles.push(file);
        }
        file.children = [];
        $scope.root = file;
        socket.emit('send:files', {
            dir: file.file
        });
    }

    $scope.addFile = function(file){
        $scope.projectFiles.push(file);
    }

    $scope.compress = function(){
        socket.emit('compress', {
            fileOut: $scope.fileOut,
            files: $scope.projectFiles
        });
    }
}]);
