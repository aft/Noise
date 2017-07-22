//Thanks to GMC Forums user Pandaboy for the code that made the clickable text possible!
//http://gmc.yoyogames.com/index.php?showtopic=633571

var str, str_x, str_y;
str_x = argument0;
str_y = argument1;
str   = argument2;

draw_set_color(c_blue)
draw_text(str_x, str_y, str);

if(mouse_check_button_pressed(mb_left)) {
    var str_width, str_height;
    str_width = string_width(str);
    str_height = string_height(str);

    if(mouse_x >= str_x && mouse_x <= str_x+str_width && mouse_y >= str_y && mouse_y <= str_y+str_height) {
        return true;
    } else return false;
} else return false;
