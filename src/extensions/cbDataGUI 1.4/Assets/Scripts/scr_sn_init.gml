/*
 * Ported to GML by Cem Baspinar. See below for credits.
 *
 * Based on a javascript implementation of simplex noise by Jonas Wagner.
 * Based on a speed-improved simplex noise algorithm for 2D, 3D and 4D in Java.
 * Which is based on example code by Stefan Gustavson (stegu@itn.liu.se).
 * With Optimisations by Peter Eastman (peastman@drizzle.stanford.edu).
 * Better rank ordering method by Stefan Gustavson in 2012.
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 */

globalvar _sn_F2, _sn_G2, _sn_F3, _sn_G3, _sn_F4, _sn_G4, 
          _sn_seed, _sn_p_bank, _sn_p, _sn_perm, _sn_permMod12,
          _sn_grad3, _sn_grad4;

global._sn_F2 = 0.366025403784439;  //0.5 * (sqrt(3) - 1);
global._sn_G2 = 0.211324865405187;  // (3 - sqrt(3)) / 6;
global._sn_F3 = 0.3333333333333333; // 1 / 3;
global._sn_G3 = 0.1666666666666667; // 1 / 6;
global._sn_F4 = 0.3090169943749474; // (sqrt(5) - 1) / 4;
global._sn_G4 = 0.1381966011250105; // (5 - sqrt(5)) / 20;

global._sn_p_bank = ds_map_create();
scr_sn_set_seed(random_get_seed());

global._sn_perm[512] = 0;
global._sn_permMod12[512] = 0;

for (var i = 0; i < 512; i++) {
    global._sn_perm[i] = global._sn_p[@i & 255];
    global._sn_permMod12[i] = global._sn_perm[@i] % 12;
}

global._sn_grad3 = _scr_sn_grad3();
global._sn_grad4 = _scr_sn_grad4();

