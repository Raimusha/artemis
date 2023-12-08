// Draw GUI Event in oCamera

// Set up the text properties for controls and instructions
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fntVerdana); // Use your desired font
draw_set_color(c_white);

// Position for the controls indicator
var x_pos = 10;
var y_pos = 10;

// Draw the controls indicator
var controls_text = "Press 'R' to Restart";
draw_text(x_pos, y_pos, controls_text);

// Position for the instructions
var instructions_x = 10;
var instructions_y = 40; // Adjust so it's below the controls indicator

// Draw the instructions text
var instructions = "Instructions:\n" +
                   "- Use arrow keys or WASD to move.\n" +
                   "- Press Space to jump.\n" +
                   "- Press shift to use the grapple hook.\n" +
                   "- Bounce on bushes for a boost.\n" +
                   "- Press C for unlimited grappling";
draw_text(instructions_x, instructions_y, instructions);

// Set up the text properties for grapple availability
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_color(c_white);

// Define the position for the grapple availability status (bottom left of the screen)
var grapple_x_pos = 10;
var grapple_y_pos = display_get_gui_height() - 20;

// Check if oPlayer exists before accessing its variables
if (instance_exists(oPlayer)) {
    // Get the grapple availability status
    var grappleStatus = (global.grappleAvailable ? "Grapple Ready" : "Grapple Not Ready");

    // Draw the grapple availability status
    draw_text(grapple_x_pos, grapple_y_pos, grappleStatus);
}
