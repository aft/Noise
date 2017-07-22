///_pn_noise3d(x, y, z);

var xx = argument0,
    yy = argument1,
    zz = argument2;
    
var _X = floor(xx) & 255, 
    _Y = floor(yy) & 255, 
    _Z = floor(zz) & 255;
    
xx -= floor(xx); yy -= floor(yy); zz -= floor(zz);

var fx = (3-2*xx)*xx*xx, 
    fy = (3-2*yy)*yy*yy, 
    fz = (3-2*zz)*zz*zz;

var p0  = global._pn_p[@_X  ] + _Y, p00 = global._pn_p[@p0  ] + _Z, 
    p01 = global._pn_p[@p0+1] + _Z, p1  = global._pn_p[@_X+1] + _Y, 
    p10 = global._pn_p[@p1  ] + _Z, p11 = global._pn_p[@p1+1] + _Z;
    
return _pn_lerp(fz, 
       _pn_lerp(fy, _pn_lerp(fx, _pn_grad3d(global._pn_p[@p00], xx, yy, zz), _pn_grad3d(global._pn_p[@p10], xx-1, yy, zz)),
                    _pn_lerp(fx, _pn_grad3d(global._pn_p[@p01], xx, yy-1, zz), _pn_grad3d(global._pn_p[@p11], xx-1, yy-1, zz))),
       _pn_lerp(fy, _pn_lerp(fx, _pn_grad3d(global._pn_p[@p00 + 1], xx, yy, zz-1), _pn_grad3d(global._pn_p[@p10 + 1], xx-1, yy, zz-1)),
                    _pn_lerp(fx, _pn_grad3d(global._pn_p[@p01 + 1], xx, yy-1, zz-1), _pn_grad3d(global._pn_p[@p11 + 1], xx-1, yy-1, zz-1))));
    
