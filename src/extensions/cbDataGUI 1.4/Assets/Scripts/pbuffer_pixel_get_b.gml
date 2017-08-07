///pbuffer_pixel_get_b(pixel, [bool_bgra]);

/*
If you have issues on getting alpha, check this blog post:
http://www.yoyogames.com/blog/60

Using draw_enable_alphablend(false) before semi-transparent
shader draws helps.

Copyright 2017, Cem Baspinar
Reuse permitted under the MIT license.

*/

if (argument_count > 1 && argument[1]) return (argument[0] >> 16) & 255; 
return argument[0] & 255;
