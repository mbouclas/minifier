mcms.directive('loadingMessage', function() {
    return {
        restrict: 'A',
        transclude: true,
        priority: 1e3,
        template: '<div>\n  <div class="overlay-container" ng-show="message">\n    <div class="overlay-text" ng-bind="message"></div>\n  </div>\n  <div ng-transclude></div>\n</div>',
        link: function ($scope, $el, attrs) {
            $scope.$watch('loading', function (value) {//ensure render

                if (value){

                    $scope.message = $scope.loadingMessage || 'Loading...';
                } else {
                    $scope.message = '';
                }
            });
        }
    };
});

mcms.directive('ngIf', function() {
    return {
        priority: 500,
        restrict: 'A',
        transclude: 'element',
        compile: function(element, attrs, transcludeFn) {
            var watchExpr = attrs.ngIf;

            return function(scope, element) {
                var selectedElement,
                    selectedScope;

                scope.$watch(watchExpr, function(value) {
                    if (selectedElement) {
                        selectedScope.$destroy();
                        selectedElement.remove();
                        selectedElement = selectedScope = null;
                    }

                    if (value && transcludeFn) {
                        selectedScope = scope.$new();
                        transcludeFn(selectedScope, function(transcludeElement) {
                            selectedElement = transcludeElement;
                            element.after(transcludeElement);
                        });
                    };
                });
            };
        }
    };
});