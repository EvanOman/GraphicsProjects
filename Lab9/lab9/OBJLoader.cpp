#include "OBJLoader.h"


#include "Mesh.h"
#include "Inreader.h"
#include "StringUtil.h"
#include "util.h"

using namespace std;
using namespace glm;

OBJLoader::OBJLoader(std::string filename, vec4 offset) {
    cout << "HARR";
    Inreader inr(filename);
    while (!inr.atEof()) {
        string line = inr.getLine();
        auto entries = StringUtil::split(line, " ");
        vector<string> validEntries;
        copy_if(entries.begin(), entries.end(), back_inserter(validEntries), [](string &s)-> bool {return s.size() != 0;});
        if (validEntries[0] == "v") {
            assertMsg(validEntries.size() >= 4, "'v' line with not enough parameters");
            vec4 pos;
            bool success;
            tie(pos.x, success) = StringUtil::toFloat(validEntries[1]);
            assertMsg(success, "Error parsing float");
            tie(pos.y, success) = StringUtil::toFloat(validEntries[2]);
            assertMsg(success, "Error parsing float");
            tie(pos.z, success) = StringUtil::toFloat(validEntries[3]);
            assertMsg(success, "Error parsing float");
            pos.w = 1.0;
            pos += offset;
            localPositions.push_back(pos);
        } else if (validEntries[0] == "vn") {
            assertMsg(validEntries.size() >= 4, "'vn' line with not enough parameters");
            vec4 norm;
            bool success;
            tie(norm.x, success) = StringUtil::toFloat(validEntries[1]);
            assertMsg(success, "Error parsing float");
            tie(norm.y, success) = StringUtil::toFloat(validEntries[2]);
            assertMsg(success, "Error parsing float");
            tie(norm.z, success) = StringUtil::toFloat(validEntries[3]);
            assertMsg(success, "Error parsing float");
            norm.w = 1.0;
            localNormals.push_back(norm);
        } else if (validEntries[0] == "f") {
            assertMsg(validEntries.size() >= 4, "'f' line with not enough parameters");
            vector<int> faces;
            for (int i=1; i<validEntries.size(); i++) {
                auto perFace = StringUtil::split(validEntries[i], "/");
                assertMsg(perFace.size() == 3, "Need position and normal per face");
                bool success;
                int posIdx, normIdx;
                tie(posIdx, success) = StringUtil::toInt(perFace[0]);
                assertMsg(success, "Error loading vertex position");
                tie(normIdx, success) = StringUtil::toInt(perFace[2]);
                assertMsg(success, "Error loading vertex normal");
                
                // OBJ starts counting at 1, not 0
                posIdx--;
                normIdx--;
                faces.push_back(indexForLocal(posIdx, normIdx));
            }
            for (int i=2; i<faces.size(); i++) {
                indices.push_back(faces[i-2]);
                indices.push_back(faces[i-1]);
                indices.push_back(faces[i]);
            }
        } else {
            cout << "Unrecognized line type: " << validEntries[0] << endl;
        }
    }
}

std::vector<glm::vec4> OBJLoader::getPositions() {
    return positions;
}
std::vector<glm::vec4> OBJLoader::getNormals() {
    return normals;
}

std::vector<int> OBJLoader::getIndices() {
    return indices;
}

int OBJLoader::indexForLocal(int pos, int norm) {
    auto pr = std::make_pair(pos, norm);
    auto it = localGlobalMap.find(pr);
    if (it != localGlobalMap.end()) {
        return it->second;
    } else {
        positions.push_back(localPositions[pos]);
        normals.push_back(localNormals[norm]);
        assertMsg(positions.size() == normals.size(), "Positions and normals different size");
        int idx = positions.size() - 1;
        localGlobalMap[pr]=idx;
        return idx;
    }
}