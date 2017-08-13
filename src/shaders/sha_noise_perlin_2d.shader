
attribute vec3 in_Position;
varying vec3 v_vPosition;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vPosition = in_Position;
    
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~
// Adapted for GMS by Cem Baspinar. Shadertoy page for it linked below.
//
// A Note from @aft: 
// On the page linked below, you will see a discussion that reveals 
// Stefan Gustavson's opinion on adding a seed support. He himself 
// says that it has a performance cost and this shall be done by 
// offsetting coords. This code is a coordinate offset hack.
//
// Reuse permitted under the MIT license.
//
// Seed hack added by @aft.
// Original shader: https://github.com/stegu/webgl-noise/blob/master/src/classicnoise2D.glsl
// Thank you Stefan Gustavson for all the work you have done.


#define OCTAVES 5 // CHANGE THIS AS YOU WISH


#if (OCTAVES > 1)
#define NOISE getnoise_fbm
#else
#define NOISE getnoise_single
#endif

varying vec3 v_vPosition;

uniform vec2 u_resolution;
uniform float u_seed;
uniform float u_frame;
uniform float u_persistence; // .3
uniform float u_freq; // 16.
uniform float u_scale; // 1.
uniform float u_xoffset; // 0.
uniform float u_yoffset; // 0.


// Original code starts here

//
// GLSL textureless classic 2D noise "cnoise",
// with an RSL-style periodic variant "pnoise".
// Author:  Stefan Gustavson (stefan.gustavson@liu.se)
// Version: 2011-08-22
//
// Many thanks to Ian McEwan of Ashima Arts for the
// ideas for permutation and gradient selection.
//
// Copyright (c) 2011 Stefan Gustavson. All rights reserved.
// Distributed under the MIT license. See LICENSE file.
// https://github.com/stegu/webgl-noise
//

vec4 mod289(vec4 x) {
  return x - floor(x * (1.0 / 289.0)) * 289.0;
}

vec4 permute(vec4 x) {
  return mod289(((x*34.0)+1.0)*x);
}

vec4 taylorInvSqrt(vec4 r) {
  return 1.79284291400159 - 0.85373472095314 * r;
}

vec2 fade(vec2 t) {
  return t*t*t*(t*(t*6.0-15.0)+10.0);
}

// Classic Perlin noise
float cnoise(vec2 P) {

  P += sin(u_seed * 1.78291351) * 1e6; // seed addition by shifting pos.

  vec4 Pi = floor(P.xyxy) + vec4(0.0, 0.0, 1.0, 1.0);
  vec4 Pf = fract(P.xyxy) - vec4(0.0, 0.0, 1.0, 1.0);
  Pi = mod289(Pi); // To avoid truncation effects in permutation
  vec4 ix = Pi.xzxz;
  vec4 iy = Pi.yyww;
  vec4 fx = Pf.xzxz;
  vec4 fy = Pf.yyww;

  vec4 i = permute(permute(ix) + iy);

  vec4 gx = fract(i * (1.0 / 41.0)) * 2.0 - 1.0 ;
  vec4 gy = abs(gx) - 0.5 ;
  vec4 tx = floor(gx + 0.5);
  gx = gx - tx;

  vec2 g00 = vec2(gx.x,gy.x);
  vec2 g10 = vec2(gx.y,gy.y);
  vec2 g01 = vec2(gx.z,gy.z);
  vec2 g11 = vec2(gx.w,gy.w);

  vec4 norm = taylorInvSqrt(vec4(dot(g00, g00), dot(g01, g01), dot(g10, g10), dot(g11, g11)));
  g00 *= norm.x;  
  g01 *= norm.y;  
  g10 *= norm.z;  
  g11 *= norm.w;  

  float n00 = dot(g00, vec2(fx.x, fy.x));
  float n10 = dot(g10, vec2(fx.y, fy.y));
  float n01 = dot(g01, vec2(fx.z, fy.z));
  float n11 = dot(g11, vec2(fx.w, fy.w));

  vec2 fade_xy = fade(Pf.xy);
  vec2 n_x = mix(vec2(n00, n01), vec2(n10, n11), fade_xy.x);
  float n_xy = mix(n_x.x, n_x.y, fade_xy.y);
  return 2.3 * n_xy;
}

// Original code ends here.

float getnoise_single(int octaves, float u_persistence, float u_freq, vec2 coords) {
    float sum = cnoise(coords*u_freq); 
    return sum * .5 + .5;
}


float getnoise_fbm(int octaves, float u_persistence, float u_freq, vec2 coords) {
    float amp= 1.; 
    float maxamp = 0.;
    float sum = 0.;
    for (int i=0; i < octaves; ++i) {
        sum += amp * cnoise(coords*u_freq); 
        u_freq *= 2.1;
        maxamp += amp;
        amp *= u_persistence;
    }   
    return (sum / maxamp) * .5 + .5;
}


void main() {

    vec2 p = vec2(v_vPosition.xy/u_resolution.x * u_scale);
    vec2 offset = vec2(u_xoffset, u_yoffset) / u_resolution.x * u_scale;
    p += offset;
    float value = NOISE(OCTAVES, u_persistence, u_freq, p);
    gl_FragColor = vec4(vec3(value), 1.0);
    
}

