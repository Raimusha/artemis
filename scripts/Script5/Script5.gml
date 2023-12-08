// Script: showHUDNotification
// Arguments: msg - the message to display
function ShowHudNotification(){
	var msg = argument0;
with (oHudNotification) {
    message = msg;
    visible = true;
    timer = 0;
    alpha = 1.0;
}

}