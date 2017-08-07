///pbuffer_create_from_surface(surface);

/*
If you have issues on getting alpha, check this blog post:
http://www.yoyogames.com/blog/60

Using draw_enable_alphablend(false) before semi-transparent
shader draws helps.

Copyright 2017, Cem Baspinar
Reuse permitted under the MIT license.

*/
if (!surface_exists(argument0)) {
    show_debug_message("Surface cannot be found.");
    return 0;
}

var w = surface_get_width(argument0);
var h = surface_get_height(argument0);

if (w*h > 0) {
    var buf = buffer_create(((w*h)*4), buffer_fixed, 4);
    buffer_get_surface(buf, argument0, 0, 0, 0);

    var pbuffer;
    pbuffer[0] = w; pbuffer[1] = h; pbuffer[2] = buf;
    return pbuffer;
}

return -1;
