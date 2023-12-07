/// @description Insert description here
// You can write your code in this editor


// oGrapple Draw Event

if (instance_exists(oPlayer)) {
    // Set the color and width of the line for the rope
    draw_set_color(c_black);  // Change the color as needed
   //raw_set_line_width(2);   // Set the line width

    // Draw a line from the player to the grappling hook
    draw_line(oPlayer.x, oPlayer.y, x, y);

    // Reset the drawing settings
    draw_set_color(c_white);
    //aw_set_line_width(1);
}

// Draw the grappling hook sprite
draw_self();
