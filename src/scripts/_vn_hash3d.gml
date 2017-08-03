///_vn_hash3d(x, y, z);
var xx = 50 * frac(argument0 * 0.3183099 + 0.71);
var yy = 50 * frac(argument1 * 0.3183099 + 0.113);
var zz = 50 * frac(argument2 * 0.3183099 + 0.33);
return -1 + 2 * frac(1.375986 * global._vn_seed + xx * yy * zz * (xx + yy + zz));
