// returns value between -1 and 1.

var ix = floor(argument0);
var iy = floor(argument1);
var iz = floor(argument2);
var fx = frac(argument0);
var fy = frac(argument1);
var fz = frac(argument2);
var ux = fx * fx * (3 - 2 * fx);
var uy = fy * fy * (3 - 2 * fy);

return lerp( lerp(
                  lerp(_vn_hash3d(ix + 0, iy + 0, iz + 0), _vn_hash3d(ix + 1, iy + 0, iz + 0), ux),
                  lerp(_vn_hash3d(ix + 0, iy + 1, iz + 0), _vn_hash3d(ix + 1, iy + 1, iz + 0), ux),
                  uy
             ),
             lerp(
                  lerp(_vn_hash3d(ix + 0, iy + 0, iz + 1), _vn_hash3d(ix + 1, iy + 0, iz + 1), ux),
                  lerp(_vn_hash3d(ix + 0, iy + 1, iz + 1), _vn_hash3d(ix + 1, iy + 1, iz + 1), ux),
                  uy
             ),
             fz * fz * (3 - 2 * fz) 
        );
