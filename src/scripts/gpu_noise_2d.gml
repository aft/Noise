/// gpu_noise_2d(noise_object, x, y);

var o = argument[0];
var _width  = o[@1];
var _height = o[@2];
var _x = argument[1];
var _y = argument[2];
var _xoffset = o[@6];
var _yoffset = o[@7];

if (_x > _width) {
    var _xdiv = _x div _width;
    _x = _x mod _width;
    _xoffset = _xdiv * _width;
}

if (_y > _height) {
    var _ydiv = _y div _height;
    _y = _y mod _height;
    _yoffset = _ydiv * _height;
}

if (_xoffset != o[@6] || _yoffset != o[@7]) o = gpu_noise_offset(o, _xoffset, _yoffset);

return (buffer_peek(o[@10], (_x+_y*_width)*4, buffer_u32) & 255) / 255;
