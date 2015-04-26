#ifndef FRAMEBUFFER_H
#define FRAMEBUFFER_H

#include "glinclude.h"
#include <memory>

class Shader;

class Framebuffer {
public:
    Framebuffer(int w, int h);
    
    // Do not allow FBOs to be copied
    Framebuffer(const Framebuffer &other) = delete;
    Framebuffer& operator=(const Framebuffer &other) = delete;
    
    ~Framebuffer();
    
    // Sets this FBO to be active
    void setActive();
    
    // Draws a full-screen quad
    void drawQuadWithTextures(std::shared_ptr<Shader> shader);
    
private:
    int width;
    int height;
    GLuint fbo;
    GLuint colorTex;
    GLuint depthTex;
};


#endif