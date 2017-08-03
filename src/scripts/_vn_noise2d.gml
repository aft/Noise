// returns value between -1 and 1.

var ix = floor(argument0);
var iy = floor(argument1);
var fx = frac(argument0);
var fy = frac(argument1);
var ux = fx * fx * (3 - 2 * fx);

return lerp( lerp(_vn_hash2d(ix, iy), _vn_hash2d(ix + 1, iy), ux),
             lerp(_vn_hash2d(ix, iy + 1), _vn_hash2d(ix + 1, iy + 1), ux),
             fy * fy * (3 - 2 * fy)
           );
