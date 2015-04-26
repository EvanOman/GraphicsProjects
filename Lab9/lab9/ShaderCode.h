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
out float blendAmount;

void main() {
    gl_Position = rot * vertPos;
    interpColor = vertColor;
    interpNormal = vertNormal;
    blendAmount = clamp(vertPos.x + 0.5, 0.0, 1.0);
}
)VERT";




const std::string shaderPhongFrag = R"FRAG(
#version 150
out vec4 color;

in vec4 interpColor;
in vec4 interpNormal;
in float blendAmount;

uniform vec4 eyePos;
uniform vec4 lightDirection1;
uniform vec4 lightDirection2;
uniform vec4 lightColor1;
uniform vec4 lightColor2;
uniform vec4 ambientColor;
uniform sampler2D matcap1Tex;
uniform sampler2D matcap2Tex;

uniform mat4 normalMatrix;

void main() {
    
    vec3 normal = normalize(interpNormal.xyz);
    vec3 light = normalize(lightDirection1.xyz);
    vec3 toEye = normalize(eyePos.xyz);
    
    float diffuseAmount = max(0.0, dot(normal, light));
    
    vec3 localNormal = normalize((normalMatrix * vec4(normal, 0.0)).xyz);
    
    vec2 xy = localNormal.xy;

    xy = vec2(xy.x, -1*xy.y);

    vec2 transXY = (4*(xy + 1) - 1)/2;

    vec4 c1 = texture(matcap1Tex, -xy);
    vec4 c2 = texture(matcap2Tex, -xy);

    color = mix(c1, c2, diffuseAmount) + ambientColor;
}
)FRAG";



#endif