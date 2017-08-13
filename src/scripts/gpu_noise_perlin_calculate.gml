/// gpu_noise_perlin_calculate(noise_object);


var o = argument0;
var _seed        = o[@0];
var _width       = o[@1];
var _height      = o[@2];
var _persistence = o[@3];
var _frequency   = o[@4];
var _scale       = o[@5];
var _x_offset    = o[@6];
var _y_offset    = o[@7];
var _z_offset    = o[@8];
var _shader      = o[@9];

// create surface for the noise
var _surface = surface_create(_width, _height);

// draw the noise to the surface
surface_set_target(_surface);
    shader_set(_shader);
    
        shader_set_uniform_f(shader_get_uniform(_shader, "u_resolution"), _width, _height);
        shader_set_uniform_f(shader_get_uniform(_shader, "u_seed"), _seed);
        shader_set_uniform_f(shader_get_uniform(_shader, "u_persistence"), _persistence);
        shader_set_uniform_f(shader_get_uniform(_shader, "u_freq"), _frequency);
        shader_set_uniform_f(shader_get_uniform(_shader, "u_scale"), _scale);
        shader_set_uniform_f(shader_get_uniform(_shader, "u_xoffset"), _x_offset);
        shader_set_uniform_f(shader_get_uniform(_shader, "u_yoffset"), _y_offset);
        shader_set_uniform_f(shader_get_uniform(_shader, "u_zoffset"), _z_offset);

        draw_clear_alpha(c_black, 0);
        draw_rectangle(0, 0, _width, _height, false);
        
    shader_reset();
surface_reset_target();

// if there is already a buffer, delete it.
if (!is_undefined(o[@10])) {
    buffer_delete(o[@10]);
    o[@10] = undefined;
}

// create nbuffer
var _nbuffer = buffer_create(((_width*_height)*4), buffer_fixed, 4);
buffer_get_surface(_nbuffer, _surface, 0, 0, 0);
// assign nbuffer
o[@10] = _nbuffer;

// free surface and the buffer
surface_free(_surface);
//buffer_delete(_nbuffer);

return o;

