///scr_ft_create_flow_field();
//show_debug_message("noiseScale is changing to " + string(noiseScale));

if (!surface_exists(fSurface)) fSurface = surface_create(width, height);

surface_set_target(fSurface);
    draw_set_color_write_enable(true, true, true, true);
    draw_clear_alpha(c_black, 0);
    draw_set_color(c_black);
    draw_set_alpha(1);
    for (var i=0; i<width; i+=noiseScale) {
        for (var j=0; j<height; j++){
            // if (noiseStrength == 0) noiseStrength+=0.1;
            var val = scr_sn_noise(100, 200, 1, 1, .1, (i+noiseScale)/noiseStrength, (j+noiseScale)/noiseStrength);
            draw_set_color(make_colour_rgb(val, val, val));
            draw_rectangle(i, j, i+noiseScale, j+noiseScale, false);
        }
    }
surface_reset_target();

if (pbuffer_exists(fBuffer))  pbuffer_destroy(fBuffer);
fBuffer = pbuffer_create_from_surface(fSurface);

_invalidateFlowField = false;
