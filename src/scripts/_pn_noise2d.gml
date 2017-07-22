///_pn_noise2d(x, y);

var xx = argument0,
    yy = argument1;
    
var _X = floor(xx) & 255, 
    _Y = floor(yy) & 255;
    
xx -= floor(xx); yy -= floor(yy);

var fx = (3-2*xx)*xx*xx, 
    fy = (3-2*yy)*yy*yy;

var p0 = global._pn_p[@_X]+_Y, p1 = global._pn_p[@_X+1] + _Y, 
    
return _pn_lerp(fy, 
            _pn_lerp(fx, _pn_grad2d(global._pn_p[@p0  ], xx, yy  ), _pn_grad2d(global._pn_p[@p1  ], xx-1, yy)),
            _pn_lerp(fx, _pn_grad2d(global._pn_p[@p0+1], xx, yy-1), _pn_grad2d(global._pn_p[@p1+1], xx-1, yy-1)));
    
