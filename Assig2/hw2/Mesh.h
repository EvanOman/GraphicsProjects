#ifndef MESH_H
#define MESH_H

#include "glinclude.h"

#include <string>
#include <vector>
#include <map>

class Mesh {
public:
	Mesh();
	Mesh(const Mesh& other) = delete;
	Mesh& operator=(const Mesh& other) = delete;
	
	~Mesh();
	void setAttribute(std::string name, std::vector<glm::vec4> vals);
	void setIndices(std::vector<int> ind);
	void apply(GLuint program);
	void render(GLuint program);
	
	int numIndices();
private:
	std::vector<int> indices;
	
	template <class T>
	struct Attrib {
		std::vector<T> data;
		GLuint buffer = 0;
	};
	
	std::map<std::string, Attrib<glm::vec4>> attribs;
	GLuint indexBuffer = 0;
	GLuint vao = 0;
	
	GLuint appliedProgram = 0;
};


#endif