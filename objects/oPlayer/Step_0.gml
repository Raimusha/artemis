#region Player Input
key_left = keyboard_check(ord("A")) || (gamepad_axis_value(0, gp_axislh) < -0.2);
key_right = keyboard_check(ord("D")) || (gamepad_axis_value(0, gp_axislh) > 0.2);
key_jump = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1);
controller = key_left || key_right || key_jump ? 1 : 0;
#endregion

#region Calculate Movement
var move = key_right - key_left;
hsp = move * walksp;

// Apply gravity
vsp += grv;

// Regular jumping logic
if (place_meeting(x, y + 1, oWall) && key_jump) {
    vsp = -7;  // Jumping strength
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

key_grapple = keyboard_check_pressed(vk_shift);
if (place_meeting(x, y + 1, oWall)) {
    grappleAvailable = true;
}
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
if (key_grapple && !grappling && grappleAvailable) {
    grappling = true;
    grapple_length = 0;
    grappleAvailable = false;  // Set grapple availability to false after using it

    // Determine grapple target based on player's facing direction
    var dir = (image_xscale == 1) ? 0 : 180; // Assumes player faces right when image_xscale is 1, left when -1
    grapple_target_x = x + lengthdir_x(grapple_max_length, dir);
    grapple_target_y = y + lengthdir_y(grapple_max_length, dir);

    // Create the grappling hook object
    var hook = instance_create_layer(x + 4, y, "Instances", oHook); // Adjust layer as needed
    hook.direction = dir;
    hook.speed = grapple_speed;
    hook.image_xscale = image_xscale; // Set the hook's sprite to face the same direction as the player
}

if (grappling) {
    dir = point_direction(x, y, grapple_target_x, grapple_target_y);
    grapple_length += grapple_speed;
    if (grapple_length > grapple_max_length || place_meeting(x + lengthdir_x(grapple_length, dir), y + lengthdir_y(grapple_length, dir), oWall)) {
        grappling = false;
    } else if (point_distance(x, y, grapple_target_x, grapple_target_y) < 5) {
        grappling = false;
    } else {
        hsp = lengthdir_x(4, dir);
        vsp = lengthdir_y(4, dir);
    }
    vsp += grv;  // Continue applying gravity even while grappling
}
#endregion

