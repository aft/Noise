attribute vec3 in_Position;
varying vec3 v_vPosition;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vPosition = in_Position;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~

#define OCTAVES 2 // CHANGE THIS AS YOU WISH


varying vec3 v_vPosition;

uniform vec2 u_resolution;
uniform float u_seed;
uniform float u_frame;
uniform float u_persistence;
uniform float u_freq;
uniform float u_scale; // 10.

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
float hash(vec2 p) { return fract(1e4 * sin(17.0 * p.x + p.y * 0.1) * (0.1 + abs(sin(p.y * 13.0 + p.x)))); }

float noise(float x) {
    float i = floor(x);
    float f = fract(x);
    float u = f * f * (3.0 - 2.0 * f);
    return mix(hash(i), hash(i + 1.0), u);
}

float noise(vec2 x) {
    vec2 i = floor(x);
    vec2 f = fract(x);
    float a = hash(i);
    float b = hash(i + vec2(1.0, 0.0));
    float c = hash(i + vec2(0.0, 1.0));
    float d = hash(i + vec2(1.0, 1.0));
    vec2 u = f * f * (3.0 - 2.0 * f);
    return mix(a, b, u.x) + (c - a) * u.y * (1.0 - u.x) + (d - b) * u.x * u.y;
}

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

float getnoise2d(int octaves, float u_persistence, float u_freq, vec2 coords) {
    float amp= .5; 
    float maxamp = 0.;
    float sum = 0.;
    float shift = 100.;
    mat2 rot = mat2(cos(0.5), sin(0.5), -sin(0.5), cos(0.5));
    for (int i=0; i < octaves; ++i) {
        sum += amp * noise(coords*u_freq);
        coords = rot * coords * 2.0 + vec2(shift);
        maxamp += amp;
        amp *= u_persistence;
    }
    return sum/maxamp;
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

    float ss = salt(u_seed)/u_resolution.x;
    
    vec2 p = vec2(v_vPosition.xy/u_resolution.x * u_scale);
    vec3 p3 = vec3(v_vPosition.xyz/u_resolution.x* u_scale) ;
    float value;
    
    if (v_vPosition.x/u_resolution.x <= .5) {
        value = getnoise2d(OCTAVES, u_persistence, u_freq, p+vec2(ss, 0.));
    } else {
        value = getnoise3d(OCTAVES, u_persistence, u_freq, p3+vec3(ss, 0., 0.));
    }
      
    value *= smoothstep(0.0, 0.005, abs(0.5-v_vPosition.x/u_resolution.x));

    gl_FragColor = vec4(vec3(value), 1.);
}

