'use strict';
var baseUrl = '';
var urls = {
    boot : baseUrl+'boot.php?init=1',
    loader : '../ajax/loader.php',
    login : baseUrl+'login.php',
    save : 'saveTemplate.php'
},appData={};

var mcms = angular.module('mcms', ['mcmsServices']);
