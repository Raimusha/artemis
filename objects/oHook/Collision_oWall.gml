/// @description Insert description here
// You can write your code in this editor

// Collision Event of oHook with oWall

// Play the sound
audio_play_sound(sImpact, 1, false);

// Increase oPlayer's vertical speed
if (instance_exists(oPlayer)) {
    oPlayer.vsp -= 5;  // Decrease the vertical speed to make the player go up
}

// Indicate that the hook has attached
attached = true;

// Destroy the grappling hook
instance_destroy();
