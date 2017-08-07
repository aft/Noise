var xx = argument0;
var yy = argument1;
var zz = argument2;

var n0, n1, n2, n3; // Noise contributions from the four corners

// Skew the input space to determine which simplex cell we're in
var s, i, j, k, t;
s = (xx + yy + zz) * global._sn_F3; // Very nice and simple skew factor for 3D
i = floor(xx + s);
j = floor(yy + s);
k = floor(zz + s);
t = (i + j + k) * global._sn_G3;

var X0, Y0, Z0, x0, y0, z0;
// Unskew the cell origin back to (x,y,z) space
X0 = i - t; Y0 = j - t; Z0 = k - t;
// The x,y,z distances from the cell origin
x0 = xx - X0; y0 = yy - Y0; z0 = zz - Z0;

// For the 3D case, the simplex shape is a slightly irregular tetrahedron.
// Determine which simplex we are in.
var i1, j1, k1; // Offsets for second corner of simplex in (i,j,k) coords
var i2, j2, k2; // Offsets for third corner of simplex in (i,j,k) coords
if (x0 >= y0) {
    if (y0 >= z0) {
        i1 =1;
        j1 =0;
        k1 =0;
        i2 =1;
        j2 =1;
        k2 =0;
    } else if (x0 >= z0) { // X Y Z order
        i1 =1;
        j1 =0;
        k1 =0;
        i2 =1;
        j2 =0;
        k2 =1;
    } else { // X Z Y order
        i1 =0;
        j1 =0;
        k1 =1;
        i2 =1;
        j2 =0;
        k2 =1;
    } // Z X Y order

} else { // x0<y0
    if (y0 < z0) {
        i1 =0;
        j1 =0;
        k1 =1;
        i2 =0;
        j2 =1;
        k2 =1;
    } else if (x0 < z0) { // Z Y X order
        i1 =0;
        j1 =1;
        k1 =0;
        i2 =0;
        j2 =1;
        k2 =1;
    } else { // Y Z X order
        i1 =0;
        j1 =1;
        k1 =0;
        i2 =1;
        j2 =1;
        k2 =0;
    } // Y X Z order
}

// A step of (1,0,0) in (i,j,k) means a step of (1-c,-c,-c) in (x,y,z),
// a step of (0,1,0) in (i,j,k) means a step of (-c,1-c,-c) in (x,y,z), and
// a step of (0,0,1) in (i,j,k) means a step of (-c,-c,1-c) in (x,y,z), where
// c = 1/6.
var x1 = x0 - i1 + global._sn_G3; // Offsets for second corner in (x,y,z) coords
var y1 = y0 - j1 + global._sn_G3;
var z1 = z0 - k1 + global._sn_G3;
var x2 = x0 - i2 + 2 * global._sn_G3; // Offsets for third corner in (x,y,z) coords
var y2 = y0 - j2 + 2 * global._sn_G3;
var z2 = z0 - k2 + 2 * global._sn_G3;
var x3 = x0 - 1 + 3 * global._sn_G3; // Offsets for last corner in (x,y,z) coords
var y3 = y0 - 1 + 3 * global._sn_G3;
var z3 = z0 - 1 + 3 * global._sn_G3;

// Work out the hashed gradient indices of the four simplex corners
var ii = i & 255;
var jj = j & 255;
var kk = k & 255;

// Calculate the contribution from the four corners
var t0 = 0.6 - x0 * x0 - y0 * y0 - z0 * z0;
if (t0 < 0) { 
    n0 = 0;
} else {
    var gi0 = (global._sn_permMod12[@ ii + global._sn_perm[@ jj + global._sn_perm[@kk]]] * 3 ) % 12;
    t0 *= t0;
    n0 = t0 * t0 * _sn_dot3(global._sn_grad3[@ gi0], x0, y0, z0);
}

var t1 = 0.6 - x1 * x1 - y1 * y1 - z1 * z1;
if (t1 < 0) {
    n1 = 0;
} else {
    var gi1 = (global._sn_permMod12[@ii + i1 + global._sn_perm[@jj + j1 + global._sn_perm[@kk + k1]]] * 3) % 12;
    t1 *= t1;
    n1 = t1 * t1 * _sn_dot3(global._sn_grad3[@ gi1], x1, y1, z1);
}

var t2 = 0.6 - x2 * x2 - y2 * y2 - z2 * z2;
if (t2 < 0) {
    n2 = 0;
} else {
    var gi2 = (global._sn_permMod12[@ii + i2 + global._sn_perm[@jj + j2 + global._sn_perm[@kk + k2]]] * 3) % 12;
    t2 *= t2;
    n2 = t2 * t2 * _sn_dot3(global._sn_grad3[@ gi2], x2, y2, z2);
}

var t3 = 0.6 - x3 * x3 - y3 * y3 - z3 * z3;
if (t3 < 0) {
    n3 = 0;
} else {
    var gi3 = (global._sn_permMod12[@ii + 1 + global._sn_perm[@jj + 1 + global._sn_perm[@kk + 1]]] * 3) % 12;
    t3 *= t3;
    n3 = t3 * t3 * _sn_dot3(global._sn_grad3[@ gi3], x3, y3, z3);
}

// Add contributions from each corner to get the final noise value.
// The result is scaled to stay just inside [-1,1]
return 32 * (n0 + n1 + n2 + n3);
