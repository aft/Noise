var xx = argument0;
var yy = argument1;
var zz = argument2;

var ix,iy,iz,gx,gy,gz;
var a0,b0,aa,ab,ba,bb;

var aa0,ab0,ba0,bb0;
var aa1,ab1,ba1,bb1;
var a1,a2,a3,a4,a5,a6,a7,a8;
var u,v,w,a8_5,a4_1;

ix = xx; xx -= ix;
iy = yy; yy -= iy;
iz = zz; zz -= iz;

gx = ix & 255;
gy = iy & 255;
gz = iz & 255;

a0 = gy + global._in_p[gx];
b0 = gy + global._in_p[gx + 1];
aa = gz + global._in_p[a0];
ab = gz + global._in_p[a0 + 1];
ba = gz + global._in_p[b0];
bb = gz + global._in_p[b0 + 1];

aa0 = global._in_p[aa]; aa1 = global._in_p[aa + 1];
ab0 = global._in_p[ab]; ab1 = global._in_p[ab + 1];
ba0 = global._in_p[ba]; ba1 = global._in_p[ba + 1];
bb0 = global._in_p[bb]; bb1 = global._in_p[bb + 1];

a1 = _in_grad(bb1, xx-1, yy-1, zz-1);
a2 = _in_grad(ab1, xx  , yy-1, zz-1);
a3 = _in_grad(ba1, xx-1, yy  , zz-1);
a4 = _in_grad(aa1, xx  , yy  , zz-1);
a5 = _in_grad(bb0, xx-1, yy-1, zz  );
a6 = _in_grad(ab0, xx  , yy-1, zz  );
a7 = _in_grad(ba0, xx-1, yy  , zz  );
a8 = _in_grad(aa0, xx  , yy  , zz  );

u = _in_fade(xx);
v = _in_fade(yy);
w = _in_fade(zz);

a8_5 = _in_lerp(v, _in_lerp(u, a8, a7), _in_lerp(u, a6, a5));
a4_1 = _in_lerp(v, _in_lerp(u, a4, a3), _in_lerp(u, a2, a1));

return _in_lerp(w, a8_5, a4_1);
