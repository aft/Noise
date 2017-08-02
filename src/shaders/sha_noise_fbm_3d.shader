attribute vec3 in_Position;
varying vec3 v_vPosition;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vPosition = in_Position;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~
#define OCTAVES 5 // CHANGE THIS AS YOU WISH

#if (OCTAVES > 1)
#define NOISE getnoise3d
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

float hash(float n) { return fract(sin(n) * 1e4); }

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

// Salt is added to limit the x,y values. No matter what you input,
// it returns a float around ~ 0-6001.
// I don't claim it to be undredictable, fast and uniform. 
// Feel free to adjust.
float salt(float seed) {
    if (seed == 0.) seed += 0.01;
    float a = mod(seed, 5901.);
    float b = mod(a,2.)==0. ? -0.01 : 0.11; 
    return mod(a+4179./sqrt(a*5.)*b+1001.*a/seed, 6001.);
}

float getnoise3d_single(int octaves, float u_persistence, float u_freq, vec3 coords) {
    return noise(coords*u_freq);
}

float getnoise3d(int octaves, float u_persistence, float u_freq, vec3 coords) {
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

void main() {

    float ss = salt(u_seed);
    vec3 p3 = vec3(v_vPosition.xyz/u_resolution.x) * u_scale;
    float value = NOISE(OCTAVES, u_persistence, u_freq, p3+vec3(ss, 0., 0.));
    
    gl_FragColor = vec4(vec3(value), 1.);
}

