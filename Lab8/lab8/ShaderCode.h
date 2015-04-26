#ifndef SHADER_CODE
#define SHADER_CODE

#include <string>


const std::string shaderPhongVert = R"VERT(
#version 150
in vec4 vertPos;
in vec4 vertColor;
in vec4 vertNormal;
in vec4 vertTexCoord;

uniform mat4 rot;

out vec4 interpColor;
out vec4 interpNormal;
out vec2 interpTexCoord;

void main() {
	gl_Position = rot * vertPos;
	interpColor = vertColor;
	interpNormal = vertNormal;
	interpTexCoord = vertTexCoord.xy;
}
)VERT";




const std::string shaderPhongFrag = R"FRAG(
#version 150
out vec4 color;

in vec4 interpColor;
in vec4 interpNormal;
in vec2 interpTexCoord;

uniform vec4 eyePos;
uniform vec4 lightDirection;
uniform vec4 lightColor;
uniform vec4 ambientColor;

void main() {
	
	vec3 normal = normalize(interpNormal.xyz);
	vec3 light = normalize(lightDirection.xyz);
	vec3 toEye = normalize(eyePos.xyz);
	
	vec3 halfVec = normalize(toEye + light);
	
	float diffuseAmount = max(0.0, dot(normal, light));
	
	float specularAmount = pow(max(0.0, dot(halfVec,normal)), 2000.0);
	
	vec4 diffuseTerm = vec4(0.7, 0.5, 0.4, 1.0) * diffuseAmount + interpColor *ambientColor;
	vec4 specularTerm = vec4(10.0, 5.0, 2.0, 10.0) * specularAmount;
	diffuseTerm.a = 1.0;
	color = diffuseTerm + specularTerm;
}
)FRAG";



const std::string shaderHorizVert = R"VERT(
#version 150
in vec4 vertPos;
in vec4 vertTexCoord;

out vec2 interpTexCoord;

void main() {
	gl_Position = vertPos;
	interpTexCoord = vertTexCoord.xy;
}
)VERT";




const std::string shaderHorizFrag = R"FRAG(
#version 150
out vec4 color;

in vec2 interpTexCoord;

uniform sampler2D tex;
uniform float width;
uniform float height;

float guassian(float x)
{
	float sigma = 5.0;

	return exp(-pow(x,2)/(2.0*sigma*sigma))/(sqrt(2*3.14159*sigma*sigma));
}


void main() {
	vec4 accum = vec4(0.0, 0.0, 0.0, 0.0);
	
	/* Start at negative 5 standard deviations */
	float sigma = 5.0;
	float kerSize = 41.0;
	float leftPoint = -5.0*sigma;
	float iterScale = (10.0*sigma)/(kerSize);

	float x, weight;
	for (float i=1.0; i<kerSize; i++)
	{
		x = float(leftPoint + iterScale * i);
		weight = guassian(x);
		accum += texture(tex, interpTexCoord + vec2(x/(width), 0.0))*weight;
	}
	accum.a = 1.0;
	color = accum;
}
)FRAG";

const std::string shaderVertVert = R"VERT(
#version 150
in vec4 vertPos;
in vec4 vertTexCoord;

out vec2 interpTexCoord;

void main() {
	gl_Position = vertPos;
	interpTexCoord = vertTexCoord.xy;
}
)VERT";



const std::string shaderVertFrag = R"FRAG(
#version 150
out vec4 color;

in vec2 interpTexCoord;

uniform sampler2D tex;
uniform float width;
uniform float height;

float guassian(float x)
{
	float sigma = 5.0;

	return exp(-pow(x,2)/(2.0*sigma*sigma))/(sqrt(2*3.14159*sigma*sigma));
}

void main()
{
	vec4 accum = vec4(0.0, 0.0, 0.0, 0.0);
	
	/* Start at negative 5 standard deviations */
	float sigma = 5.0;
	float kerSize = 41.0;
	float leftPoint = -5.0*sigma;
	float iterScale = (10.0*sigma)/(kerSize);

	float x, weight;
	for (float i=1.0; i<kerSize; i++)
	{
		x = float(leftPoint + iterScale * i);
		weight = guassian(x);
		accum += texture(tex, interpTexCoord + vec2(0.0, x/(height)))*weight;
	}
	accum.a = 1.0;
	color = accum;
}
)FRAG";
#endif