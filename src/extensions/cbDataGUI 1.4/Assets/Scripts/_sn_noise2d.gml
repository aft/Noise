xx = argument0;
yy = argument1;

// Noise contributions from the three corners
var n0 = 0;
var n1 = 0;
var n2 = 0;

// Skew the input space to determine which simplex cell we're in
var s = (xx + yy) * global._sn_F2; // Hairy factor for 2D
var i = floor(xx + s);
var j = floor(yy + s);
var t = (i + j) * global._sn_G2;
var X0 = i - t; // Unskew the cell origin back to (x,y) space
var Y0 = j - t;
var x0 = xx - X0; // The x,y distances from the cell origin
var y0 = yy - Y0;

// For the 2D case, the simplex shape is an equilateral triangle.
// Determine which simplex we are in.
var i1, j1; // Offsets for second (middle) corner of simplex in (i,j) coords
if (x0 > y0) {
    i1 = 1;
    j1 = 0;
} else { // lower triangle, XY order: (0,0)->(1,0)->(1,1)
    i1 = 0;
    j1 = 1;
} 

// upper triangle, YX order: (0,0)->(0,1)->(1,1)
// A step of (1,0) in (i,j) means a step of (1-c,-c) in (x,y), and
// a step of (0,1) in (i,j) means a step of (-c,1-c) in (x,y), where
// c = (3-sqrt(3))/6
var x1 = x0 - i1 + global._sn_G2; // Offsets for middle corner in (x,y) unskewed coords
var y1 = y0 - j1 + global._sn_G2;
var x2 = x0 - 1.0 + 2.0 * global._sn_G2; // Offsets for last corner in (x,y) unskewed coords
var y2 = y0 - 1.0 + 2.0 * global._sn_G2;

// Work out the hashed gradient indices of the three simplex corners
var ii = i & 255;
var jj = j & 255;

// Calculate the contribution from the three corners
var t0 = 0.5 - x0 * x0 - y0 * y0;
if (t0 >= 0) {
    var gi0 = (global._sn_permMod12[@ii + global._sn_perm[@jj]] * 3) % 12;
    t0 *= t0;
    n0 = t0 * t0 * _sn_dot2(global._sn_grad3[@gi0], x0, y0); // (x,y) of global._sn_grad3 used for 2D gradient
}

var t1 = 0.5 - x1 * x1 - y1 * y1;
if (t1 >= 0) {
    var gi1 = (global._sn_permMod12[@ii + i1 + global._sn_perm[@jj + j1]] * 3) % 12;
    t1 *= t1;
    n1 = t1 * t1 * _sn_dot2(global._sn_grad3[@gi1], x1, y1);
}

var t2 = 0.5 - x2 * x2 - y2 * y2;
if (t2 >= 0) {
    var gi2 = (global._sn_permMod12[@ii + 1 + global._sn_perm[@jj + 1]] * 3) % 12;
    t2 *= t2;
    n2 = t2 * t2 * _sn_dot2(global._sn_grad3[@gi2], x2, y2);
}

// Add contributions from each corner to get the final noise value.
// The result is scaled to return values in the interval [-1,1].
return 70.0 * (n0 + n1 + n2);
