/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function showme(info) {


    if (info === "jid") {

        $("#jid").show(500);
        $("#usnm").hide(200);
        $("#que").hide(200);
        $("#jbnm").hide(200);
        $("#st").hide(200);
        $("#scnm").hide(200);

    }

    if (info === "usnm") {

        $("#usnm").show(500);
        $("#jid").hide(200);
        $("#que").hide(200);
        $("#jbnm").hide(200);
        $("#st").hide(200);
        $("#scnm").hide(200);

    }

    if (info === "que") {

        $("#que").show(500);
        $("#usnm").hide(200);
        $("#jid").hide(200);
        $("#jbnm").hide(200);
        $("#st").hide(200);
        $("#scnm").hide(200);

    }

    if (info === "jbnm") {

        $("#jbnm").show(500);
        $("#usnm").hide(200);
        $("#jid").hide(200);
        $("#que").hide(200);
        $("#st").hide(200);
        $("#scnm").hide(200);


    }

    if (info === "scnm") {

        $("#scnm").show(500);
        $("#usnm").hide(200);
        $("#jid").hide(200);
        $("#que").hide(200);
        $("#st").hide(200);
        $("#jbnm").hide(200);

    }

    if (info === "st") {

        $("#jbnm").hide(200);
        $("#usnm").hide(200);
        $("#jid").hide(200);
        $("#que").hide(200);
        $("#st").show(500);
        $("#scnm").hide(200);

    }

    if (info === "wrkflw") {

        $("#jbnm").hide(200);
        $("#usnm").hide(200);
        $("#jid").hide(200);
        $("#que").hide(200);
        $("#st").hide(200);
        $("#wrkflw").show(500);
        $("#scnm").hide(200);
    }

}


$(document).ready(function() {

    $('.contentjm a').mouseover(function(event) {


        $("#hint").css('top', (event.pageY - 40) + 'px').css('left', (event.pageX - 80) + 'px').fadeIn('slow');

    });

    $('.contentjm a').mouseout(function() {

        $("#hint").hide();

    });

});
