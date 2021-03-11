(function () {
    'use strict';

    angular.module('neomon')
        .run(Run);

    /* @ngInject */
    function Run (
        $window,
        $location,
        angularClient
    ) {
        neo.registry.registerProtocolClient(angularClient);
    }


})();

