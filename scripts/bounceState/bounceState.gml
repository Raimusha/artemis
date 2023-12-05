// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bounceState(){
	

	// Step event of obj_player
if (state == PlayerState.Bounce) {
    y -= 15;

    // Example condition to exit bounce state
    if (vsp == 0) { // When starting to fall down
        state = PlayerState.Normal;
    }
}

}
