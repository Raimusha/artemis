#region Player Input
key_left = keyboard_check(ord("A")) || (gamepad_axis_value(0, gp_axislh) < -0.2);
key_right = keyboard_check(ord("D")) || (gamepad_axis_value(0, gp_axislh) > 0.2);
key_jump = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1);
controller = key_left || key_right || key_jump ? 1 : 0;
#endregion

#region Calculate Movement
var move = key_right - key_left;
hsp = move * walksp;
vsp += grv;  // Apply gravity

if (place_meeting(x, y + 1, oWall) && key_jump) {
    vsp = -7;  // Jumping
}
#endregion

#region Collision and Movement
// Horizontal Collision
if (place_meeting(x + hsp, y, oWall)) {
    while (!place_meeting(x + sign(hsp), y, oWall)) {
        x += sign(hsp);
    }
    hsp = 0;
}
x += hsp;

// Vertical Collision
if (place_meeting(x, y + vsp, oWall)) {
    while (!place_meeting(x, y + sign(vsp), oWall)) {
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;
#endregion

#region Animation
if (!place_meeting(x, y + 1, oWall)) {
    // Airborne
    //sprite_index = sPlayerA; // Commenting this out as you might have different airborne sprite
    image_speed = 0;
    image_index = sign(vsp) > 0 ? 1 : 0;
} else {
    // On Ground
    if (abs(hsp) > 0) {
        sprite_index = sPlayerW;  // Change to walking sprite
        image_speed = 0.25;  // Adjust as needed for smooth animation
    } else {
        sprite_index = sPlayer;  // Change back to idle sprite when not moving
        image_speed = 0;  // No animation needed for idle (adjust as per your design)
    }
}

// Flip sprite based on direction
if (hsp != 0) {
    image_xscale = sign(hsp);
}
#endregion

#region Grappling Hook Mechanics
if (mouse_check_button(mb_left) && !grappling) {
    grappling = true;
    grapple_target_x = mouse_x;
    grapple_target_y = mouse_y;
    grapple_length = 0;
}

if (grappling) {
    var dir = point_direction(x, y, grapple_target_x, grapple_target_y);
    grapple_length += grapple_speed;
    if (grapple_length > grapple_max_length || place_meeting(x + lengthdir_x(grapple_length, dir), y + lengthdir_y(grapple_length, dir), oWall)) {
        grappling = false;
    } else if (point_distance(x, y, grapple_target_x, grapple_target_y) < 5) {
        grappling = false;
    } else {
        hsp = lengthdir_x(4, dir);
        vsp = lengthdir_y(4, dir);
    }
	// If the player is falling, apply the reduced falling speed
    if (vsp > 0) {
        vsp = min(vsp, reduced_falling_speed);
    }
}
#endregion
// Player bouncing on the tree mechanics
bounceState();