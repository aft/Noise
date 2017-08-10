///pbuffer_pixel_get_color(pixel);

/*
If you have issues on getting alpha, check this blog post:
http://www.yoyogames.com/blog/60

Using draw_enable_alphablend(false) before semi-transparent
shader draws helps.

Copyright 2017, Cem Baspinar
Reuse permitted under the MIT license.

*/

return make_colour_rgb(pbuffer_pixel_get_r(argument0),pbuffer_pixel_get_g(argument0),pbuffer_pixel_get_b(argument0));
