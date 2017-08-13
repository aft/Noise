/// gpu_noise_perlin(noise_object, x, [y, z]);

var o = argument0;
var _width       = o[@1];
var _z_offset    = o[@8];

if (argument3 != _z_offset) {
    o[@8] = argument3;
    o = gpu_noise_perlin_calculate(o);
}

return (buffer_peek(o[@10], (argument1+argument2*_width)*4, buffer_u32) & 255) / 255;
