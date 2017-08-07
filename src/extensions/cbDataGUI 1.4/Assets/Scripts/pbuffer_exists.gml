///pbuffer_exists(pbuffer);

/*

If you have issues on getting alpha, check this blog post:
http://www.yoyogames.com/blog/60

Using draw_enable_alphablend(false) before semi-transparent
shader draws helps.

Copyright 2017, Cem Baspinar
Reuse permitted under the MIT license.

*/

if (!is_array(argument0)) return 0; 
if (!buffer_exists(argument0[@2])) return 0;
return 1;
