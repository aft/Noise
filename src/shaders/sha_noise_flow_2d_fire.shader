attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)


varying vec3 v_vPosition;


void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vPosition = in_Position;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~

#ifdef GL_ES
precision mediump float;
#endif

uniform float u_frame;
uniform vec2 u_resolution;
uniform float u_scale;

varying vec3 v_vPosition;


#define u_time float(u_frame)*0.008

// http://glslsandbox.com/e#11554.0
// Based on @301z's fire.

float rand(vec2 n) { 
    return fract(cos(dot(n, vec2(12.9898, 4.1414))) * 43758.5453);
}

float noise(vec2 n) {
    const vec2 d = vec2(0.0, 1.0);
    vec2 b = floor(n), f = smoothstep(vec2(0.0), vec2(1.0), fract(n));
    return mix(mix(rand(b), rand(b + d.yx), f.x), mix(rand(b + d.xy), rand(b + d.yy), f.x), f.y);
}

float fbm(vec2 n) {
    float total = 0.0, amplitude = 1.0;
    for (int i = 0; i < 7; i++) {
        total += noise(n) * amplitude;
        n += n;
        amplitude *= .5;
    }
    return total;
}

void main() {
    const vec3 c1 = vec3(0.1, 0.0, 0.0);
    const vec3 c2 = vec3(0.7, 0.0, 0.0);
    const vec3 c3 = vec3(0.2, 0.0, 0.0);
    const vec3 c4 = vec3(1.0, 0.9, 0.0);
    const vec3 c5 = vec3(0.1);
    const vec3 c6 = vec3(0.9);
    
    vec2 p = v_vPosition.xy / u_resolution.xy;
    p.x *= u_resolution.x / u_resolution.y;
    p *= u_scale;
    
    float q = fbm(p - u_time * 0.1);
    vec2 r = vec2(fbm(p + q + u_time * 0.7 - p.x - p.y), fbm(p + q - u_time * 0.4));
    vec3 c = mix(c1, c2, fbm(p + r)) + mix(c3, c4, r.x) - mix(c5, c6, r.y);
    gl_FragColor = vec4(c * cos(1.57 * 20.0), 1.0);
    
}
