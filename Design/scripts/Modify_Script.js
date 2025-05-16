/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


var spinner;


function check_for_empty_fields() {

    // alert("inside function");
    $("#yes").hide(100);
    $("#no").hide(100);
    $("#excep").hide(100);

    var scriptpath = document.getElementById("scriptpath").value;
    var scriptpath_inp = scriptpath.split("/");
    var scriptpath_inp1 = scriptpath_inp[1];
    var scriptpath_inp2 = scriptpath_inp[2];
    var cnf_inp = dflt_hme.split("/");
    var cnf_inp1 = cnf_inp[1];
    var cnf_inp2 = cnf_inp[2];
    var Specialandnull = new RegExp(/^[a-zA-Z0-9._-]*$/);

    if (scriptpath === "" || scriptpath === null) {

        document.getElementById("scriptpath").style.backgroundColor = "#FF8C69";
        $("#req1").show(600);
        return false;

    }

    else {

         document.getElementById("scriptpath").style.backgroundColor = "white";
        if (scriptpath_inp1 + scriptpath_inp2 !== cnf_inp1 + cnf_inp2) {
            $("#per0").show(500);
            return false;
        }

        $("#req1").hide(200);
        if (document.getElementById("editedscript").value === "") {
            $("#showemptyfields3").show(600);
            return false;
        }

        else {
            $("#showemptyfields3").hide(200);
            if ($("input:radio[id=yes]").is(':checked')) {

                if (document.getElementById("newname").value === "" || document.getElementById("newname").value === null) {

                    $("#req2").show(600);
                    $("#showemptyfields").hide(200);
                    $("#showemptyfields1").hide(200);
                    $("#showemptyfields2").show(500);
                    return false;
                }

                else {
                    
                    if(Specialandnull.test(document.getElementById("newname").value)){
                    
                    $("#showemptyfields1").hide(200);
                    $("#showemptyfields").hide(200);
                    $("#showemptyfields2").hide(200);
                    $("#showemptyfields3").hide(200);
                    return true;
                    
                    }
                    
                    else{
                     alert("Special characters, blank spaces and 'null' are not allowed in 'Save Script As' field. Kindly change\
 the text in 'Save Script As:' field to valid filename.\n\n Valid filename consist of following characters: A-Z,a-z,0-9,_,-,.");
                     return false;   
                        
                    }
                    
                    }

            }

            else if ($("input:radio[id=no]").is(':checked')) {

                $("#showemptyfields").hide(200);
                $("#showemptyfields1").hide(200);
                $("#showemptyfields2").hide(200);
                $("#showemptyfields3").hide(200);
                return true;
            }

        }

    }

}

function show_form(wchradio)

{
    if (wchradio === "Yes")
    {
        $("#hidden_details").show(750);
    }

    else if (wchradio === "No") {
        $("#hidden_details").hide(650);
    }

}

function loadscript()
{


    var scriptpath = document.getElementById("scriptpath").value;
    var scriptpath_inp = scriptpath.split("/");
    var scriptpath_inp1 = scriptpath_inp[1];
    var scriptpath_inp2 = scriptpath_inp[2];
    //alert(scriptpath_inp1 + scriptpath_inp2);
    var cnf_inp = dflt_hme.split("/");
    var cnf_inp1 = cnf_inp[1];
    var cnf_inp2 = cnf_inp[2];

    if (scriptpath === "" || scriptpath === null) {

        $("#showemptyfields1").hide(200);
        $("#showemptyfields").show(500);
        $("#req1").show(600);
        $("#yes").hide(100);
        $("#no").hide(100);
        $("#excep").hide(100);
        return false;
    }

    else {
        //$("#test").show(200);

        if (scriptpath_inp1 + scriptpath_inp2 !== cnf_inp1 + cnf_inp2) {
            $("#per0").show(500);
            $("#req1").hide(100);
            $("#yes").hide(100);
            $("#no").hide(100);
            $("#excep").hide(100);
            $("#showemptyfields").hide(200);
            return false;
        }

        else {

            $("#per0").hide(100);
            $("#req1").hide(100);
            $("#yes").hide(100);
            $("#no").hide(100);
            $("#excep").hide(100);
            $("#showemptyfields").hide(200);

        }

        $("#light").show(200);
        $("#fade").show(200);
        $("#ani").show(200);
        var opts = {
            lines: 15, // The number of lines to draw
            length: 34, // The length of each line
            width: 13, // The line thickness
            radius: 48, // The radius of the inner circle
            corners: 1, // Corner roundness (0..1)
            rotate: 22, // The rotation offset
            direction: 1, // 1: clockwise, -1: counterclockwise
            color: '#FFFFFF', // #rgb or #rrggbb or array of colors
            speed: 1.4, // Rounds per second
            trail: 66, // Afterglow percentage
            shadow: false, // Whether to render a shadow
            hwaccel: false, // Whether to use hardware acceleration
            className: 'spinner', // The CSS class to assign to the spinner
            zIndex: 2e9, // The z-index (defaults to 2000000000)
            top: 'auto', // Top position relative to parent in px
            left: 'auto' // Left position relative to parent in px
        };
        var target = document.getElementById('light');
        var spinner = new Spinner(opts).spin(target);
        document.getElementById("editedscript").readOnly = false;
        xmlhttp = GetXmlHttpObject();
        if (xmlhttp === null)
        {
            alert("Your browser does not support Ajax HTTP");
            return;
        }

        var url = "../../DisplayScript/display.jsp";
        url = url + "?scriptpath=" + scriptpath;
        xmlhttp.onreadystatechange = getOutput;
        //alert("3");
        xmlhttp.open("GET", url, true);
        xmlhttp.send(null);
    }
}


function getOutput()
{
    if (xmlhttp.readyState === 4)
    {

        document.getElementById("editedscript").innerHTML = xmlhttp.responseText.trim();
        $("#light").hide(100);
        $("#fade").hide(100);
        $("#ani").hide(100);
        //alert(xmlhttp.responseText.trim());

    }

}

function GetXmlHttpObject()
{
    if (window.XMLHttpRequest)
    {
        return new XMLHttpRequest();
    }
    if (window.ActiveXObject)
    {
        return new ActiveXObject("Microsoft.XMLHTTP");
    }
    return null;
}


function showstat() {

    //alert("Sdsadsa");
    var stat = document.getElementById("action_stat").value;
    //alert(stat);

    // $('#page').show('slide', {direction: 'right'}, 1000);

    if (stat === "yes") {

        $("#yes").show(500);
        $("#no").hide(100);
        $("#excep").hide(100);
    }

    else if (stat === "no") {
        $("#no").show(500);
        $("#yes").hide(100);
        $("#excep").hide(100);
    }

    else if (stat === "dflt") {
        $("#yes").hide(100);
        $("#no").hide(100);
        $("#excep").hide(100);
        $("#per0").hide(100);
    }

    else if (stat === "ex") {

        $("#excep").show(500);
        $("#yes").hide(100);
        $("#no").hide(100);
    }

}

function reset_fields() {

    $("input:radio[id=yes]").attr("checked", false);
    $("input:radio[id=no]").attr("checked", false);
    $("#scriptpath").val("");
    $("#editedscript").val("");
    $("#newname").val("");
    $("#hidden_details").hide(100);

}

function showme(info) {

    if (info === "scriptpath") {

        $("#scrpa").show(500);
        $("#edpnl").hide(200);
        $("#svas").hide(200);
        $("#svsrptas").hide(200);
    
    }

    if (info === "edit") {

        $("#edpnl").show(500);
        $("#scrpa").hide(200);
        $("#svas").hide(200);
        $("#svsrptas").hide(200);

    }

    if (info === "saveas") {

        $("#svas").show(500);
        $("#edpnl").hide(200);
        $("#scrpa").hide(200);
        $("#svsrptas").hide(200);


    }

    if (info === "savescas") {

        $("#svsrptas").show(500);
        $("#svas").hide(200);
        $("#edpnl").hide(200);
        $("#scrpa").hide(500);

    }

    if (info === "wrkflw") {

        $("#wrkflw").show(500);
        $("#svsrptas").hide(200);
        $("#svas").hide(200);
        $("#edpnl").hide(200);
        $("#scrpa").hide(200);

    }

}

$(document).ready(function() {

    $('.content a').mouseover(function(event) {


        $("#hint").css('top', (event.pageY - 40) + 'px').css('left', (event.pageX - 120) + 'px').fadeIn('slow');

    });

    $('.content a').mouseout(function() {

        $("#hint").hide();

    });

});