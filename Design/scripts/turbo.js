/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */



function check_for_empty_fields() {

    var inputfile = document.getElementById("inputfilepath").value;
    var email = document.getElementById("emailid").value;
    //alert(inputfile);
    //alert(email);
    if (inputfile === "" || inputfile === null) {

        var warn1 = "INPUTFILE\n";
        //alert("ip path null");
        document.getElementById("inputfilepath").style.backgroundColor = "#E9967A";
        $("#req1").show(500);

    }

    else {

        warn1 = "";
        //alert("ip path not null");
        document.getElementById("inputfilepath").style.backgroundColor = "white";
        $("#req1").hide(200);

    }


    if (email === "" || email === null) {

        //alert("email blasnk");
        var warn3 = "Email\n";
        document.getElementById("emailid").style.backgroundColor = "#E9967A";
        $("#req3").show(500);
        //alert("after email blasnk");

    }

    else {

        warn3 = "";
        document.getElementById("emailid").style.backgroundColor = "white";
        $("#req3").hide(200);

    }

    //alert("jst bfr checking");
    if ((warn1 === "" && warn3 === "")) {

        $("#showempty").hide(200);
        //alert("inside true condition");
        return true;

    }

    else if (warn1 !== "" || warn3 !== "") {
        $("#showempty").show(500);
        return false;

    }

}

function reset_fields() {

    document.getElementById("inputfilepath").value = "";
    document.getElementById("emailid").value = "";

}

function showstat() {

    //alert("Sdsadsa");
    var stat = document.getElementById("action_stat").value.toString();

    if (stat === "yes") {
        $("#yes").show(500);
    }

    else if (stat === "no") {
        $("#no").show(500);

    }

    else if (stat === "dflt") {
        $("#yes").hide(100);
        $("#no").hide(100);
        $("#yesupld").hide(100);
        $("#excepupld").hide(100);
        $("#noupld").hide(100);
        $("#excep").hide(100);
        $("#jobfail").hide(500);
        $("#fldrexst").hide(100);

    }

    else if (stat === "ex") {

        $("#excep").show(500);
        $("#yes").hide(100);
        $("#no").hide(100);
        $("#noupld").hide(100);
        $("#yesupld").hide(100);
        $("#excepupld").hide(100);
        $("#jobfail").hide(100);
        $("#fldrexst").hide(100);
    }

    else if (stat === "param_fail") {

        $("#param").show(500);
        $("#yes").hide(100);
        $("#no").hide(100);
        $("#excep").hide(100);
        $("#noupld").hide(100);
        $("#yesupld").hide(100);
        $("#excepupld").hide(100);
        $("#jobfail").hide(100);
        $("#fldrexst").hide(100);
    }

    else if (stat === "yesupld") {

        $("#yesupld").show(500);
        $("#noupld").hide(100);
        $("#excepupld").hide(100);
        $("#yes").hide(100);
        $("#no").hide(100);
        $("#jobfail").hide(100);
        $("#fldrexst").hide(100);

    }

    else if (stat === "noupld") {

        $("#noupld").show(500);
        $("#yesupld").hide(100);
        $("#excepupld").hide(100);
        $("#yes").hide(100);
        $("#no").hide(100);
        $("#jobfail").hide(100);
        $("#fldrexst").hide(100);

    }

    else if (stat === "excepupld") {

        $("#excepupld").show(500);
        $("#noupld").hide(100);
        $("#yesupld").hide(100);
        $("#yes").hide(100);
        $("#no").hide(100);
        $("#jobfail").hide(100);
        $("#fldrexst").hide(100);

    }

    else if (stat === "jobfail") {

        $("#jobfail").show(500);
        $("#excepupld").hide(100);
        $("#noupld").hide(100);
        $("#yesupld").hide(100);
        $("#yes").hide(100);
        $("#no").hide(100);
        $("#fldrexst").hide(100);

    }

    else if (stat === "fldrexst") {

        $("#fldrexst").show(500);
        $("#jobfail").hide(100);
        $("#excepupld").hide(100);
        $("#noupld").hide(100);
        $("#yesupld").hide(100);
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
        $("#qryfle").hide(200);
        $("#emt").hide(200);

    }


    if (info === "bp") {


        $("#bdb").hide(200);
        $("#if").hide(200);
        $("#of").hide(200);
        $("#bp").show(500);
        $("#ap").hide(200);
        $("#qryfle").hide(200);
        $("#emt").hide(200);

    }

    if (info === "qryfle") {


        $("#bdb").hide(200);
        $("#qryfle").show(500);
        $("#if").hide(200);
        $("#of").hide(200);
        $("#bp").hide(200);
        $("#ap").hide(200);
        $("#emt").hide(200);

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
        $("#qryfle").hide(200);
        $("#emt").hide(200);


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
        $("#qryfle").hide(200);
        $("#emt").hide(200);

    }



    if (info === "wrkflw") {


        $("#bdb").hide(200);
        $("#if").hide(200);
        $("#of").hide(200);
        $("#bp").hide(200);
        $("#ap").hide(200);
        $("#qryfle").hide(200);
        $("#emt").hide(200);


    }

    if (info === "emt") {


        $("#bdb").hide(200);
        $("#if").hide(200);
        $("#of").hide(200);
        $("#bp").hide(200);
        $("#ap").hide(200);
        $("#qryfle").hide(200);
        $("#emt").show(500);


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

    $("#upFile").click();


}

function do_upload(file_to_upload) {

    //alert("In do_upload function");
    var uploadable_file_path = file_to_upload;
    var filename_index = uploadable_file_path.lastIndexOf("\\");
    var uploadable_file = uploadable_file_path.substr(filename_index + 1);
    var iSize = 0;

    var reblankSpace = new RegExp(/\s/);
    // Check for white space
    if (reblankSpace.test(uploadable_file)) {
        if (confirm("Blank spaces are detected in your filename.\nIf you select this file then all the blank spaces will be\n\
replaced with '_'. \n\n Click 'Ok' to confirm or Cancel to decline")) {
            uploadable_file = uploadable_file.replace(/ /g, "_");
        }
        else
            return false;
    }

    if (confirm("Confirm this file.\n\n Filename: " + uploadable_file)) {
        //alert("inside1");
        //alert(navigator.userAgent.toLowerCase().indexOf("chrome"));

        if (navigator.userAgent.toLowerCase().indexOf("msie") > 0)
        {
            var objFSO = new ActiveXObject("Scripting.FileSystemObject");
            var sPath = $("#flUpload")[0].value;
            var objFile = objFSO.getFile(sPath);
            var iSize = objFile.size;
            iSize = iSize / 1024;
        }

        else {
            //alert("insid else");
            iSize = ($("#upFile")[0].files[0].size);
            //alert(iSize);
        }


        if (iSize > 209715200) {

            $("#upfilesize").show(500);
            $("#noupld").hide(100);
            $("#yesupld").hide(100);
            $("#excepupld").hide(100);
        }

        else if (iSize <= 209715200) {
            //alert("inside4");
            $("#upfilesize").hide(200);
            $("#noupld").hide(100);
            $("#yesupld").hide(100);
            $("#excepupld").hide(100);
            $("#showupldinstrcsn").show(400);
            document.getElementById("inputfilepath").value = uploadable_file;
        }
    }


}

function hidehint() {
    $("#schint").hide();
}

$(document).ready(function() {

    $('.content a').mouseover(function(event) {

        $("#helphint").css('top', (event.pageY - 30) + 'px').fadeIn('slow');

    });

    $('#inputfilepath').mouseover(function(event) {

        $("#schint").css('top', (event.pageY - 60) + 'px').css('left', (event.pageX + 70) + 'px').fadeIn('slow');

    });

    $('.content a').mouseout(function() {

        $("#helphint").hide();

    });
    
    $('#inputfilepath').mouseout(function() {

        $("#schint").hide();

    });

});





