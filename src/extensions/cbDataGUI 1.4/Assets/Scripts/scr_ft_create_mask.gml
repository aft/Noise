///scr_ft_create_mask();
if (!surface_exists(pSurface)) pSurface = surface_create(width, height);

draw_enable_alphablend(false);
surface_set_target(pSurface);
    draw_set_color_write_enable(true, true, true, true);
    draw_clear_alpha(c_black, 0);
    draw_set_color(c_black);
    draw_set_alpha(1);
    draw_set_font(fizzyFont);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(width/2, height/2, message);
    //draw_rectangle(0, 0, width-1, height-1, false);
surface_reset_target();
draw_enable_alphablend(true);

if (pbuffer_exists(pBuffer)) pbuffer_destroy(pBuffer);
pBuffer = pbuffer_create_from_surface(pSurface);

