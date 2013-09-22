'use strict';
var baseUrl = '../ajax/admin/';
var urls = {
    boot : baseUrl+'boot.php?init=1',
    loader : '../ajax/loader.php',
    login : baseUrl+'login.php'
},appData={};

var mcms = angular.module('mcms', ['mcmsServices']);
