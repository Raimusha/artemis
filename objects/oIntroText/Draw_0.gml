/// @description Insert description here
// You can write your code in this editor

// Draw Event in oIntroText

// Set the text properties
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_set_font(fntVerdana); // Replace with your font resource

// Define the position
var x_pos = room_width / 2;
var y_pos = room_height / 2;

// Define the text
var introText = "You are lost deep in a forest.\nReturn home by progressing through the forest.\n Press any key to continue";

// Draw the text
draw_text(x_pos, y_pos, introText);



