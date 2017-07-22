///_pn_noise1d(x);
var xx = argument0;
var _X = floor(xx) & 255;
xx -= floor(xx);
var fx = (3-2*xx)*xx*xx;

return _pn_lerp(fx, _pn_grad1d(global._pn_p[@_X], xx), _pn_grad1d(global._pn_p[@_X+1], xx-1));
    
