/// gpu_noise_perlin_1d(noise_object, x);

var o = argument[0];
var _width = o[@1];
var _x = argument[1];

if (_x > _width) {
    var _xdiv = _x div _width;
    _x = _x mod _width;
    o = gpu_noise_perlin_offset(o, _xdiv * _width);
}

return (buffer_peek(o[@10], _x*4, buffer_u32) & 255) / 255;
