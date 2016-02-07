'use strict';

describe('myApp.items module', function() {

  beforeEach(module('myApp.items'));

  describe('items controller', function(){

    it('should ....', inject(function($controller) {
      //spec body
      var itemsCtrl = $controller('itemsCtrl');
      expect(itemsCtrl).toBeDefined();
    }));

  });
});