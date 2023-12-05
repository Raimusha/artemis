/// @description Insert description here
// You can write your code in this editor
draw_self();

if (grappling) {
    var dir = point_direction(x, y, grapple_target_x, grapple_target_y);
    var grapple_x = lengthdir_x(grapple_length, dir);
    var grapple_y = lengthdir_y(grapple_length, dir);
    
    draw_line(x, y, x + grapple_x, y + grapple_y);
}

