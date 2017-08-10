/*

    PBuffer - Pixel Buffer User Guide

    Basic Usage:

    var pb = pbuffer_create_from_surface(some_surface);
    var pix = pbuffer_get_pixel(pb, some_x, some_y);
    _r = pbuffer_pixel_get_r(pix);  // _r equal to something between 0.0-255.0
    _g = pbuffer_pixel_get_g(pix);  // _g equal to something between 0.0-255.0
    _b = pbuffer_pixel_get_b(pix);  // _b equal to something between 0.0-255.0
    _a = pbuffer_pixel_get_a(pix);  // _a equal to something between 0.0-1.0
    pbuffer_destroy(pb);


    Included Scripts:

    pbuffer_create_from_surface(surface);
    ---------------------------------------
    Takes: Surface id
    Returns: pbuffer
    Creates a pbuffer from a surface. Remember to destroy it after you are done.

    pbuffer_copy_to_surface(pbuffer, surface);
    ---------------------------------------
    Takes: pbuffer and an id of an already created surface
    Returns: 0 or 1
    Copies the content of the pbuffer to a surface.
    MANUAL NOTE: This function is currently only available for the Windows and
    Playstation 4 target platforms.

    pbuffer_destroy(pbuffer);
    ---------------------------------------
    Takes: pbuffer
    Returns: 0 or 1
    Destroys the buffer. Prevents memory leaks.

    pbuffer_is_equal(pbuffer_original, pbuffer2);
    ---------------------------------------
    Takes: two pbuffers
    Returns: 0 or 1
    Compares two different pbuffer contents using sha1 encoding. This function
    is very expensive to run. Use with caution.

    pbuffer_exists(pbuffer);
    ---------------------------------------
    Takes: pbuffer
    Returns: 0 or 1
    Checks if the pbuffer exists. This function doesn't work on HTML5 runtime.
    You may use pbuffer_exists_hack() to prevent getting Javascript errors.

    pbuffer_get_pixel(pbuffer, x, y);
    ---------------------------------------
    Takes: pbuffer and x,y coordinates
    Returns: pixel data
    Gets the pixel data of the coordinate. This data has RGBA values in it. Use
    pbuffer_pixel_* functions to decode this data.

    pbuffer_get_width(pbuffer);
    ---------------------------------------
    Takes: pbuffer
    Returns: integer
    Gets the width of the pbuffer in pixels.

    pbuffer_get_height(pbuffer);
    ---------------------------------------
    Takes: pbuffer
    Returns: integer
    Gets the height of the pbuffer in pixels.

    pbuffer_get_buffer(pbuffer);
    ---------------------------------------
    Takes: pbuffer
    Returns: buffer
    Gets the GMS buffer.

    pbuffer_pixel_get_color(pixel);
    ---------------------------------------
    Takes: pixel data
    Returns: GMS compatible color
    Gets the color of the pixel. This can be used as a parameter of
    draw_set_color() function. If you need to get R, G, B, A values seperately,
    use pbuffer_pixel_get_* functions.

    pbuffer_pixel_get_r(pixel, [bool_bgra]);
    ---------------------------------------
    Takes: pixel data, and optional: boolean
    Returns: Float between 0.0 & 255.0
    Gets the red value of the pixel. If your system returns pixel colors with
    the order of BGRA, instead of RGBA, use "true" as a second parameter.
        pbuffer_pixel_get_r(pix, true); // for BGRA order
        pbuffer_pixel_get_r(pix);       // for RGBA order

    pbuffer_pixel_get_a(pixel);
    ---------------------------------------
    Takes: pixel data
    Returns: Float between 0.0 & 1.0
    Gets the alpha value of the pixel. If the alpha value you are getting is
    incorrect, check the notes below.


    Important Notes:

    If you have issues on getting alpha correctly, check this blog post:
    http://www.yoyogames.com/blog/60

    Using draw_enable_alphablend(false) before semi-transparent shader draws
    helps.

    Copyright 2017, Cem Baspinar
    Reuse permitted under the MIT license.

*/

