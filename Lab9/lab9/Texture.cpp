#include "Texture.h"

#include <vector>
#include <fstream>
#include "util.h"
#include "StringUtil.h"
#include "Inreader.h"
#include "Shader.h"

Texture::Texture(std::string filename) {
    std::vector<glm::vec3> colors;
    
    Inreader inr(filename);
    
    
    assertMsg(inr.getString() == "P3", "Unexpected format");
    
    w = inr.getInt();
    h = inr.getInt();
    
    float maxVal = inr.getFloat();
    
    for (int y=0; y<h; y++) {
        for (int x=0; x<w; x++) {
            int r,g,b;
            r = inr.getInt();
            g = inr.getInt();
            b = inr.getInt();
            colors.push_back({r/maxVal, g/maxVal, b/maxVal});
        }
    }
    glGenTextures(1, &name);
    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_2D, name);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, w, h, 0, GL_RGB, GL_FLOAT, &colors[0]);
    glGenerateMipmap(GL_TEXTURE_2D);
    setMipMapping(true);
}

void Texture::setClamp(bool toClamp) {
    glBindTexture(GL_TEXTURE_2D, name);
    auto val = toClamp ? GL_CLAMP_TO_EDGE : GL_REPEAT;
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, val);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, val);
}

void Texture::setMipMapping(bool toMip) {
    glBindTexture(GL_TEXTURE_2D, name);
    if (toMip) {
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_LINEAR);
    } else {
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_LINEAR);
    }
}

void Texture::bindTexture(std::shared_ptr<Shader> shader, std::string texName, int textureUnit) {
    glActiveTexture(GL_TEXTURE0 + textureUnit);
    glBindTexture(GL_TEXTURE_2D, name);
    
    GLint texLocation = glGetUniformLocation(shader->getProgramName(), texName.c_str());
    if (texLocation != -1) {
        glUniform1i(texLocation, textureUnit);
    }
}

Texture::~Texture() {
    glDeleteTextures(1, &name);
}

int Texture::width() {
    return w;
}

int Texture::height() {
    return h;
}