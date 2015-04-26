#ifndef SHADER_CODE
#define SHADER_CODE

#include <string>


const std::string shaderPhongVert = R"VERT(
#version 150
in vec4 vertPos;
in vec4 vertColor;
in vec4 vertNormal;

uniform mat4 rot;

out vec4 interpColor;
out vec4 interpNormal;

void main() {
	gl_Position = rot * vertPos;
	interpColor = vertColor;
	interpNormal = vertNormal;
}
)VERT";




const std::string shaderPhongFrag = R"FRAG(
#version 150
out vec4 color;

in vec4 interpColor;
in vec4 interpNormal;

uniform vec4 eyePos;
uniform vec4 lightDirection1;
uniform vec4 lightDirection2;
uniform vec4 lightColor1;
uniform vec4 lightColor2;
uniform vec4 ambientColor;
uniform sampler2D diffuseTex;
uniform sampler2D specularTex;

void main() {
	
	vec3 normal = normalize(interpNormal.xyz);
	vec3 light1 = normalize(lightDirection1.xyz);
	vec3 light2 = normalize(lightDirection2.xyz);
	vec3 toEye = normalize(eyePos.xyz);
	
	float diffuseAmount1 = max(0.0, dot(normal, light1));
	float diffuseAmount2 = max(0.0, dot(normal, light2));

	vec4 diffuseTerm1 = lightColor1 * texture(diffuseTex, vec2(diffuseAmount1, diffuseAmount1));
	vec4 diffuseTerm2 = lightColor2 * texture(diffuseTex, vec2(diffuseAmount2, diffuseAmount2));

	//Need to calculate the H vector
	vec3 H1 = normalize(light1 + toEye);
	float HdN1 = dot(normal, H1);

	vec3 H2 = normalize(light2 + toEye);
	float HdN2 = dot(normal, H2);

	vec4 specularTerm1, specularTerm2;

	if (diffuseAmount1 > 0.0)
	{
		specularTerm1 = lightColor1 * texture(specularTex, vec2( pow(HdN1, 200.0), pow(HdN1, 200.0)));
	}
	else
	{
		specularTerm1 = vec4(0.0, 0.0 ,0.0, 0.0);
	}

	if (diffuseAmount2 > 0.0)
	{
		specularTerm2 = lightColor2 * texture(specularTex, vec2( pow(HdN2, 200.0), pow(HdN2, 200.0)));
	}
	else
	{
		specularTerm2 = vec4(0.0, 0.0 ,0.0, 0.0);
	}

	color = diffuseTerm1 + diffuseTerm2 + specularTerm1 + specularTerm2 + ambientColor;
}
)FRAG";



#endif