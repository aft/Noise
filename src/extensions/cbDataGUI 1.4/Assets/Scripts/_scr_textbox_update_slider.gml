// script that runs when slider textbox changes

var o = argument0;
var slidervar = scr_slider_get_value(o);

if (slidervar != value) {
    if (value != undefined && value != "" && value != "-" && value != "+") {
        scr_slider_set_value(o, real( clamp(value, scr_slider_get_min_limit(o), scr_slider_get_max_limit(o)) ));
    }
}

