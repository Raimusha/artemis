hsp = 0;
vsp = 0;
grv = 0.3;
walksp = 4;
controller = 0;
hascontrol = true;
reduced_falling_speed = 2;

enum PlayerState {Normal, Grappling}
state = PlayerState.Normal;


// Grappling hook variables
grappling = false;  // Indicates if the player is currently using the grappling hook
grapple_speed = 10;  // Speed of the grappling hook
grapple_max_length = 200;  // Maximum length of the grappling hook
grapple_length = 0;  // Current length of the grappling hook

// Rope segments list
//rope_segments = ds_list_create(); // Delete later


// maximum length of the grappling hook's rope
grapple_max_distance = 100; // adjust as needed
grappleAvaliable = true;

