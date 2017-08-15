/// gpu_noise_perlin_3d(noise_object, x, y, z);

var o = argument[0];
var _width       = o[@1];
var _z_offset    = o[@8];

if (argument[3] != _z_offset) {
    o[@8] = argument[3];
    o = gpu_noise_perlin_calculate(o);
}

return (buffer_peek(o[@10], (argument[1]+argument[2]*_width)*4, buffer_u32) & 255) / 255;
