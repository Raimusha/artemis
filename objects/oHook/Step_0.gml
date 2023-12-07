/// @description Insert description here
// You can write your code in this editor

// The hook will automatically move in the set direction and speed.
// You might want to add collision checks or limit the distance it can travel.

// Adjust the position and possibly the angle of each rope segment
// to create a rope effect from the player to the hook
//vsp = 1;

// Calculate the distance from the grappling hook to the player
var distance = point_distance(x,y, oPlayer.x, oPlayer.y);
if (distance > oPlayer.grapple_max_distance) {
	// Destroy the grappling hook
	instance_destroy();
	
	// Reset player grappling state
	oPlayer.grappling = false;
	
	// Destroy rope segments, if they exist
	/*for (var i = 0; i < ds_list_size(oPlayer.rope_segments); i++) {
		instance_destroy(ds_list_find_value(oPlayer.rope_segments, i));
	}
	ds_list_clear(oPlayer.rope_segments);*/
}
		