#include "Shader.h"

#include "util.h"

#include <iostream>

using namespace std;

Shader::Shader(std::string vertSource, std::string fragSource) {
    GLuint vertShader = loadShader(GL_VERTEX_SHADER, vertSource);
    GLuint fragShader = loadShader(GL_FRAGMENT_SHADER, fragSource);
    
    assertMsg(vertShader != 0, "Error loading vertex shader");
    assertMsg(fragShader != 0, "Error loading fragment shader");
    
    // Create the program, attach the two shaders, and then link the program
    program = glCreateProgram();
    
    assertMsg(program != 0, "Error creating shader program");
    
    glAttachShader(program, vertShader);
    glAttachShader(program, fragShader);
    glLinkProgram(program);
    
    // If any errors are detected, display the error message and abort
    GLint err;
    glGetProgramiv(program, GL_LINK_STATUS, &err);
    if (err != GL_TRUE) {
        cerr << "Error linking program:" << endl;
        const int BUFFER_SIZE = 8192;
        char buffer[BUFFER_SIZE];
        int messageLength;
        glGetProgramInfoLog(program, BUFFER_SIZE, &messageLength, buffer);
        cerr << buffer << endl;
        abort();
    }
    
    assertGLOk();
}

GLuint Shader::getProgramName() {
    return program;
}

GLuint Shader::loadShader(GLenum type, const std::string &source) {
    GLuint shader = 0;
    shader = glCreateShader(type);
    
    assertMsg(shader != 0, "Error creating shader");
    
    // Send shader source to the graphics card.
    //
    // OpenGL demands a const char** for the shader source.
    // Create a const char* pointing to the std::string's c-string
    // representation and then pass a pointer to that to glShaderSource
    const char* shader_cstr = source.c_str();
    glShaderSource(shader, 1, &shader_cstr, nullptr);
    
    // Compile the shader source
    glCompileShader(shader);
    
    // Get shader status to see if there was a compilation error
    GLint status;
    glGetShaderiv(shader, GL_COMPILE_STATUS, &status);
    if (status != GL_TRUE) {
        cerr << "Error compiling shader:" << endl;
        const int BUFFER_SIZE = 8192;
        char errorMessage[BUFFER_SIZE];
        int messageLength;
        glGetShaderInfoLog(shader, BUFFER_SIZE, &messageLength, errorMessage);
        cerr << errorMessage << endl;
        abort();
    }
    // Return name of compiled shader
    return shader;
}