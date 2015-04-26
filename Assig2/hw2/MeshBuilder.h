#ifndef MESHBUILDER_H
#define MESHBUILDER_H

#include "glinclude.h"
#include "util.h"

#include <string>
#include <map>
#include <vector>
#include <memory>

#include "Mesh.h"

class MeshBuilder {
public:
	MeshBuilder();
	
	enum class DrawMode {
		TRIANGLES,
		TRIANGLE_STRIP,
		TRIANGLE_LOOP,
		QUADS
	};
	
	void beginDraw(DrawMode mode);
	
	void setColor(glm::vec4 col);
	
	void setNormal(glm::vec4 nor);
	void setNormal(glm::vec3 nor);
	
	void sendVertex(glm::vec4 pos);
	
	void endDraw();
	
	std::shared_ptr<Mesh> getMesh();
	
	void clear();
private:
	void sendTriangleVertex(glm::vec4 pos);
	void sendTriangleStripVertex(glm::vec4 pos);
	void sendTriangleLoopVertex(glm::vec4 pos);
	void sendQuadVertex(glm::vec4 pos);
	
	void createBuffers();
	
	void loadGeometry(GLuint program);
	
	std::vector<glm::vec4> colors;
	std::vector<glm::vec4> positions;
	std::vector<glm::vec4> normals;
	
	std::vector<glm::vec4> colorAccum;
	std::vector<glm::vec4> positionAccum;
	std::vector<glm::vec4> normalAccum;
	
	glm::vec4 color;
	glm::vec4 normal;
	
	std::vector<int> indices;
	
	int primitiveStartIndex;
	
	bool drawing;
	DrawMode currentMode;
	
	GLuint vertexArray;
	GLuint indexBuffer;
	GLuint positionBuffer;
	GLuint colorBuffer;
	GLuint normalBuffer;
	int numElements;
	
	bool dirty;
	
	std::shared_ptr<Mesh> cachedMesh;
};


#endif