let checkExeInterval;
let CheckSIpInterval;
function NavigateThenCheckEXE() {
    window.location.href = 'http://192.168.0.93:8088/Onecrm/Sip_End_Point_Web_CRM/OneCRM.application';
     
    checkExeInterval = setInterval(CheckEXE, 2000);
        
    return false;
}

function SIPURLLogin() {
    window.location.href = 'http://192.168.0.93:8088/Utility/dynamic_sip/Genesyslab.Sip.Endpoint.QuickStart.Win.application';

    CheckSIpInterval = setInterval(ChecSIPEXE, 2000);

  
}

function CheckEXE() {
    $.ajax({
        type: "POST",
        url: "login.aspx/CheckExe",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
            if (result.d === 'Exe Is Running') {
                $("#LabelErr").text("CRM Is Running ...!");
                $("#launchLink").hide();
                $("#launchSIP").show();
                setTimeout(function () {
                    $("#launchSIP").css("visibility", "visible");
                }, 2000);
                clearInterval(checkExeInterval);
            }

        },
        error: function (error) {
            console.log("AJAX error:", error);
        }
    });
}



function ChecSIPEXE() {
    $.ajax({
        type: "POST",
        url: "login.aspx/CheckSIPExe",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
            if (result.d === 'Sip Is Working') {
                $("#LabelErr").text("SIP Is Running ...!");
                $("#launchSIP").hide();
                 $("#lnkSubmit").show();
                $("#txtPassword").show();
                $("#lblPassword").show();
                $("#txtUserName").show();
                $("#lblUsername").show();
                $("#launchSIP").css("visibility", "hidden");
               
                setTimeout(function () {
                    $("#lnkSubmit").css("visibility", "visible");
                    $("#lblUsername").css("visibility", "visible");
                    $("#txtUserName").css("visibility", "visible");
                    $("#txtPassword").css("visibility", "visible");
                    $("#lblPassword").css("visibility", "visible");
                }, 2000);
                clearInterval(CheckSIpInterval);
            }

        },
        error: function (error) {
            console.log("AJAX error:", error);
        }
    });
}

