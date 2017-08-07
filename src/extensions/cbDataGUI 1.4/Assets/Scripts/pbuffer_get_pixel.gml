///pbuffer_get_pixel(pbuffer, x, y);

/*
If you have issues on getting alpha, check this blog post:
http://www.yoyogames.com/blog/60

Using draw_enable_alphablend(false) before semi-transparent
shader draws helps.

Copyright 2017, Cem Baspinar
Reuse permitted under the MIT license.

*/

if (!is_array(argument0)) { 
    return -1; 
}

var buff = argument0[@2];
if (!buffer_exists_hack(buff)) { 
    return -1; 
}

var pix = (floor(argument1) + floor(argument2)*argument0[@0])*4;
return buffer_peek(buff, pix, buffer_u32);

