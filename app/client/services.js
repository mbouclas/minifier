'use strict';

/* Services */
angular.module('mcmsServices', []).
    factory('xhr', function($rootScope,$http,$location,$q){
        $http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";
        return {
            boot:function(params){
                var defer = $q.defer();
                $http.get(urls.boot, { }).
                    success(function(data, status) {
                        defer.resolve(data);
                    });
                return defer.promise;
            },
            login: function(params){
                var defer = $q.defer();
                $http.post(urls.login, $.param(params)).
                    success(function(data, status) {
                        defer.resolve(data);
                    });
                return defer.promise;
            },
            readFile:function(file){
                var defer = $q.defer();
                $http.get(file, {}).
                    success(function(data, status) {
                        defer.resolve(data);
                    });
                return defer.promise;
            }
        }
    }).factory('socket', function ($rootScope) {
//    var socket = io.connect('http://localhost:8005');
        return {
            on: function (eventName, callback) {
                socket.on(eventName, function () {
                    var args = arguments;
                    $rootScope.$apply(function () {
                        callback.apply(socket, args);
                    });
                });
            },
            emit: function (eventName, data, callback) {
                socket.emit(eventName, data, function () {
                    var args = arguments;
                    $rootScope.$apply(function () {
                        if (callback) {
                            callback.apply(socket, args);
                        }
                    });
                })
            }
        };
    });
