///pbuffer_is_equal(pbuffer_original, pbuffer2);

// This comparision is very expensive. Use with caution.

/*
If you have issues on getting alpha, check this blog post:
http://www.yoyogames.com/blog/60

Using draw_enable_alphablend(false) before semi-transparent
shader draws helps.

Copyright 2017, Cem Baspinar
Reuse permitted under the MIT license.

*/

if (!is_array(argument0) || !is_array(argument1)) { 
    show_debug_message("pbuffer_get_pixel takes a pbuffer array. Use pbuffer_create_from_surface() to create one.");
    return 0; 
}

var buff1 = argument0[@2];
var buff2 = argument1[@2];

if (!buffer_exists_hack(buff1) || !buffer_exists_hack(buff2)) { 
    show_debug_message("Buffer cannot be found.");
    return 0;
}

return buffer_sha1(buff1, 0, buffer_get_size(buff1)) == buffer_sha1(buff2, 0, buffer_get_size(buff2));
