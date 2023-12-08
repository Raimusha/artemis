// Draw Event in oCreditsText

var x_pos = room_width / 2; // Center of the room
var y_pos = room_height / 2; // Middle of the room

draw_set_halign(fa_center); // Center-align the text
draw_set_valign(fa_middle); // Middle-align the text
draw_set_font(fntVerdana); // Set your desired font
draw_set_color(c_white); // Set text color

// Draw the credits text
var credits_text = "Thank you for playing!" +
                   "\n\nCreated by: Tornado Racoons" +
                   "\n\nAdditional Credits:" +
                   "\nTristin Jarvis" +
                   "\nWill Stewart" +
                   "\nMark Schwarzmann" +
                   "\nSean Robinson" +
                   "\n\nMusic by alkakrab: https://alkakrab.itch.io/" +
                   "\nSounds by Kronobits: https://kronbits.itch.io/freesfx" +
                   "\nPlatformer Template by ShaunJS: https://shaunjs.itch.io/shauns-complete-platformer-tutorial-series";
draw_text(x_pos, y_pos, credits_text);
