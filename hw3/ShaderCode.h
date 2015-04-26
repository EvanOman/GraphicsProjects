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
    vec3 light = normalize(lightDirection1.xyz);
    vec3 toEye = normalize(eyePos.xyz);
    
    float diffuseAmount = max(0.0, dot(normal, light));
    
    vec4 diffuseTerm = texture(diffuseTex, vec2(diffuseAmount, diffuseAmount));
    color = diffuseTerm;
}
)FRAG";



#endif