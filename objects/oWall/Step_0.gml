/// @description Insert description here
// You can write your code in this editor

if(place_meeting(x-hspeed,y,oWall)) {
	x += hspeed;	
}

if(place_meeting(x+hspeed,y,oWall)) {
	x -=hspeed;	
}

if(other.y < y && !place_free(x,y+vspeed)) {
	move_contact_solid(90,8);	
}


if (place_meeting(x,y+vspeed,oWall)) {
	vspeed = 0;
	move_contact_solid(270,12);
}

