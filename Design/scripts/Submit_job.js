/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


function showform(wchbtn) {

    if (wchbtn === "Yes") {


        //document.getElementById('hiddenform1').style.display = 'none';
        $("#hiddenform1").hide(750);
        //document.getElementById('hiddenform').style.display = "block";
        $("#hiddenform").show(1250);

    }

    else if (wchbtn === "No") {

        //document.getElementById('hiddenform').style.display = 'none';
        $("#hiddenform").hide(750);
        //document.getElementById('hiddenform1').style.display = 'block';
        $("#hiddenform1").show(1250);
    }

}


function check_for_empty_fields() {

    // alert("inside function");

    var scriptpath = document.getElementById("scriptpath").value.toString();
    var jobname = document.getElementById("jobname").value.toString();
    var wtime = document.getElementById("wtime").value.toString();
    var nnodes = document.getElementById("nnodes").value.toString();
    var ppn = document.getElementById("ppn").value.toString();

    //alert(scriptpath + jobname + wtime + nnodes + ppn);

    if (scriptpath === "" || scriptpath === null) {

        var warn1 = "SCRIPT PATH\n";
        document.getElementById("scriptpath").style.backgroundColor = "#E9967A";
        $("#req1").show(600);

    }

    else {

        warn1 = "";
        document.getElementById("scriptpath").style.backgroundColor = "white";
        $("#req1").hide(200);

    }


    if (jobname === "" || jobname === null) {

        var warn2 = "JOB NAME\n";
        document.getElementById("jobname").style.backgroundColor = "#E9967A";
        $("#req2").show(600);


    }

    else {

        warn2 = "";
         document.getElementById("jobname").style.backgroundColor = "white";
        $("#req2").hide(200);
    }


    if (wtime === "" || wtime === null) {


        var warn3 = "WALLCLOCKTIME\n";
        document.getElementById("wtime").style.backgroundColor = "#E9967A";
        $("#req3").show(600);

    }

    else {

        warn3 = "";
         document.getElementById("wtime").style.backgroundColor = "white";
        $("#req3").hide(200);

    }

    if (ppn === "" || ppn === null) {


        var warn4 = "PROCESS PER NODE\n";
        document.getElementById("ppn").style.backgroundColor = "#E9967A";
        $("#req4").show(600);

    }

    else {

        warn4 = "";
        document.getElementById("ppn").style.backgroundColor = "white";
        $("#req4").hide(200);

    }

    if (nnodes === "" || nnodes === null) {


        var warn5 = "NO. OF NODES\n";
        document.getElementById("nnodes").style.backgroundColor = "#E9967A";
        $("#req5").show(600);

    }

    else {

        warn5 = "";
        document.getElementById("nnodes").style.backgroundColor = "white";
        $("#req5").hide(200);

    }


    if (warn1 === "" && warn2 === "" && warn3 === "" && warn4 === "" && warn5 === "") {

        return true;
        $("#showemptyfields").hide(200);

    }

    else {

        //alert("You have not specified some information\nPlease fill the following" +
        //" fields properly\n\n" + warn1 + warn2 + warn3 + warn4 + warn5);
        $("#showemptyfields").show(600);

        return false;

    }

}

function check_for_empty_fields1() {


    var scriptpath1 = document.getElementById("scriptpath1").value;

    if (scriptpath1 === "" || scriptpath1 === null) {


        var warn1 = "SCRIPT PATH\n";
        document.getElementById("scriptpath1").style.backgroundColor = "#E9967A";
        $("#req6").show(600);


    }

    else {

        warn1 = "";
        document.getElementById("scriptpath1").style.backgroundColor = "white";
        $("#req6").hide(200);

    }

    if (warn1 === "") {

        $("#showemptyfields").hide(200);
        return true;
    }

    else {

        // alert("You have not specified some information\nPlease fill the following" +
        //       " fields properly\n\n" + warn1);

        $("#showemptyfields").show(600);
        return false;

    }

}

function reset_fields() {

    document.getElementById("scriptpath").value = "";
    document.getElementById("scriptpath1").value = "";
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
    //var excep = document.getElementById("script_param").value.toString();
    //alert(stat);

    if (stat === "yes") {

        $("#no").hide(100);
        $("#yes").show(500);
        $("#excep").hide(500);

    }

    else if (stat === "no") {
        $("#yes").hide(100);
        $("#no").show(500);
        $("#excep").hide(500);

    }

    else if (stat === "dflt") {
        $("#yes").hide(100);
        $("#no").hide(100);
        $("#excep").hide(500);

    }

    if (stat === "ex") {

        $("#excep").show(500);
        $("#yes").hide(100);
        $("#no").hide(100);

    }

}

function showme(info) {

    if (info === "rsc") {

        $("#rsc").show(500);
        $("#scp").hide(200);
        $("#jbnm").hide(200);
        $("#wlt").hide(200);
        $("#nnd").hide(200);
        $("#pn").hide(200);
        $("#oloc").hide(200);
        $("#eloc").hide(200);
        $("#em").hide(200);
        $("#emt").hide(200);
    }

    if (info === "scp") {

        $("#rsc").hide(200);
        $("#scp").show(500);
        $("#jbnm").hide(200);
        $("#wlt").hide(200);
        $("#nnd").hide(200);
        $("#pn").hide(200);
        $("#oloc").hide(200);
        $("#eloc").hide(200);
        $("#em").hide(200);
        $("#emt").hide(200);


    }

    if (info === "jbnm") {

        $("#rsc").hide(200);
        $("#scp").hide(200);
        $("#jbnm").show(500);
        $("#wlt").hide(200);
        $("#nnd").hide(200);
        $("#pn").hide(200);
        $("#oloc").hide(200);
        $("#eloc").hide(200);
        $("#em").hide(200);
        $("#emt").hide(200);


    }

    if (info === "wlt") {

        $("#rsc").hide(200);
        $("#scp").hide(200);
        $("#jbnm").hide(200);
        $("#wlt").show(500);
        $("#nnd").hide(200);
        $("#pn").hide(200);
        $("#oloc").hide(200);
        $("#eloc").hide(200);
        $("#em").hide(200);
        $("#emt").hide(200);


    }

    if (info === "nnd") {

        $("#rsc").hide(200);
        $("#scp").hide(200);
        $("#jbnm").hide(200);
        $("#wlt").hide(200);
        $("#nnd").show(500);
        $("#pn").hide(200);
        $("#oloc").hide(200);
        $("#eloc").hide(200);
        $("#em").hide(200);
        $("#emt").hide(200);


    }


    if (info === "pn") {

        $("#rsc").hide(200);
        $("#scp").hide(200);
        $("#jbnm").hide(200);
        $("#wlt").hide(200);
        $("#nnd").hide(200);
        $("#pn").show(500);
        $("#oloc").hide(200);
        $("#eloc").hide(200);
        $("#em").hide(200);
        $("#emt").hide(200);


    }

    if (info === "oloc") {

        $("#rsc").hide(200);
        $("#scp").hide(200);
        $("#jbnm").hide(200);
        $("#wlt").hide(200);
        $("#nnd").hide(200);
        $("#pn").hide(200);
        $("#oloc").show(500);
        $("#eloc").hide(200);
        $("#em").hide(200);
        $("#emt").hide(200);


    }

    if (info === "eloc") {

        $("#rsc").hide(200);
        $("#scp").hide(200);
        $("#jbnm").hide(200);
        $("#wlt").hide(200);
        $("#nnd").hide(200);
        $("#pn").hide(200);
        $("#oloc").hide(200);
        $("#eloc").show(500);
        $("#em").hide(200);
        $("#emt").hide(200);


    }

    if (info === "em") {

        $("#rsc").hide(200);
        $("#scp").hide(200);
        $("#jbnm").hide(200);
        $("#wlt").hide(200);
        $("#nnd").hide(200);
        $("#pn").hide(200);
        $("#oloc").hide(200);
        $("#eloc").hide(200);
        $("#em").show(500);
        $("#emt").hide(200);


    }

    if (info === "emt") {

        $("#rsc").hide(200);
        $("#scp").hide(200);
        $("#jbnm").hide(200);
        $("#wlt").hide(200);
        $("#nnd").hide(200);
        $("#pn").hide(200);
        $("#oloc").hide(200);
        $("#eloc").hide(200);
        $("#em").hide(200);
        $("#emt").show(500);
        

    }
    
    if (info === "wrkflw") {

        $("#rsc").hide(200);
        $("#wrkflw").show(500);
        $("#scp").hide(200);
        $("#jbnm").hide(200);
        $("#wlt").hide(200);
        $("#nnd").hide(200);
        $("#pn").hide(200);
        $("#oloc").hide(200);
        $("#eloc").hide(200);
        $("#em").hide(200);
        $("#emt").hide(200);

    }

}

$(document).ready(function() {

    $('.content a').mouseover(function(event) {


        $("#hint").css('top', (event.pageY - 10) + 'px').css('left', (event.pageX - 120) + 'px').fadeIn('slow');

    });

    $('.content a').mouseout(function() {

        $("#hint").hide();

    });

});