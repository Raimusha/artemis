/// @description Insert description here
// You can write your code in this editor

if(place_meeting(x-hspeed,y,oWall)) {
	x += hspeed;
	with(oPlayer) {grappleAvaliable = true;}
}

if(place_meeting(x+hspeed,y,oWall)) {
	x -=hspeed;	
	with(oPlayer) {grappleAvaliable = true;}
}

if(other.y < y && !place_free(x,y+vspeed)) {
	move_contact_solid(90,8);	
	with(oPlayer) {grappleAvaliable = true;}
}


if (place_meeting(x,y+vspeed,oWall)) {
	vspeed = 0;
	move_contact_solid(270,12);
	with(oPlayer) {grappleAvaliable = true;}
}

