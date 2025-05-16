/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


  var alljobid = "";

            function checkjob(temp)
            {

                var result;

                if (temp.value === 'DELETE')
                {
                    result = confirm("Press OK: If You want to Delete JobID" + alljobid + "\n Press Cancel: To cancel operation");
                    if (result === true)
                        return true;
                    else
                        return false;

                }
                if (temp.value === 'HOLD')
                {
                    result = confirm("Press OK: If You want to Hold JobID" + alljobid + "\n Press Cancel: To cancel operation");
                    if (result === true)
                        return true;
                    else
                        return false;

                }
                if (temp.value === 'RELEASE')
                {
                    result = confirm("Press OK: If You want to Release JobID" + alljobid + "\n Press Cancel: To cancel operation");
                    if (result === true)
                        return true;
                    else
                        return false;

                }
                return false;
            }


            function collectjobid(temp)
            {
                var tempjobid = new Array;
                if (temp.checked === true)
                    alljobid = alljobid + "\t" + temp.value;
                else
                {
                    tempjobid = alljobid.split("\t");
                    alljobid = "";
                    for (i = 0; i < tempjobid.length; i++)
                    {
                        if (tempjobid[i] === temp.value)
                        {
                            tempjobid[i] = "";
                            alljobid = alljobid + "\t" + tempjobid[i];
                        }
                        else
                        {
                            alljobid = alljobid + "\t" + tempjobid[i];
                        }
                    }
                }
            }


            function showstat() {


                var stat = document.getElementById("mnge_job").value.toString();

                if (stat === "dflt") {

                    $("#yes").hide(100);
                    $("#no").hide(100);

                }


                else if (stat === "no") {


                    $("#no").show(500);
                    $("#yes").hide(100);


                }

                else if (stat === "yes") {

                    $("#yes").show(500);
                    $("#no").hide();

                }

                else if (stat === "ex") {

                    $("#excep").show(500);
                    $("#no").hide();
                    $("#yes").hide(100);

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