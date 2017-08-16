/// gpu_noise_3d(noise_object, x, y, z);

var o = argument[0];
var _width  = o[@1];
var _height = o[@2];
var _x = argument[1];
var _y = argument[2];
var _z = argument[3];
var _xoffset = o[@6];
var _yoffset = o[@7];
var _zoffset = o[@8];
var offset = false;

if (_x > _width) {
    var _xdiv = _x div _width;
    _x = _x mod _width;
    _xoffset = _xdiv * _width;
    offset = true;
}

if (_y > _height) {
    var _ydiv = _y div _height;
    _y = _y mod _height;
    _yoffset = _ydiv * _height;
    offset = true;
}

// invalidate cache and recalculate the noise with the new z value.
if (offset || _z != _zoffset) {
    o = gpu_noise_offset(o, _xoffset, _yoffset, _z);
}

return (buffer_peek(o[@10], (_x+_y*_width)*4, buffer_u32) & 255) / 255;
