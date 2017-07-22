var xx = argument0;
var yy = argument1;
var zz = argument2;
var ww = argument3;

var n0, n1, n2, n3, n4; // Noise contributions from the five corners
// Skew the (x,y,z,w) space to determine which cell of 24 simplices we're in
var s = (xx + yy + zz + ww) * global._sn_F4; // Factor for 4D skewing
var i = floor(xx + s);
var j = floor(yy + s);
var k = floor(zz + s);
var l = floor(ww + s);
var t = (i + j + k + l) * global._sn_G4; // Factor for 4D unskewing
var X0 = i - t; // Unskew the cell origin back to (x,y,z,w) space
var Y0 = j - t;
var Z0 = k - t;
var W0 = l - t;
var x0 = xx - X0; // The x,y,z,w distances from the cell origin
var y0 = yy - Y0;
var z0 = zz - Z0;
var w0 = ww - W0;

// For the 4D case, the simplex is a 4D shape I won't even try to describe.
// To find out which of the 24 possible simplices we're in, we need to
// determine the magnitude ordering of x0, y0, z0 and w0.
// Six pair-wise comparisons are performed between each possible pair
// of the four coordinates, and the results are used to rank the numbers.
var rankx = 0;
var ranky = 0;
var rankz = 0;
var rankw = 0;
if (x0 > y0) rankx++;
else ranky++;

if (x0 > z0) rankx++;
else rankz++;

if (x0 > w0) rankx++;
else rankw++;

if (y0 > z0) ranky++;
else rankz++;

if (y0 > w0) ranky++;
else rankw++;

if (z0 > w0) rankz++;
else rankw++;

var i1, j1, k1, l1; // The integer offsets for the second simplex corner
var i2, j2, k2, l2; // The integer offsets for the third simplex corner
var i3, j3, k3, l3; // The integer offsets for the fourth simplex corner
// simplex[@c] is a 4-vector with the numbers 0, 1, 2 and 3 in some order.
// Many values of c will never occur, since e.g. x>y>z>w makes x<z, y<w and x<w
// impossible. Only the 24 indices which have non-zero entries make any sense.
// We use a thresholding to set the coordinates in turn from the largest magnitude.
// Rank 3 denotes the largest coordinate.
if (rankx >= 3) i1 = 1;
else i1 = 0;

if (ranky >= 3) j1 = 1;
else j1 = 0;

if (rankz >= 3) k1 = 1;
else k1 = 0;

if (rankw >= 3) l1 = 1;
else l1 = 0;

// Rank 2 denotes the second largest coordinate.
if (rankx >= 2) i2 = 1;
else i2 = 0;

if (ranky >= 2) j2 = 1;
else j2 = 0;

if (rankz >= 2) k2 = 1;
else k2 = 0;

if (rankw >= 2) l2 = 1;
else l2 = 0;

// Rank 1 denotes the second smallest coordinate.
if (rankx >= 1) i3 = 1;
else i3 = 0;

if (ranky >= 1) j3 = 1;
else j3 = 0;

if (rankz >= 1) k3 = 1;
else k3 = 0;

if (rankw >= 1) l3 = 1;
else l3 = 0;

// The fifth corner has all coordinate offsets = 1, so no need to compute that.
var x1 = x0 - i1 + global._sn_G4; // Offsets for second corner in (x,y,z,w) coords
var y1 = y0 - j1 + global._sn_G4;
var z1 = z0 - k1 + global._sn_G4;
var w1 = w0 - l1 + global._sn_G4;
var x2 = x0 - i2 + 2 * global._sn_G4; // Offsets for third corner in (x,y,z,w) coords
var y2 = y0 - j2 + 2 * global._sn_G4;
var z2 = z0 - k2 + 2 * global._sn_G4;
var w2 = w0 - l2 + 2 * global._sn_G4;
var x3 = x0 - i3 + 3 * global._sn_G4; // Offsets for fourth corner in (x,y,z,w) coords
var y3 = y0 - j3 + 3 * global._sn_G4;
var z3 = z0 - k3 + 3 * global._sn_G4;
var w3 = w0 - l3 + 3 * global._sn_G4;
var x4 = x0 -  1 + 4 * global._sn_G4; // Offsets for last corner in (x,y,z,w) coords
var y4 = y0 -  1 + 4 * global._sn_G4;
var z4 = z0 -  1 + 4 * global._sn_G4;
var w4 = w0 -  1 + 4 * global._sn_G4;

// Work out the hashed gradient indices of the five simplex corners
var ii = i & 255;
var jj = j & 255;
var kk = k & 255;
var ll = l & 255;

// Calculate the contribution from the five corners
var t0 = 0.6 - x0 * x0 - y0 * y0 - z0 * z0 - w0 * w0;

if (t0 < 0) {
    n0 = 0.0;
} else {
    var gi0 = (global._sn_perm[@ii + global._sn_perm[@jj + global._sn_perm[@kk + global._sn_perm[@ll]]]] * 4) % 31;
    t0 *= t0;
    n0 = t0 * t0 * _sn_dot4(global._sn_grad4[@gi0], x0, y0, z0, w0);
}

var t1 = 0.6 - x1 * x1 - y1 * y1 - z1 * z1 - w1 * w1;
if (t1 < 0) {
    n1 = 0.0;
} else {
    var gi1 = (global._sn_perm[@ii + i1 + global._sn_perm[@jj + j1 + global._sn_perm[@kk + k1 + global._sn_perm[@ll + l1]]]] * 4) % 31;
    t1 *= t1;
    n1 = t1 * t1 * _sn_dot4(global._sn_grad4[@gi1], x1, y1, z1, w1);
}

var t2 = 0.6 - x2 * x2 - y2 * y2 - z2 * z2 - w2 * w2;
if (t2 < 0) {
    n2 = 0.0;
} else {
    var gi2 = (global._sn_perm[@ii + i2 + global._sn_perm[@jj + j2 + global._sn_perm[@kk + k2 + global._sn_perm[@ll + l2]]]] *4) % 31;
    t2 *= t2;
    n2 = t2 * t2 * _sn_dot4(global._sn_grad4[@gi2], x2, y2, z2, w2);
}

var t3 = 0.6 - x3 * x3 - y3 * y3 - z3 * z3 - w3 * w3;
if (t3 < 0) {
    n3 = 0.0;
} else {
    var gi3 = (global._sn_perm[@ii + i3 + global._sn_perm[@jj + j3 + global._sn_perm[@kk + k3 + global._sn_perm[@ll + l3]]]] * 4) % 31;
    t3 *= t3;
    n3 = t3 * t3 * _sn_dot4(global._sn_grad4[@gi3], x3, y3, z3, w3);
}

var t4 = 0.6 - x4 * x4 - y4 * y4 - z4 * z4 - w4 * w4;
if (t4 < 0) {
    n4 = 0.0;
} else {
    var gi4 = (global._sn_perm[@ii + 1 + global._sn_perm[@jj + 1 + global._sn_perm[@kk + 1 + global._sn_perm[@ll + 1]]]] * 4) % 31;
    t4 *= t4;
    n4 = t4 * t4 * _sn_dot4(global._sn_grad4[@gi4], x4, y4, z4, w4);
}

// Sum up and scale the result to cover the range [-1,1]
return 27.0 * (n0 + n1 + n2 + n3 + n4);
