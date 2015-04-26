#ifndef OBJLOADER_H
#define OBJLOADER_H

#include "glinclude.h"

#include <memory>
#include <string>
#include <vector>
#include <map>
#include <utility>

class Mesh;

class OBJLoader {
public:
    // Loads in an obj file.  Assumes normals are specified in the file
    OBJLoader(std::string filename, glm::vec4 offset={0,0,0,0});
    
    std::vector<glm::vec4> getPositions();
    std::vector<glm::vec4> getNormals();
    
    std::vector<int> getIndices();
private:
    int indexForLocal(int pos, int norm);
    
    std::vector<glm::vec4> positions;
    std::vector<glm::vec4> normals;
    std::vector<int> indices;
    
    std::vector<glm::vec4> localPositions;
    std::vector<glm::vec4> localNormals;
    std::map<std::pair<int, int>, int> localGlobalMap;
};

#endif