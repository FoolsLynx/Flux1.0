/// @desc Draw Basic GUI Stuff

// Set Alignment and Colour
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(c_blue);
// Draw Text
draw_text(320 * 0.5, 180 * 0.5, "Welcome to Flux\nPress Space");
// Reset Alignment and Colour
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(c_white);