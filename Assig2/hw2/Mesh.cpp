#include "Mesh.h"
#include "util.h"

Mesh::Mesh() {
    
}

Mesh::~Mesh() {
    for (auto& entry: attribs) {
        if (entry.second.buffer != 0) {
            glDeleteBuffers(1, &entry.second.buffer);
        }
    }
    if (indexBuffer != 0) {
        glDeleteBuffers(1, &indexBuffer);
    }
    if (vao != 0) {
        glDeleteVertexArrays(1, &vao);
    }
}

void Mesh::setAttribute(std::string name, std::vector<glm::vec4> vals) {
    attribs[name].data = vals;
    assertMsg(attribs[name].buffer == 0, "Assigning already set attribute");
}

void Mesh::setIndices(std::vector<int> ind) {
    indices = ind;
}

void Mesh::apply(GLuint program) {
    // If we're using a program we've already been set to, we don't
    // need to do any work
    if (program == appliedProgram) {
        glBindVertexArray(vao);
        return;
    }
    
    assertGLOk();
    
    if (vao == 0) {
        glGenVertexArrays(1, &vao);
        assertMsg(vao != 0, "Error creating vao");
    }
    glBindVertexArray(vao);
    
    assertGLOk();
    
    for (auto& entry: attribs) {
        if (entry.second.buffer == 0) {
            assertGLOk();
            
            glGenBuffers(1, &entry.second.buffer);
            assertMsg(entry.second.buffer, "Error creating buffer");
            
            glBindBuffer(GL_ARRAY_BUFFER, entry.second.buffer);
            
            assertGLOk();
            
            glBufferData(GL_ARRAY_BUFFER, vectorByteSize(entry.second.data),
                         &entry.second.data[0], GL_STATIC_DRAW);
            assertGLOk();
            
        } else {
            glBindBuffer(GL_ARRAY_BUFFER, entry.second.buffer);
        }
        
        assertGLOk();
        
        GLint attribLocation = glGetAttribLocation(program, entry.first.c_str());
        glVertexAttribPointer(attribLocation, 4, GL_FLOAT, GL_FALSE, 0, nullptr);
        glEnableVertexAttribArray(attribLocation);
    }
    
    if (indexBuffer == 0) {
        glGenBuffers(1, &indexBuffer);
    }
    
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, indexBuffer);

    glBufferData(GL_ELEMENT_ARRAY_BUFFER, vectorByteSize(indices), &indices[0], GL_STATIC_DRAW);
    
    appliedProgram = program;
}

void Mesh::render(GLuint program) {
    apply(program);
    
    assertGLOk();
    
    glDrawElements(GL_TRIANGLES, numIndices(), GL_UNSIGNED_INT, nullptr);
    
    assertGLOk();
}

int Mesh::numIndices() {
    return indices.size();
}