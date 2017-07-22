// http://mrl.nyu.edu/~perlin/noise/

var xx = argument0;
var yy = argument1;
var zz = argument2;

var floorX = floor(xx), floorY = floor(yy), floorZ = floor(zz);
var _X = floorX & 255, _Y = floorY & 255, _Z = floorZ & 255;


xx -= floorX;
yy -= floorY;
zz -= floorZ;

var u = _in_fade(xx), v = _in_fade(yy), w = _in_fade(zz);

var A  = global._in_p[@_X  ]+_Y, AA = global._in_p[@A]+_Z, AB = global._in_p[@A+1]+_Z, 
    B  = global._in_p[@_X+1]+_Y, BA = global._in_p[@B]+_Z, BB = global._in_p[@B+1]+_Z;

return _in_lerp(w, _in_lerp(v, _in_lerp(u, _in_grad(global._in_p[@ AA  ], xx  , yy  , zz   ), 
                                           _in_grad(global._in_p[@ BA  ], xx-1, yy  , zz   )),
                               _in_lerp(u, _in_grad(global._in_p[@ AB  ], xx  , yy-1, zz   ), 
                                           _in_grad(global._in_p[@ BB  ], xx-1, yy-1, zz   ))),
                   _in_lerp(v, _in_lerp(u, _in_grad(global._in_p[@ AA+1], xx  , yy  , zz-1 ), 
                                           _in_grad(global._in_p[@ BA+1], xx-1, yy  , zz-1 )),
                               _in_lerp(u, _in_grad(global._in_p[@ AB+1], xx  , yy-1, zz-1 ), 
                                           _in_grad(global._in_p[@ BB+1], xx-1, yy-1, zz-1 ))));


