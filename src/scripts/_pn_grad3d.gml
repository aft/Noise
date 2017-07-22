///_pn_grad3d(i, x, y, z);

var h = argument0 & 15; // convert into 12 gradient directions
var u;
if (h < 8) u = argument1;
else u = argument2;
                 
var v;
if (h < 4) v = argument2;
else {
    if (h == 12 || h == 14) v = argument1;
    else v = argument3;
}

var ret1;
if (h & 1 == 0) ret1 = u;
else ret1 = -u;

var ret2;
if (h & 2 == 0) ret2 = v;
else ret2 = -v;

return ret1+ret2;
