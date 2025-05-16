/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */



function check_for_empty_fields() {

    var inputfile = document.getElementById("inputfilepath").value;
    var outputfile = document.getElementById("outputfilepath").value;
    var blastdb = document.getElementById("blastdb");
    var db = blastdb.options[blastdb.selectedIndex].value;

    //alert(db);

    if (inputfile === "" || inputfile === null) {

        var warn1 = "INPUT FILE \n";
        document.getElementById("inputfilepath").style.backgroundColor = "#E9967A";
        $("#req2").show(600);

    }

    else {


        warn1 = "";
        document.getElementById("inputfilepath").style.backgroundColor = "white";
        $("#req2").hide(200);

    }

    if (outputfile === "" || outputfile === null) {

        var warn2 = "OUTPUT FILE \n";
        document.getElementById("outputfilepath").style.backgroundColor = "#E9967A";
        $("#req3").show(600);

    }
    else {

        warn2 = "";
        document.getElementById("outputfilepath").style.backgroundColor = "white";
        $("#req3").hide(200);

    }

    if (db === "" || db === null) {

        var warn3 = "BLAST DB \n";
        $("#req1").show(600);

    }

    else {

        warn3 = "";
        $("#req1").hide(600);

    }

    if (warn1 === "" && warn2 === "" && warn3 === "") {

        $("#showemptyfields").hide(200);
        return true;

    }

    else {

        //alert("You have not specified some information\nPlease fill the following" +
        //"fields properly\n\n" + warn1 + warn2);

        $("#showemptyfields").show(600);

        return false;
    }

}


function reset_fields() {

    document.getElementById("inputfilepath").value = "";
    document.getElementById("outputfilepath").value = "";
    document.getElementById("adparam").value = "";

}

function showstat() {

    //alert("Sdsadsa");
    var stat = document.getElementById("action_stat").value.toString();
    //$("#button").css({ opacity: 0.4 });
    //$("#button").attr('disabled','true');
    //alert(document.getElementById("button").value);

    if (stat === "yes") {

        $("#yes").show(500);

    }

    else if (stat === "no") {
        $("#no").show(500);

    }

    else if (stat === "dflt") {
        $("#yes").hide(100);
        $("#no").hide(100);
        $("#excepupld").hide(100);
        $("#noupld").hide(100);
        $("#excep").hide(100);
        $("#jobfail").hide(500);

    }

    else if (stat === "ex") {

        $("#excep").show(500);
        $("#yes").hide(100);
        $("#no").hide(100);
        $("#noupld").hide(100);
        $("#excepupld").hide(100);
        $("#jobfail").hide(500);
    }

    else if (stat === "param_fail") {

        $("#param").show(500);
        $("#yes").hide(100);
        $("#no").hide(100);
        $("#excep").hide(100);
        $("#noupld").hide(100);
        $("#excepupld").hide(100);
        $("#jobfail").hide(500);
    }

    else if (stat === "noupld") {

        $("#noupld").show(500);
        $("#excepupld").hide(100);
        $("#yes").hide(100);
        $("#no").hide(100);
        $("#jobfail").hide(500);


    }

    else if (stat === "excepupld") {

        $("#excepupld").show(500);
        $("#noupld").hide(100);
        $("#yes").hide(100);
        $("#no").hide(100);
        $("#jobfail").hide(500);

    }

    else if (stat === "jobfail") {

        $("#jobfail").show(500);
        $("#excepupld").hide(500);
        $("#noupld").hide(100);
        $("#yes").hide(100);
        $("#no").hide(100);

    }

}

function showme(info) {

    if (info === "bdb") {

        $("#bdb").show(500);
        $("#if").hide(200);
        $("#of").hide(200);
        $("#bp").hide(200);
        $("#ap").hide(200);

    }

    if (info === "if") {

        $("#bdb").hide(200);
        $("#if").show(500);
        $("#of").hide(200);
        $("#bp").hide(200);
        $("#ap").hide(200);

    }
    if (info === "of") {

        $("#bdb").hide(200);
        $("#if").hide(200);
        $("#of").show(500);
        $("#bp").hide(200);
        $("#ap").hide(200);

    }

    if (info === "bp") {

        $("#bdb").hide(200);
        $("#if").hide(200);
        $("#of").hide(200);
        $("#bp").show(500);
        $("#ap").hide(200);

    }

    if (info === "ap") {

        $("#bdb").hide(200);
        $("#if").hide(200);
        $("#of").hide(200);
        $("#bp").hide(200);
        $("#ap").show(400);
        $('.advanceparam').show();
        $('.advancetext').show();
        $("#hideap").show();
        $("#showap").hide();

    }

    if (info === "hideap") {

        $("#bdb").hide(200);
        $("#if").hide(200);
        $("#of").hide(200);
        $("#bp").hide(200);
        $("#ap").hide(200);
        $('.advanceparam').hide();
        $('.advancetext').hide();
        $("#hideap").hide();
        $("#showap").show();

    }

    if (info === "wrkflw") {

        $("#bdb").hide(200);
        $("#if").hide(200);
        $("#of").hide(200);
        $("#bp").hide(200);
        $("#ap").hide(500);

    }

}

function hideparam() {

    $("#light").hide(200);
    $("#fade").hide(200);

}

function showhelp() {

    $("#light").show(500);
    $("#fade").show(500);

}

function do_click() {

    $("#uploadFile").click();

}

function do_upload(file_to_upload) {

    //alert("In do_upload function");
    var uploadable_file_path = file_to_upload;
    var filename_index = uploadable_file_path.lastIndexOf("\\");
    var uploadable_file = uploadable_file_path.substr(filename_index + 1);
    var reWhiteSpace = new RegExp(/\s/);
    // Check for white space
    if (reWhiteSpace.test(uploadable_file)) {
        if (confirm("Blank spaces are detected in your filename.\nIf you select this file then all the blank spaces will be\n\
replaced with '_'. \n\n Click 'Ok' to confirm or Cancel to decline")) {
            uploadable_file = uploadable_file.replace(/ /g, "_");
        }
        else
            return false;

    }


    if (confirm("Confirm the filename.\n\n Filename: " + uploadable_file)) {
        //alert("inside1");
        var iSize = 0;
        if (navigator.userAgent.toLowerCase().indexOf("msie") > 0)
        {
            var objFSO = new ActiveXObject("Scripting.FileSystemObject");
            var sPath = $("#flUpload")[0].value;
            var objFile = objFSO.getFile(sPath);
            var iSize = objFile.size;
            iSize = iSize / 1024;
        }

        else {
            iSize = ($("#uploadFile")[0].files[0].size);
            //alert(iSize);
        }


        if (iSize > 209715200) {

            $("#upfilesize").show(500);
            $("#noupld").hide(100);
            $("#yesupld").hide(100);
            $("#excepupld").hide(100);
            return false;
        }

        else if (iSize <= 209715200) {

            $("#yesupld").show(500);
            $("#upfilesize").hide(200);
            $("#noupld").hide(100);
            $("#excepupld").hide(100);
            $("#inputfilepath").val(homedir + "WIMPIHome/" + job_dir + "/" + uploadable_file.trim());
            $("#outputfilepath").val(homedir + "WIMPIHome/" + job_dir + "/" + uploadable_file.trim() + "_result");
            return true;
        }
    }
    else
        return false;

}

$(document).ready(function() {

    $('.content a').mouseover(function(event) {


        $("#hint").css('top', (event.pageY - 30) + 'px').fadeIn('slow');

    });

    $('.content a').mouseout(function() {

        $("#hint").hide();

    });

});



