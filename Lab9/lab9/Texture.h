#ifndef TEXTURE_H
#define TEXTURE_H

#include "glinclude.h"

#include <string>
#include <memory>

class Shader;

class Texture {
public:
    Texture(std::string filename);
    Texture(const Texture& other) = delete;
    Texture &operator=(const Texture& other) = delete;
    ~Texture();
    
    void setMipMapping(bool toMip);
    
    void setClamp(bool toClamp);
    
    void bindTexture(std::shared_ptr<Shader> shader, std::string texName, int textureUnit);
    
    int width();
    
    int height();
    
private:
    GLuint name;
    int w;
    int h;
};

#endif