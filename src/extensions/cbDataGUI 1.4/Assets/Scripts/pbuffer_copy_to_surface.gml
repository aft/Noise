///pbuffer_copy_to_surface(pbuffer, surface);

// MANUAL NOTE: This function is currently only available 
// for the Windows and Playstation 4 target platforms. 


/*
If you have issues on getting alpha, check this blog post:
http://www.yoyogames.com/blog/60

Using draw_enable_alphablend(false) before semi-transparent
shader draws helps.

Copyright 2017, Cem Baspinar
Reuse permitted under the MIT license.

*/

if (!is_array(argument0)) { 
    show_debug_message("pbuffer_get_pixel takes a pbuffer array. Use pbuffer_create_from_surface() to create one.");
    return 0; 
}

var buff = argument0[@2];
if (!buffer_exists_hack(buff)) { 
    show_debug_message("Buffer cannot be found. Use pbuffer_create_from_surface()");
    return 0; ; 
}

buffer_set_surface(buff, argument1, 0, 0, 0);
return 1;
