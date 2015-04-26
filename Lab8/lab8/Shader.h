#ifndef SHADER_H
#define SHADER_H

#include "glinclude.h"

#include <string>


class Shader {
public:
    Shader(std::string vertSource, std::string fragSource);
    
    GLuint getProgramName();
private:
    
    GLuint loadShader(GLenum type, const std::string &source);
    
    GLuint program;
};


#endif