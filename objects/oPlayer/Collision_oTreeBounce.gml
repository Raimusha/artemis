/// @description Insert description here
// You can write your code in this editor

// Collision Event with oTreeBounce in oPlayer


// Play the sound
audio_play_sound(sBounce, 3, false);

// Propelling the player upward and resetting grapple
    vsp -= 3;  // Decrease the vertical speed to make the player go up
    grappleAvailable = true;  // Reset the grappling hook availability
