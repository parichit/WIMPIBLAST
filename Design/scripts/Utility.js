

function contentsFunction(dir_k, element_value) {

    //alert(element_value);

    var content = document.getElementById(dir_k);

    // alert(content.innerHTML);

    if (content.innerHTML === "") {

        //alert("nknskjanda");

        var ajaxRequest;

        try {

            ajaxRequest = new XMLHttpRequest();
        } catch (e) {

            try {
                ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
            } catch (e) {
                try {
                    ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
                } catch (e) {

                    alert("Your browser broke!");
                    return false;
                }
            }
        }

        ajaxRequest.onreadystatechange = function() {
            if (ajaxRequest.readyState === 4) {

                var ajaxDisplay = document.getElementById(dir_k);

                ajaxDisplay.innerHTML = ajaxRequest.responseText;

            }
        };
        ajaxRequest.open("GET", "modules/DirNavigation/extend.jsp?inode=" + dir_k, true);
        ajaxRequest.send();

    }

    else {

        content.innerHTML = "";
        //alert("sfhakshdfk");

    }

    document.getElementById('file_to_be_downloaded').value = element_value;
    document.getElementById('files_or_directories').value = "directory";
    document.getElementById('unique_key_for_directory').value = dir_k;

    find_dir_path(dir_k);

}


function find_dir_path(dir_k) {

    //$("#showdir").show(200);
    $("#directory_path").css('background', ("#BF94E4"));
    $("#directory_path").text("Loading Directory Path ... Please Wait");
    $("#showloc").show(200);

    var ajaxRequest_dir;

    try {

        ajaxRequest_dir = new XMLHttpRequest();
    } catch (e) {

        try {
            ajaxRequest_dir = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e) {
            try {
                ajaxRequest_dir = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e) {

                alert("Your browser broke!");
                return false;
            }
        }
    }


    ajaxRequest_dir.onreadystatechange = function() {

        if (ajaxRequest_dir.readyState === 4) {
            $("#directory_path").css('background', ("white"));
            document.getElementById("directory_path").innerHTML = ajaxRequest_dir.responseText.trim();
            document.getElementById("folder_location").value = ajaxRequest_dir.responseText.trim();
            $("#showloc").hide();

        }
    };

    ajaxRequest_dir.open("GET", "modules/DirNavigation/d_pathfinder.jsp?d_p_k=" + dir_k, true);
    ajaxRequest_dir.send();

}

function do_download(file_to_download, unique_value) {

    $("#file_path").css('background', ("#BF94E4"));
    $("#file_path").text("Loading File Path ... Please Wait");

    var ajaxRequest_files;

    document.getElementById('file_to_be_downloaded').value = file_to_download;
    document.getElementById('new').value = file_to_download;
    document.getElementById('files_or_directories').value = "files";
    document.getElementById("unique_key_for_files").value = unique_value;

    try {

        ajaxRequest_files = new XMLHttpRequest();
    } catch (e) {

        try {
            ajaxRequest_files = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e) {
            try {
                ajaxRequest_files = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e) {

                alert("Your browser broke!");
                return false;
            }
        }
    }


    ajaxRequest_files.onreadystatechange = function() {

        if (ajaxRequest_files.readyState === 4) {

            $("#file_path").css('background', ("white"));
            document.getElementById("file_path").innerHTML = ajaxRequest_files.responseText.toString().trim();
            ;

            $("#showfile").hide(100);
            $("#showsize").hide(100);
        }
    };

    ajaxRequest_files.open("GET", "modules/DirNavigation/f_pathfinder.jsp?f_p_k=" + unique_value, true);
    ajaxRequest_files.send();

}

function do_upload(file_to_upload) {


    var uploadable_file_path = file_to_upload;
    var filename_index = uploadable_file_path.lastIndexOf("\\");
    var uploadable_file = uploadable_file_path.substr(filename_index + 1);
    var Specialandnull = new RegExp(/^[a-zA-Z0-9._-]*$/);

    if (!Specialandnull.test(uploadable_file) || uploadable_file === "" || uploadable_file === null || uploadable_file === "null") {
        alert("Special characters, blank spaces and'null' are not allowed in file names. Kindly change the file name and retry upload.\
 Allowed characters are 'A-Z,a-z,0-9,-,_,.'(comma is not allowed)\n\nPress ok to confirm.");
        return false;
    }

    if (confirm("Confirm File: " + uploadable_file)) {
        document.getElementById("file_to_be_uploaded").value = uploadable_file;

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

        }

        if (iSize > uploadsize) {
            
            $("#upfilesize").show(500);
            $("#showmissingfield1").hide(100);
            $("#showmissingfield2").hide(100);
            $("#showmissingfield3").hide(100);
            $("#showmissingfield4").hide(100);
            $("#showmissingfield5").hide(100);
            $("#noupld").hide(100);
            $("#yesupld").hide(100);
            $("#nodwn").hide(100);
            $("#excepdwn").hide(100);
            $("#excepupld").hide(100);
            $("#upldfile").prop("disabled", true);
            return false;
        }

        else if (iSize < uploadsize) {
            
            $("#upldfile").prop("disabled", false);
            $("#upfilesize").hide(200);
            $("#noupld").hide(100);
            $("#yesupld").hide(100);
            $("#nodwn").hide(100);
            $("#excepdwn").hide(100);
            $("#excepupld").hide(100);
            $("#showmissingfield1").hide(100);
            $("#showmissingfield2").hide(100);
            $("#showmissingfield3").hide(100);
            $("#showmissingfield4").hide(100);
            $("#showmissingfield5").hide(100);
            return true;

        }
    }

    else {
        document.getElementById("file_to_be_uploaded").value = "";
        return false;

    }

}

function openscript() {


    var vw_scrpt = document.getElementById("new").value;

    if (vw_scrpt === "" || vw_scrpt === null) {

        $("#showmissingfield3").show(500);
        $("#new").css('backgroundColor', "#FF8C69");
        $("#showmissingfield1").hide(100);
        $("#showmissingfield2").hide(100);
        $("#showmissingfield4").hide(100);
        $("#showmissingfield5").hide(100);
        $("#fldrwarn").hide(100);
        $("#upfilesize").hide(100);
        $("#noupld").hide(100);
        $("#yesupld").hide(100);
        $("#nodwn").hide(100);
        $("#excepdwn").hide(100);
        $("#excepupld").hide(100);

        return false;

    }

    else {


        var key_for_files = document.getElementById("unique_key_for_files").value;
        window.open("modules/Utility/openfile.jsp?key_for_script=" + key_for_files);
        return true;
    }

}

function openselectivefile() {



    var vw_scrpt = document.getElementById("new").value;

    if (vw_scrpt === "" || vw_scrpt === null)

    {

        $("#showmissingfield5").show(500);
        $("#new").css('backgroundColor', "#FF8C69");
        $("#showmissingfield4").hide(100);
        $("#showmissingfield3").hide(100);
        $("#showmissingfield1").hide(100);
        $("#showmissingfield2").hide(100);
        $("#fldrwarn").hide(100);
        $("#upfilesize").hide(100);
        $("#noupld").hide(100);
        $("#yesupld").hide(100);
        $("#nodwn").hide(100);
        $("#excepdwn").hide(100);
        $("#excepupld").hide(100);

        return false;

    }

    else {

        var filesection = document.getElementById("selectedfilepart").value;

        if (filesection === "" || filesection === null) {

            $("#showmissingfield4").show(500);
            $("#showmissingfield5").hide(100);
            $("#showmissingfield3").hide(100);
            $("#showmissingfield1").hide(100);
            $("#showmissingfield2").hide(100);
            $("#upfilesize").hide(100);
            $("#noupld").hide(100);
            $("#yesupld").hide(100);
            $("#nodwn").hide(100);
            $("#excepdwn").hide(100);
            $("#excepupld").hide(100);
            return false;

        }
        else {

            var key_for_files = document.getElementById("unique_key_for_files").value;
            window.open("modules/Utility/openselectivefile.jsp?key_for_files=" + key_for_files + "&filesection=" + filesection);
            return true;


        }
    }

}

function unselectother(wchradio) {

    if (wchradio === "50t") {

        document.getElementById("selectedfilepart").value = "50t";
        $("#200t").prop("checked", false);
        $("#500t").prop("checked", false);
        $("#50b").prop("checked", false);
        $("#200b").prop("checked", false);
        $("#500b").prop("checked", false);


    }

    else if (wchradio === "200t") {

        document.getElementById("selectedfilepart").value = "200t";
        $("#50t").prop("checked", false);
        $("#500t").prop("checked", false);
        $("#50b").prop("checked", false);
        $("#200b").prop("checked", false);
        $("#500b").prop("checked", false);


    }

    else if (wchradio === "500t") {

        document.getElementById("selectedfilepart").value = "500t";
        $("#50t").prop("checked", false);
        $("#200t").prop("checked", false);
        $("#50b").prop("checked", false);
        $("#200b").prop("checked", false);
        $("#500b").prop("checked", false);


    }

    else if (wchradio === "50b") {

        document.getElementById("selectedfilepart").value = "50b";
        $("#500b").prop("checked", false);
        $("#200b").prop("checked", false);
        $("#50t").prop("checked", false);
        $("#200t").prop("checked", false);
        $("#500t").prop("checked", false);


    }

    else if (wchradio === "200b") {

        document.getElementById("selectedfilepart").value = "200b";
        $("#500b").prop("checked", false);
        $("#50b").prop("checked", false);
        $("#50t").prop("checked", false);
        $("#200t").prop("checked", false);
        $("#500t").prop("checked", false);


    }

    else if (wchradio === "500b") {

        document.getElementById("selectedfilepart").value = "500b";
        $("#50b").prop("checked", false);
        $("#200b").prop("checked", false);
        $("#50t").prop("checked", false);
        $("#200t").prop("checked", false);
        $("#500t").prop("checked", false);


    }

}


function showstat() {


    $("#controltreeviewlook").slideDown(300);

    var stat = document.getElementById("action_stat").value;


    if (stat === "nodwn") {
        $("#nodwn").show(500);
        $("#excepdwn").hide(100);
        $("#yesuplod").hide(100);
        $("#noupld").hide(100);
        $("#excepupld").hide(100);

    }

    else if (stat === "dflt") {
        $("#nodwn").hide(100);
        $("#excepdwn").hide(100);
        $("#yesuplod").hide(100);
        $("#noupld").hide(100);
        $("#excepupld").hide(100);

    }

    else if (stat === "excepdwn") {

        $("#excepdwn").show(500);
        $("#nodwn").hide(100);
        $("#yesuplod").hide(100);
        $("#noupld").hide(100);
        $("#excepupld").hide(100);

    }

    else if (stat === "yesupld") {

        $("#yesupld").show(500);
        $("#noupld").hide(100);
        $("#excepupld").hide(100);
        $("#nodwn").hide(100);
        $("#excepdwn").hide(100);

    }

    else if (stat === "noupld") {

        $("#noupld").show(500);
        $("#yesupld").hide(100);
        $("#excepupld").hide(100);
        $("#nodwn").hide(100);
        $("#excepdwn").hide(100);

    }

    else if (stat === "excepupld") {

        $("#excepupld").show(500);
        $("#noupld").hide(100);
        $("#yesupld").hide(100);
        $("#nodwn").hide(100);
        $("#excepdwn").hide(100);

    }

    return true;
}

function chkfile(buttonvalue) {

    if (buttonvalue === "Download") {


        var fle_to_dwnld = document.getElementById("file_to_be_downloaded").value;

        if (fle_to_dwnld === "" || fle_to_dwnld === null) {

            $("#showmissingfield1").show(500);
            $("#file_to_be_downloaded").css('backgroundColor', "#FF8C69");
            $("#showmissingfield2").hide(100);
            $("#showmissingfield3").hide(100);
            $("#showmissingfield4").hide(100);
            $("#showmissingfield5").hide(100);
            $("#fldrwarn").hide(100);
            $("#upfilesize").hide(100);
            $("#noupld").hide(100);
            $("#yesupld").hide(100);
            $("#nodwn").hide(100);
            $("#excepdwn").hide(100);
            $("#excepupld").hide(100);

            return false;

        }

        else {

            return true;
        }

    }

    else if (buttonvalue === "Upload File") {

        if (document.getElementById("file_to_be_uploaded").value === "" || null) {
            $("#showmissingfield2").show(500);
            $("#file_to_be_uploaded").css('backgroundColor', "#FF8C69");
            $("#showmissingfield1").hide(100);
            $("#showmissingfield3").hide(100);
            $("#showmissingfield4").hide(100);
            $("#showmissingfield5").hide(100);
            $("#fldrwarn").hide(100);
            $("#upfilesize").hide(100);
            $("#yesupld").hide(100);
            $("#nodwn").hide(100);
            $("#excepdwn").hide(100);
            $("#excepupld").hide(100);
            return false;
        }
        else {
            var fle_to_upld = document.getElementById("uploadFile").value;

            if (fle_to_upld === "" || fle_to_upld === null) {

                return false;

            }

            else {

                return true;
            }

        }
    }

}

function showme(info) {

    if (info === "bhm") {

        $("#bhm").show(500);
        $("#df").hide(200);
        $("#uf").hide(200);
        $("#vs").hide(200);
        $("#vft").hide(200);
        $("#vfb").hide(200);
        $("#dp").hide(200);
        $("#fp").hide(200);
        $("#fp").hide(200);

    }

    if (info === "df") {

        $("#bhm").hide(200);
        $("#df").show(500);
        $("#uf").hide(200);
        $("#vs").hide(200);
        $("#vft").hide(200);
        $("#vfb").hide(200);
        $("#dp").hide(200);
        $("#fp").hide(200);
        $("#nfl").hide(200);

    }

    if (info === "uf") {

        $("#bhm").hide(200);
        $("#df").hide(200);
        $("#uf").show(500);
        $("#vs").hide(200);
        $("#vft").hide(200);
        $("#vfb").hide(200);
        $("#dp").hide(200);
        $("#fp").hide(200);
        $("#nfl").hide(200);

    }
    if (info === "vs") {

        $("#bhm").hide(200);
        $("#df").hide(200);
        $("#uf").hide(200);
        $("#vs").show(500);
        $("#vft").hide(200);
        $("#vfb").hide(200);
        $("#dp").hide(200);
        $("#fp").hide(200);
        $("#nfl").hide(200);

    }

    if (info === "vft") {

        $("#bhm").hide(200);
        $("#df").hide(200);
        $("#uf").hide(200);
        $("#vs").hide(200);
        $("#vft").show(500);
        $("#vfb").hide(200);
        $("#dp").hide(200);
        $("#fp").hide(200);
        $("#nfl").hide(200);

    }

    if (info === "vfb") {

        $("#bhm").hide(200);
        $("#df").hide(200);
        $("#uf").hide(200);
        $("#vs").hide(200);
        $("#vft").hide(200);
        $("#vfb").show(500);
        $("#dp").hide(200);
        $("#fp").hide(200);
        $("#nfl").hide(200);

    }

    if (info === "dp") {

        $("#bhm").hide(200);
        $("#df").hide(200);
        $("#uf").hide(200);
        $("#vs").hide(200);
        $("#vft").hide(200);
        $("#vfb").hide(200);
        $("#nfl").hide(200);
        $("#fp").hide(200);
        $("#dp").show(500);

    }

    if (info === "fp") {

        $("#bhm").hide(200);
        $("#df").hide(200);
        $("#uf").hide(200);
        $("#vs").hide(200);
        $("#vft").hide(200);
        $("#vfb").hide(200);
        $("#dp").hide(200);
        $("#nfl").hide(200);
        $("#fp").show(500);

    }

    if (info === "nfl") {

        $("#bhm").hide(200);
        $("#df").hide(200);
        $("#uf").hide(200);
        $("#vs").hide(200);
        $("#vft").hide(200);
        $("#vfb").hide(200);
        $("#dp").hide(200);
        $("#fp").hide(200);
        $("#nfl").show(500);

    }

    if (info === "wrkflw") {

        $("#bhm").hide(200);
        $("#df").hide(200);
        $("#uf").hide(200);
        $("#vs").hide(200);
        $("#vft").hide(200);
        $("#vfb").hide(200);
        $("#dp").hide(200);
        $("#fp").hide(200);
        $("#nfl").hide(200);
        $("#wrkflw").show(500);

    }




}

function createfolder() {

    var flder_loc = document.getElementById("folder_location").value;
    var fldrname;
    var ajaxRequestfolder;
    var reSpaceandspecial = new RegExp(/^[a-zA-Z0-9]*$/);

    if (flder_loc === "") {
        $("#fldrwarn").show(400);
        $("#showmissingfield1").hide(100);
        $("#showmissingfield2").hide(100);
        $("#showmissingfield5").hide(100);
        $("#showmissingfield3").hide(100);
        $("folder_location").css('backgroundColor', "#FF8C69");
        return false;
    }
    else {

        if (flder_loc.charAt(flder_loc.length - 1) !== "/") {

            flder_loc = flder_loc + "/";
        }

        fldrname = prompt("Please enter name for new folder");

        if (!reSpaceandspecial.test(fldrname) || fldrname === "" || fldrname === "null" || fldrname === null) {
            alert("Special characters, blank spaces and 'null' values are not allowed in folder name. Enter only alphabets for e.g. a-z,A-Z");
            return false;
        }

        else {

            if (confirm("Please verify following information\n\n\
Location to Create Folder: " + flder_loc + "\n\nName of Folder: " + fldrname + "\n\nThe folder will be created as follows: \
" + flder_loc + fldrname)) {
                //alert("1");

                $("#light").show(200);
                $("#fade").show(200);
                $("#ani").show(200);
                var opts = {
                    lines: 15,
                    length: 34,
                    width: 13,
                    radius: 48,
                    corners: 1,
                    rotate: 22,
                    direction: 1,
                    color: '#FFFFFF',
                    speed: 1.4,
                    trail: 66,
                    shadow: false,
                    hwaccel: false,
                    className: 'spinner',
                    zIndex: 2e9,
                    top: 'auto',
                    left: 'auto'
                };
                var target = document.getElementById('light');
                var spinner = new Spinner(opts).spin(target);


                try {

                    ajaxRequestfolder = new XMLHttpRequest();

                } catch (e) {

                    try {
                        ajaxRequestfolder = new ActiveXObject("Msxml2.XMLHTTP");

                    } catch (e) {
                        try {
                            ajaxRequestfolder = new ActiveXObject("Microsoft.XMLHTTP");

                        } catch (e) {

                            alert("Your browser broke!");
                            return false;

                        }
                    }

                }


                ajaxRequestfolder.onreadystatechange = function() {

                    if (ajaxRequestfolder.readyState === 4) {
                        var fldrstatus = ajaxRequestfolder.responseText.toString().trim();

                        if (fldrstatus === "0") {
                            $("#ani").hide(100);
                            $("#ani1").fadeIn('slow').delay(1000).show(400);
                            $("#light").fadeIn('slow').delay(1000).hide(200);
                            $("#fade").fadeIn('slow').delay(1000).hide(200);
                            $("#fldsucc").show(400);
                        }
                        else if (fldrstatus === "FolderExists") {
                            $("#fldrexist").show(400);
                            $("#ani").hide(100);
                            $("#light").fadeIn('slow').delay(1000).hide(200);
                            $("#fade").fadeIn('slow').delay(1000).hide(200);

                        }

                        else {
                            $("#flderr").show(400);
                            $("#ani").hide(100);
                            $("#light").fadeIn('slow').delay(1000).hide(200);
                            $("#fade").fadeIn('slow').delay(1000).hide(200);

                        }



                    }
                };

                ajaxRequestfolder.open("GET", "modules/DirNavigation/create_folder.jsp?f_loc=" + flder_loc + "&f_nm=" + fldrname);
                ajaxRequestfolder.send();

            }

        }
    }
}

function sethome() {

    document.getElementById("folder_location").value = dflt_hme;

}

$(document).ready(function() {

    $('.contentdnld a').mouseover(function(event) {


        $("#hint").css('top', (event.pageY - 10) + 'px').css('left', (event.pageX + 10) + 'px').fadeIn('slow');

    });

    $('.contentdnld a').mouseout(function() {

        $("#hint").hide();

    });

});