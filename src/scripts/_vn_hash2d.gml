///_vn_hash2d(x, y);
var xx = 50 * frac(argument0 * 0.3183099 + 0.71);
var yy = 50 * frac(argument1 * 0.3183099 + 0.113);
return -1 + 2 * frac(1.375986 * global._vn_seed + xx * yy * (xx + yy));
