#version 300 es

precision mediump float;
precision lowp int;

in vec3 pos;
in vec3 normal;

in vec4 world_pos;
in float shading;

out vec4 frag_colour;

void main(void) {
	frag_colour = /* vec4(1.0, 0.0, 0.0, 1.0) * vec4(vec3(shading), 1.0); */ vec4(normal, 1.0);
}
