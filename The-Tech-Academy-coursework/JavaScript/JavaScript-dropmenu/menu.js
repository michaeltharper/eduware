/**
 * simple menu visiblity toggle
 */

'use strict';

$(document).ready(function() {

      $(".navclick").mouseover(function() {
            $(".navitem, .navitem a").css("display","block");
      });

      $(".navclick").mouseout(function() {
            $(".navitem, navitem a").css("display","none");
      });

});