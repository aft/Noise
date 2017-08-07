///scr_ft_set_message(string);
draw_set_font(fizzyFont);
if (string_width(message) != string_width(argument0)) scr_ft_destroy();

message = string(argument0);

width = string_width(message);
height = string_height(message);
xoffset = x - width / 2;
yoffset = y - height / 2;

scr_ft_create_mask();
scr_ft_create_flow_field();
