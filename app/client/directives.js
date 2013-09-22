mcms.directive('editor', function($compile,$timeout) {
    return {
        restrict: 'A',
        templateUrl: 'client_modal.html',
        link: function ($scope, $el, attrs) {

            function updateContent(e){
                $timeout(function(){
                    $scope.content = e.editor.getData();
                    $scope.$apply();
                });
            }

            var CKEDITOR_BASEPATH = '../js/ckeditor/';
            CKEDITOR.on('instanceCreated', function (e) {
                e.editor.on('contentDom', function () {
                    e.editor.on('key', function (e) {
                        updateContent(e);
                        e.stop();
                    });

                })
            });

            CKEDITOR.editorConfig = function( config )
            {
                config.enterMode = CKEDITOR.ENTER_BR;
            };

            var area = $el.find('textarea').first();
            CKEDITOR.replace( area.attr('id'),{
                entities_latin:false,
                filebrowserBrowseUrl : 'js/elfinder2.0/elfinder.html',
                entities_latin:false,
                fillEmptyBlocks:false,
                showWordCount:false,
                enterMode : 2,
                removePlugins:'wordcount',//buggy mofo
                toolbar: [
                    { name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
                    [ 'Source', '-', 'NewPage', 'Preview', '-', 'Templates' ],
                    [ 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ],
                    { name: 'insert', items: [ 'Image', 'Table', 'HorizontalRule', 'SpecialChar' ] },
                    { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat' ] },
                    { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote' ] },
                    { name: 'tools', items: [ 'Maximize' ] }
                ]
            });
            CKEDITOR.editorConfig = function( config )
            {
                config.enterMode = CKEDITOR.ENTER_BR;
                config.shiftEnterMode = CKEDITOR.ENTER_BR;
            };
            $scope.editor = CKEDITOR.instances[area.attr('id')];
            $scope.editor.on( 'afterCommandExec', function(e) { updateContent(e); });
            $scope.editor.on( 'selectionChange', function(e) { updateContent(e); });
            $scope.$watch('editable', function (value) {//ensure render
                if (value){
                    $scope.editor.setData( $scope.content );
                    $('#modal').modal();
//                    $scope.editor.setCode($scope.content);
                }

            });

        }
    };
});

mcms.directive('template', function($compile) {
    return {
        restrict: 'A',

        link: function ($scope, $el, attrs) {
            $scope[attrs.template] = $el.html();

            $el.wrapInner('<div ng-bind-html-unsafe="'+attrs.template+'" class="tpl-content" />');
            $el.find('.tpl-content').wrap('<div class="edit-content" />');

            $el.find('.edit-content').append('<ul class="edit-content-links"><li><a href="" id="edit-content-header" class="edit-content-link tpl-link" ng-click="edit($event,\''+attrs.template+'\')">edit</a></li></ul>');

            $compile($el.contents())($scope);

        }
    };
});

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