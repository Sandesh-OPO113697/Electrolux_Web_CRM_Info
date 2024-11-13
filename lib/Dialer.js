var IsConforence = false;
var emptyCount = 0;
$(document).ready(function () {
    setInterval(GetResponce, 2000);
});

function confirmLogOut() {
    return confirm("Do You Want To LogOut..?");
}
function CallConforence() {
    var userInput = prompt("Please enter a 10-digit number:");
    if (userInput !== null) {
        userInput = userInput.trim();
        if (/^\d{10}$/.test(userInput)) {
            $.ajax({
                type: "POST",
                url: "CTI.aspx/ConforenceCall",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ userInput: userInput }),
                success: function (result) {
                    IsConforence = true;
                },
                error: function (xhr, status, error) {
                    alert("An error occurred while initiating the conference call. Please try again.");
                }
            });
        } else {
            alert("Please enter a valid 10-digit number.");
        }
    }
}

function confirmDisconnect() {
    var result = confirm("Do you want to disconnect the call?");
    if (result) {
        handleDisconnect();
    }
    return false;
}
function handleDisconnect() {
    $.ajax({
        type: "POST",
        url: "CTI.aspx/DissconnectTheCall",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
        },
        error: function (error) {
            console.log("AJAX error:", error);
        }
    });
}
function GetResponce() {
    var ResponceStatus = '';

    $.ajax({
        type: "POST",
        url: "CTI.aspx/GetResponceFromClient",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
            if (result.d === '') {
                emptyCount++;
                if (emptyCount >= 5) {
                    window.location.href = "LogIn.aspx";
                    return;
                }
            }


            let arr = result.d.split(',');

            ResponceStatus = arr[7];
            $("#lblCurrentStatus").text(" : " + arr[0] + "," + arr[1]);
            $("#lblAgentName").text(" : " + arr[2]);
            $("#lblCampaign").text(" : " + arr[3]);
            $("#lblCampaignMode").text(" : " + arr[5]);
            $("#lblEventStatus").text(" : " + arr[7]);
            $("#lblbatchId").text(" : " + arr[6]);
            $("#MyCode").text(" : " + arr[13]);
            $("#lblPhoneNumber").text(" : " + arr[10].replace("Text: ", ""));



            if (arr[8] !== $("#dynamicIframe").attr("src")) {
                $("#dynamicIframe").attr("src", arr[8]);
                emptyCount = 0;

            }
            if (ResponceStatus === 'Conference Dialing' && IsConforence === true) {
                emptyCount = 0;
                $("#ConforenceButton").hide();
                $("#PartyButton").show();
            }
            if (ResponceStatus === 'EventNetworkReached' && IsConforence === true) {
                emptyCount = 0;
                $("#ConforenceButton").hide();
                $("#PartyButton").show();
            }
            if (ResponceStatus === 'After Call Work') {
                emptyCount = 0;
                $("#ConforenceButton").hide();

            }
            if (ResponceStatus === 'Customer Disconnect' && IsConforence === true) {
                emptyCount = 0;
                IsConforence = false;
                $("#PartyButton").hide();
                $("#MergeButton4").hide();
                $("#ConforenceButton").show();
            }
            if (ResponceStatus === 'EventEstablished' && IsConforence === true) {
                emptyCount = 0;
                $("#PartyButton").show();
                $("#MergeButton4").show();
            }
            if (ResponceStatus === 'EventPartyAdded' && IsConforence === true) {
                emptyCount = 0;
                $("#PartyButton").show();
                $("#MergeButton4").hide();
            }
            if (ResponceStatus === 'Customer Disconnect') {
                emptyCount = 0;
                $("#PartyButton").hide();
                $("#MergeButton4").hide();
            }
            if (ResponceStatus === 'EventHeld' || ResponceStatus === 'EventRetrieved') {
                emptyCount = 0;
                $("#ConforenceButton").show();
            }
            if (ResponceStatus === 'Party deleted') {
                emptyCount = 0;
                IsConforence = false;
                $("#ConforenceButton").hide();
                $("#MergeButton4").hide();
                $("#PartyButton").show();
            }
            if (arr[0].includes('BREAK')) {
                emptyCount = 0;
                $("#CallButton").hide();
                $("#DissConnectButton").hide();
                $("#GetNextButton").hide();
                $("#TransferButton").hide();
                $("#BreakButton").hide();
                $("#HoldButton1").hide();
                $("#MergeButton4").hide();
                $("#PartyButton").hide();
                $("#LogOutButton5").hide();
            }
            if (arr[0].includes('EventAgentReady')) {
                emptyCount = 0;
                $("#CallButton").show();
                $("#DissConnectButton").show();
                $("#GetNextButton").show();
                $("#TransferButton").show();
                $("#BreakButton").show();
                $("#HoldButton1").show();
                $("#MergeButton4").show();
                $("#PartyButton").show();
                $("#LogOutButton5").show();
            }
            if (arr[0] === 'TALKING') {
                emptyCount = 0;
                $("#HoldButton1").show();
                $("#ConforenceButton").show();
                $("#DissConnectButton").show();
            }
            if (arr[0] === 'WRAPING') {
                emptyCount = 0;
                $("#ConforenceButton").hide();
                //$("#DissConnectButton").hide();
            }
            if (arr[0] === 'DIALING') {
                emptyCount = 0;
                $("#DissConnectButton").show();
            }


        },
        error: function (error) {
            console.log("AJAX error:", error);
        }
    });


}
function ConforenceStatus() {
    IsConforence = false;
    $("#ConforenceButton").show();
}
function IsCallOnStatus() {
    $("#ConforenceButton").hide();
}

function IsConfoVisibilty() {
    $("#ConforenceButton").hide();
}
function ConforenceVisibility() {
    $("#ConforenceButton").show();
}

