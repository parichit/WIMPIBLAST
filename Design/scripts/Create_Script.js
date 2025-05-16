/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function check_for_empty_fields() {

    var scriptname = document.getElementById("scriptname").value.toString();
    var jobname = document.getElementById("jobname").value.toString();
    var wtime = document.getElementById("wtime").value.toString();
    var nnodes = document.getElementById("nnodes").value.toString();
    var ppn = document.getElementById("ppn").value.toString();
    var reSpaceandspecial = new RegExp(/^[a-zA-Z0-9_.-]*$/);

    //alert(scriptname + jobname + wtime + nnodes + ppn);

    if (scriptname === "" || scriptname === null) {

        var warn1 = "SCRIPT NAME\n";
        $("#scriptname").css('backgroundColor', "#FF8C69");
        $("#vldsc").hide(200);
        $("#req1").show(600);

    }

    else {

        warn1 = "";
        document.getElementById("scriptname").style.backgroundColor = "white";
        $("#req1").hide(200);
        

    }

    if (jobname === "" || jobname === null) {

        var warn2 = "JOB NAME\n";
        document.getElementById("jobname").style.backgroundColor = "#FF8C69";
        $("#req2").show(600);
        $("#vldjb").hide(200);

    }

    else {

        warn2 = "";
        document.getElementById("jobname").style.backgroundColor = "white";
        $("#req2").hide(200);
    }

    if (wtime === "" || wtime === null) {

        var warn3 = "WALLCLOCKTIME\n";
        document.getElementById("wtime").style.backgroundColor = "#FF8C69";
        $("#req3").show(600);

    }

    else {

        warn3 = "";
        document.getElementById("wtime").style.backgroundColor = "white";
        $("#req3").hide(200);

    }

    if (ppn === "" || ppn === null) {


        var warn4 = "PROCESS PER NODE\n";
        document.getElementById("ppn").style.backgroundColor = "#FF8C69";
        $("#req5").show(600);

    }

    else {

        warn4 = "";
        document.getElementById("ppn").style.backgroundColor = "white";
        $("#req5").hide(200);

    }

    if (nnodes === "" || nnodes === null) {
        var warn5 = "NO. OF NODES\n";
        document.getElementById("nnodes").style.backgroundColor = "#FF8C69";
        $("#req4").show(600);
    }

    else {

        warn5 = "";
        document.getElementById("nnodes").style.backgroundColor = "white";
        $("#req4").hide(200);

    }

    if (!reSpaceandspecial.test(scriptname)) {

        var warn6 = "invalid\n";
        document.getElementById("scriptname").style.backgroundColor = "#FF8C69";
        $("#scriptname").val("");
        $("#vldsc").show(500);
        $("#req1").hide(200);

    }

    else {
        warn6 = "";
        $("#vldsc").hide(200);
        //document.getElementById("scriptname").style.backgroundColor = "white";

    }

    if (!reSpaceandspecial.test(jobname)) {

        var warn7 = "invalid\n";
        document.getElementById("jobname").style.backgroundColor = "#FF8C69";
        $("#jobname").val("");
        $("#vldjb").show(500);
        $("#req2").hide(200);

    }

    else {
        warn7 = "";
        $("#vldjb").hide(200);
        //document.getElementById("jobname").style.backgroundColor = "white";

    }

    if (warn1 === "" && warn2 === "" && warn3 === "" && warn4 === "" && warn5 === "" && warn6 === "" && warn7 === "") {

        //alert("out" + outloc + "err" + errloc + "dflt" + dflt_hme);
        $("#showemptyfields").hide(200);
        $("#scrptjbnmovrrite").hide(200);
        $("#req1").hide(200);
        $("#req2").hide(200);
        $("#req3").hide(200);
        $("#req4").hide(200);
        $("#req5").hide(200);
        $("#invld").hide(200);
        return true;

    }


    else if ((warn1 !== "" || warn2 !== "" || warn3 !== "" || warn4 !== "" || warn5 !== "")) {

        $("#showemptyfields").show(500);
        return false;

    }

    else if (warn6 !== "" || warn7 !== "") {

        $("#invld").show(500);
        $("#showemptyfields").hide(200);
        return false;

    }

}

function reset_fields() {

    document.getElementById("scriptname").value = "";
    document.getElementById("jobname").value = "";
    document.getElementById("wtime").value = "";
    document.getElementById("nnodes").value = "";
    document.getElementById("ppn").value = "";
    document.getElementById("outputloc").value = "";
    document.getElementById("errorloc").value = "";
    document.getElementById("start").checked = false;
    document.getElementById("end").checked = false;
    document.getElementById("abort").checked = false;
    document.getElementById("emailid").value = "";

}


function showstat() {

    //alert("Sdsadsa");
    var stat = document.getElementById("action_stat").value.toString();

    if (stat === "no") {
        $("#no").show(500);
        $("#excep").hide(500);

    }

    else if (stat === "dflt") {

        $("#no").hide(100);
        $("#excep").hide(500);


    }

    else if (stat === "ex") {

        $("#excep").show(500);
        $("#no").hide(100);

    }

    else if (stat === "fldrexst") {

        $("#fldrexst").show(500);
        $("#no").hide(100);
        $("#fldrexcep").hide(100);
        $("#excep").hide(100);
        $("#fileexst").hide(100);
        $("#prmcnflct").hide(100);
        $("#no").hide(100);

    }

    else if (stat === "fldrexcep") {

        $("#fldrexcep").show(500);
        $("#no").hide(100);
        $("#fldrexst").hide(100);
        $("#excep").hide(100);
        $("#fileexst").hide(100);
        $("#dtaexcep").hide(100);
        $("#prmcnflct").hide(100);
        $("#no").hide(100);


    }

    else if (stat === "dtaexcep") {

        $("#dtaexcep").show(500);
        $("#no").hide(100);
        $("#fldrexst").hide(100);
        $("#fldrexcep").hide(100);
        $("#dtaexcep").hide(100);
        $("#fileexst").hide(100);
        $("#excep").hide(100);
        $("#prmcnflct").hide(100);
        $("#no").hide(100);


    }

    else if (stat === "fileexst") {

        $("#fileexst").show(500);
        $("#no").hide(100);
        $("#fldrexst").hide(100);
        $("#fldrexcep").hide(100);
        $("#dtaexcep").hide(100);
        $("#excep").hide(100);
        $("#prmcnflct").hide(100);
        $("#no").hide(100);


    }

    else if (stat === "prmcnflct") {

        $("#prmcnflct").show(500);
        $("#no").hide(100);
        $("#fldrexst").hide(100);
        $("#fldrexcep").hide(100);
        $("#dtaexcep").hide(100);
        $("#prmcnflct").hide(100);
        $("#excep").hide(100);
        $("#no").hide(100);


    }


}

function showme(info) {

    //alert(info);


    if (info === "scriptname") {

        $('#scrnm').show(400);
        $('#wlt').hide(200);
        $('#jbnm').hide(200);
        $('#nnd').hide(200);
        $('#pn').hide(200);
        $('#oloc').hide(200);
        $('#eloc').hide(200);
        $('#em').hide(200);
        $('#emt').hide(200);


    }

    else if (info === "jobname") {

        $('#jbnm').show(400);
        $('#wlt').hide(200);
        $('#nnd').hide(200);
        $('#pn').hide(200);
        $('#oloc').hide(200);
        $('#eloc').hide(200);
        $('#em').hide(200);
        $('#emt').hide(200);
        $('#scrnm').hide(200);

    }

    else if (info === "wlt") {

        $('#wlt').show(400);
        $('#jbnm').hide(200);
        $('#nnd').hide(200);
        $('#pn').hide(200);
        $('#oloc').hide(200);
        $('#eloc').hide(200);
        $('#em').hide(200);
        $('#emt').hide(200);
        $('#scrnm').hide(200);


    }

    else if (info === "nnodes") {

        $('#nnd').show(400);
        $('#wlt').hide(200);
        $('#jbnm').hide(200);
        $('#pn').hide(200);
        $('#oloc').hide(200);
        $('#eloc').hide(200);
        $('#em').hide(200);
        $('#emt').hide(200);
        $('#scrnm').hide(200);

    }

    else if (info === "ppn") {

        $('#pn').show(400);
        $('#wlt').hide(200);
        $('#jbnm').hide(200);
        $('#nnd').hide(200);
        $('#oloc').hide(200);
        $('#eloc').hide(200);
        $('#em').hide(200);
        $('#emt').hide(200);
        $('#scrnm').hide(200);


    }

    else if (info === "outputloc") {

        $('#oloc').show(400);
        $('#wlt').hide(200);
        $('#jbnm').hide(200);
        $('#nnd').hide(200);
        $('#pn').hide(200);
        $('#eloc').hide(200);
        $('#em').hide(200);
        $('#emt').hide(200);
        $('#scrnm').hide(200);


    }

    else if (info === "errorloc") {

        $('#eloc').show(400);
        $('#wlt').hide(200);
        $('#jbnm').hide(200);
        $('#nnd').hide(200);
        $('#pn').hide(200);
        $('#oloc').hide(200);
        $('#em').hide(200);
        $('#emt').hide(200);
        $('#scrnm').hide(200);

    }

    else if (info === "email") {

        $('#em').show(400);
        $('#wlt').hide(200);
        $('#jbnm').hide(200);
        $('#nnd').hide(200);
        $('#pn').hide(200);
        $('#oloc').hide(200);
        $('#eloc').hide(200);
        $('#emt').hide(200);
        $('#scrnm').hide(200);

    }

    else if (info === "emailto") {

        $('#emt').show(400);
        $('#wlt').hide(200);
        $('#jbnm').hide(200);
        $('#nnd').hide(200);
        $('#pn').hide(200);
        $('#oloc').hide(200);
        $('#eloc').hide(200);
        $('#em').hide(200);
        $('#scrnm').hide(200);

    }

    else if (info === "wrkflw") {

        $('#wrkflw').show(400);
        $('#emt').hide(200);
        $('#wlt').hide(200);
        $('#jbnm').hide(200);
        $('#nnd').hide(200);
        $('#pn').hide(200);
        $('#oloc').hide(200);
        $('#eloc').hide(200);
        $('#em').hide(200);
        $('#scrnm').hide(200);


    }

}


function hidehint() {
    $("#schint").hide();
}

$(document).ready(function() {

    $('.content a').mouseover(function(event) {


        $("#hint").css('top', (event.pageY - 10) + 'px').css('left', (event.pageX - 120) + 'px').fadeIn('slow');

    });

    $('.content a').mouseout(function() {

        $("#hint").hide();

    });

});

$(document).ready(function() {

    $('#scriptname').mouseover(function(event) {

        $("#schint").css('top', (event.pageY - 40) + 'px').css('left', (event.pageX + 70) + 'px').fadeIn('slow');

    });

    $('#jobname').mouseover(function(event) {

        $("#schint").css('top', (event.pageY - 40) + 'px').css('left', (event.pageX + 70) + 'px').fadeIn('slow');

    });

    $('#scriptname').mouseout(function() {

        $("#schint").hide();

    });

    $('#jobname').mouseout(function() {

        $("#schint").hide();

    });

});




