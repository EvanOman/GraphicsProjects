#include "Framebuffer.h"
#include "util.h"
#include "Shader.h"
#include "Mesh.h"


Framebuffer::Framebuffer(int w, int h) {
    width = w;
    height = h;
    
    glGenFramebuffers(1, &fbo);
    glGenTextures(1, &colorTex);
    glGenTextures(1, &depthTex);
    
    // Set the dimensions of our textures
    glBindTexture(GL_TEXTURE_2D, colorTex);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA16F, width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, nullptr);
    
    glBindTexture(GL_TEXTURE_2D, depthTex);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_DEPTH_COMPONENT24, width, height, 0, GL_DEPTH_COMPONENT, GL_FLOAT, nullptr);
    
    // Bind the FBO to set the two textures
    glBindFramebuffer(GL_FRAMEBUFFER, fbo);
    glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, colorTex, 0);
    glFramebufferTexture2D(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_TEXTURE_2D, depthTex, 0);
    
    assertMsg(glCheckFramebufferStatus(GL_FRAMEBUFFER) == GL_FRAMEBUFFER_COMPLETE, "Framebuffer not complete");
    
    glBindFramebuffer(GL_FRAMEBUFFER, 0);
    
    assertGLOk();
    
}


Framebuffer::~Framebuffer() {
    glDeleteFramebuffers(1, &fbo);
    glDeleteTextures(1, &colorTex);
    glDeleteTextures(1, &depthTex);
}

void Framebuffer::setActive() {
    glBindFramebuffer(GL_FRAMEBUFFER, fbo);
}


void Framebuffer::drawQuadWithTextures(std::shared_ptr<Shader> shader) {
    static std::shared_ptr<Mesh> mesh;
    
    assertGLOk();
    
    if (!mesh) {
        mesh = std::make_shared<Mesh>();
        std::vector<glm::vec4> vertPos = {
            {-1, -1, 0, 1},
            {1, -1, 0, 1},
            {1, 1, 0, 1},
            {-1, 1, 0, 1}
        };
        std::vector<glm::vec4> texCoords = {
            {0, 0, 0, 0},
            {1, 0, 0, 0},
            {1, 1, 0, 0},
            {0, 1, 0, 0}
        };
        std::vector<int> indices = {0,1,2, 0,2,3};
        mesh->setAttribute("vertPos", vertPos);
        mesh->setAttribute("vertTexCoord", texCoords);
        mesh->setIndices(indices);
    }
    
    assertGLOk();
    
    GLint currentFramebuffer;
    glGetIntegerv(GL_DRAW_FRAMEBUFFER_BINDING, &currentFramebuffer);
    assertMsg(currentFramebuffer != fbo, "Trying to rendering with currently bound framebuffer");
    
    assertGLOk();
    
    GLuint program = shader->getProgramName();
    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_2D, colorTex);
    glGenerateMipmap(GL_TEXTURE_2D);
    
    assertGLOk();
    
    GLint texLocation = glGetUniformLocation(program, "tex");
    if (texLocation != -1) {
        glUniform1i(texLocation, 0);
    }
    
    GLint widthLocation = glGetUniformLocation(program, "width");
    if (widthLocation != -1) {
        glUniform1f(widthLocation, width);
    }
    GLint heightLocation = glGetUniformLocation(program, "height");
    if (heightLocation != -1) {
        glUniform1f(heightLocation, height);
    }
    
    assertGLOk();
    
    mesh->render(shader);
    
}