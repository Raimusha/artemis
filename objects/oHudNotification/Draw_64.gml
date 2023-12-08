/// @description Insert description here
// You can write your code in this editor

// oHUDNotification Draw GUI Event
if (visible) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_set_font(fntVerdana); // Replace with your font
    draw_set_color(c_white);
    draw_set_alpha(alpha);

    var x_pos = display_get_gui_width() / 2;
    var y_pos = 20; // Adjust based on your GUI layout
    draw_text(x_pos, y_pos, message);

    // Update the timer and hide the message when the time is up
    timer++;
    if (timer > display_duration) {
        visible = false;
        timer = 0;
    }
}



