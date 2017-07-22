attribute vec3 in_Position;
varying vec3 v_vPosition;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vPosition = in_Position;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~


varying vec3 v_vPosition;

uniform vec2 u_resolution;
uniform float u_scale;
uniform float u_seed;
uniform float u_frame;


// Minor edits & seed support (offsetting) by Cem Baspinar. 
// Reuse permitted under the BSD license.
// Cheap Fractal Noise by @dgreensp https://www.shadertoy.com/view/XtsXRn
// Cheap, simple, fractal noise based on iq's https://www.shadertoy.com/view/4sfGzS

float noise(vec3 x) {
    vec3 p = floor(x);
    vec3 f = fract(x);
    f = f*f*(3.-2.*f);

    float n = p.x + p.y*157. + 113.*p.z;
    
    vec4 v1 = fract(753.5453123*sin(n + vec4(0., 1., 157., 158.)));
    vec4 v2 = fract(753.5453123*sin(n + vec4(113., 114., 270., 271.)));
    vec4 v3 = mix(v1, v2, f.z);
    vec2 v4 = mix(v3.xy, v3.zw, f.y);
    return mix(v4.x, v4.y, f.x);
}

float fnoise(vec3 p) {
  // random rotation reduces artifacts
  p = mat3(0.28862355854826727, 0.6997227302779844, 0.6535170557707412,
           0.06997493955670424, 0.6653237235314099, -0.7432683571499161,
           -0.9548821651308448, 0.26025457467376617, 0.14306504491456504)*p;
    
  return dot(vec4(noise(p), noise(p*2.), noise(p*4.), noise(p*8.)),
             vec4(0.5, 0.25, 0.125, 0.06));
}

// Salt is added to limit the x,y values. No matter what you input,
// it returns a float around ~ 0-6000.
// I don't claim it to be undredictable, fast and uniform. 
// Feel free to adjust.
float salt(float seed) {
    if (seed == 0.) seed += 0.01;
    float a = mod(seed, 5901.);
    float b = mod(a,2.)==0. ? -0.01 : 0.11; 
return a+4179./sqrt(a*5.)*b+1001.*a/seed;
}

void main() {
    vec3 ss = vec3(salt(u_seed)/u_resolution.x);
    vec3 p = v_vPosition.xyz/u_resolution.x;
    p += ss;
    p *= u_scale;
    float value = fnoise(p);
    gl_FragColor = vec4(vec3(value), 1.);
}

