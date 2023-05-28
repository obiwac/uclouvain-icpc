#version 300 es

precision mediump float;

layout(location = 0) in vec3 a_pos;
layout(location = 1) in vec3 a_normal;

uniform mat4 u_model;
uniform mat4 u_vp;

out vec3 pos;
out vec3 normal;

out vec4 world_pos;
out float shading;
out float spec;

void main(void) {
	normal = a_normal;

	pos = a_pos;
	world_pos = u_model * vec4(a_pos, 1.0);

	gl_Position = u_vp * world_pos;

	// lighting

	vec3 adjusted_normal = (u_model * vec4(normal, 1.0)).xyz;
	vec3 sunlight = vec3(-1.0, 0.0, 1.0);

	vec3 normalized_normal = normalize(adjusted_normal);
	vec3 normalized_sunlight = normalize(sunlight);

	float product = dot(normalized_normal, normalized_sunlight);
	float diffuse = 0.5 + 0.6 * product;

	float ambient = 0.3;

	shading = max(ambient, diffuse);
	spec = pow(max(product, 0.0), 32.0);
}
