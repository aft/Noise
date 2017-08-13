/*
THIS SHADER IS DEMO PURPOSES ONLY. DO NOT USE IT
*/

attribute vec3 in_Position;
varying vec3 v_vPosition;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vPosition = in_Position;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~
// Minor edits & seed support (offsetting) by Cem Baspinar. 
// https://www.shadertoy.com/view/4djcDG
// Reuse permitted under the BSD license.
//
// Based on Morgan McGuire's code. https://www.shadertoy.com/view/4dS3Wd
// By Morgan McGuire @morgan3d, http://graphicscodex.com
// Reuse permitted under the BSD license.

// All noise functions are designed for values on integer scale.
// They are tuned to avoid visible periodicity for both positive and
// negative coordinates within a few orders of magnitude.


#define OCTAVES 5 // CHANGE THIS AS YOU WISH
#define DEMO_MODE // Comment out this line. It is only needed for a demo.

#if (OCTAVES > 1)
#define NOISE getnoise3d_fbm
#else
#define NOISE getnoise3d_single
#endif

varying vec3 v_vPosition;

uniform vec2 u_resolution;
uniform float u_seed;
uniform float u_frame;
uniform float u_persistence;
uniform float u_freq;
uniform float u_scale; // 1.
uniform float u_xoffset; // 0.
uniform float u_yoffset; // 0.
uniform float u_zoffset; // 0.

float hash(float n) { return fract(sin(n + u_seed) * 1e4); }

float noise(vec3 x) {
    // Random rotation idea to reduce artifacts by @dgreensp 
    // https://www.shadertoy.com/view/XtsXRn
    x = mat3(0.28862355854826727, 0.6997227302779844,  0.6535170557707412,
             0.06997493955670424, 0.6653237235314099, -0.7432683571499161,
             -0.9548821651308448, 0.26025457467376617, 0.14306504491456504)*x;
    const vec3 step = vec3(110, 241, 171);
    vec3 i = floor(x);
    vec3 f = fract(x);
    float n = dot(i, step);
    vec3 u = f * f * (3.0 - 2.0 * f);
    return mix(mix(mix( hash(n + dot(step, vec3(0, 0, 0))), hash(n + dot(step, vec3(1, 0, 0))), u.x),
                   mix( hash(n + dot(step, vec3(0, 1, 0))), hash(n + dot(step, vec3(1, 1, 0))), u.x), u.y),
               mix(mix( hash(n + dot(step, vec3(0, 0, 1))), hash(n + dot(step, vec3(1, 0, 1))), u.x),
                   mix( hash(n + dot(step, vec3(0, 1, 1))), hash(n + dot(step, vec3(1, 1, 1))), u.x), u.y), u.z);
}

float getnoise3d_single(int octaves, float u_persistence, float u_freq, vec3 coords) {
    return noise(coords*u_freq);
}

float getnoise3d_fbm(int octaves, float u_persistence, float u_freq, vec3 coords) {
    float amp= .5; 
    float maxamp = 0.;
    float sum = 0.;
    float shift = 100.;
    for (int i=0; i < octaves; ++i) {
        sum += amp * noise(coords*u_freq);
        coords = coords * 1.5 + vec3(shift);
        maxamp += amp;
        amp *= u_persistence;
    }
    return sum/maxamp;
}

// This function is only for a demo. You may remove this 
// and ifdef block in the main function.
vec3 use_time(vec3 p) {
    p.z = u_frame / u_resolution.x * 0.5;
    return p;
}

void main() {

    vec3 p = vec3(v_vPosition.xyz/u_resolution.x) * u_scale;
    vec3 offset = vec3(u_xoffset, u_yoffset, u_zoffset) / u_resolution.x * u_scale;
        
    #ifdef DEMO_MODE 
        p =  use_time(p);
    #endif
    
    p += offset;
    float value = NOISE(OCTAVES, u_persistence, u_freq, p);
    gl_FragColor = vec4(vec3(value), 1.);
    
}

