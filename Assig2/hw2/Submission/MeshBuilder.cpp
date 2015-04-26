#include "MeshBuilder.h"

MeshBuilder::MeshBuilder() {
	drawing = false;
	vertexArray = 0;
	indexBuffer = 0;
	positionBuffer = 0;
	colorBuffer = 0;
	normalBuffer = 0;
	numElements = 0;
	dirty = true;
}

void MeshBuilder::beginDraw(DrawMode mode) {
	cachedMesh = nullptr;
	assertMsg(drawing == false, "Beginning draw while draw already begun");
	drawing = true;
	currentMode = mode;
	primitiveStartIndex = positions.size();
	dirty = true;
}

void MeshBuilder::setColor(glm::vec4 col) {
	color = col;
}

void MeshBuilder::setNormal(glm::vec4 nor) {
	normal = nor;
}

void MeshBuilder::setNormal(glm::vec3 nor) {
	normal = glm::vec4{nor, 0.0};
}

void MeshBuilder::sendVertex(glm::vec4 pos) {
	assertMsg(drawing, "Sending vertex while not drawing");
	switch (currentMode) {
		case DrawMode::TRIANGLES:
			sendTriangleVertex(pos);
			break;
		case DrawMode::TRIANGLE_STRIP:
			sendTriangleStripVertex(pos);
			break;
		case DrawMode::TRIANGLE_LOOP:
			sendTriangleLoopVertex(pos);
			break;
		case DrawMode::QUADS:
			sendQuadVertex(pos);
			break;
		default:
			assertMsg(false, "Unexpected DrawMode");
			break;
	}
}

void MeshBuilder::sendTriangleVertex(glm::vec4 pos)
{
	if (positionAccum.size() == 2)
	{
		colors.push_back(colorAccum[0]);
		colors.push_back(colorAccum[1]);
		colors.push_back(color);
		colorAccum.clear();
		
		positions.push_back(positionAccum[0]);
		positions.push_back(positionAccum[1]);
		positions.push_back(pos);
		positionAccum.clear();
		
		normals.push_back(normalAccum[0]);
		normals.push_back(normalAccum[1]);
		normals.push_back(normal);
		normalAccum.clear();
		
		indices.push_back(positions.size() - 3);
		indices.push_back(positions.size() - 2);
		indices.push_back(positions.size() - 1);
	} else {
		colorAccum.push_back(color);
		positionAccum.push_back(pos);
		normalAccum.push_back(normal);
	}
}

/*
	Receives veritices and makes a triangle strip using the passed in 
	position and the global color and normal vectors
*/
void MeshBuilder::sendTriangleStripVertex(glm::vec4 pos) {

	/* Here we will just always add the new vertex */
	colorAccum.push_back(color);
	positionAccum.push_back(pos);
	normalAccum.push_back(normal);

	/* If we have 3 or more vertices we can start drawing the strip */
	if (positionAccum.size() >= 3)
	{
		/* Every time we have more than 3 vertices we simply need to make a triangle out of the previous 3 */
		colors.push_back(colorAccum[colorAccum.size() - 3]);
		colors.push_back(colorAccum[colorAccum.size() - 2]);
		colors.push_back(colorAccum[colorAccum.size() - 1]);

		normals.push_back(normalAccum[normalAccum.size() - 3]);
		normals.push_back(normalAccum[normalAccum.size() - 2]);
		normals.push_back(normalAccum[normalAccum.size() - 1]);

		positions.push_back(positionAccum[positionAccum.size() - 3]);
		positions.push_back(positionAccum[positionAccum.size() - 2]);
		positions.push_back(positionAccum[positionAccum.size() - 1]);

		indices.push_back(positions.size() - 3);
		indices.push_back(positions.size() - 2);
		indices.push_back(positions.size() - 1);
	}
}

/*
	Receives veritices and makes a triangle loop using the passed in 
	position and the global color and normal vectors
*/
void MeshBuilder::sendTriangleLoopVertex(glm::vec4 pos)
{
	/* During the adding phase, this acts the same as the strip */
	sendTriangleStripVertex(pos);
}

/*
	Receives veritices in groups of 4 and makes a square using the passed in 
	position and the global color and normal vectors
*/
void MeshBuilder::sendQuadVertex(glm::vec4 pos)
{
	/* If we already have three vertices, the new one completes the square */
	if (positionAccum.size() == 3)
	{
		/* Pretty much identical to the triangle one except we make 2 triangles */
		colors.push_back(colorAccum[0]);
		colors.push_back(colorAccum[1]);
		colors.push_back(colorAccum[2]);
		colors.push_back(colorAccum[0]);
		colors.push_back(colorAccum[2]);
		colors.push_back(color);
		colorAccum.clear();
		
		positions.push_back(positionAccum[0]);
		positions.push_back(positionAccum[1]);
		positions.push_back(positionAccum[2]);
		positions.push_back(positionAccum[0]);
		positions.push_back(positionAccum[2]);
		positions.push_back(pos);
		positionAccum.clear();
		
		normals.push_back(normalAccum[0]);
		normals.push_back(normalAccum[1]);
		normals.push_back(normalAccum[2]);
		normals.push_back(normalAccum[0]);
		normals.push_back(normalAccum[2]);
		normals.push_back(normal);
		normalAccum.clear();
		
		indices.push_back(positions.size() - 6);
		indices.push_back(positions.size() - 5);
		indices.push_back(positions.size() - 4);
		indices.push_back(positions.size() - 3);
		indices.push_back(positions.size() - 2);
		indices.push_back(positions.size() - 1);
	}
	else
	{
		colorAccum.push_back(color);
		positionAccum.push_back(pos);
		normalAccum.push_back(normal);
	}
}


void MeshBuilder::endDraw() {

	assertMsg(drawing, "Called endDraw while not drawing");

	/*
		Here is where the connecting of the end triangles for a loop occurs
	*/
	if (currentMode == DrawMode::TRIANGLE_LOOP)
	{
		if (positions.size() > primitiveStartIndex + 3)
		{
			indices.push_back(positions.size() - 1);
			indices.push_back(primitiveStartIndex);
			indices.push_back(primitiveStartIndex+1);
			
			indices.push_back(positions.size() - 2);
			indices.push_back(positions.size() - 1);
			indices.push_back(primitiveStartIndex);
		}
	}
	
	drawing = false;
	dirty = true;
	normalAccum.clear();
	colorAccum.clear();
	positionAccum.clear();
}

void MeshBuilder::clear() {
	assertMsg(drawing == false, "Clearing in the middle of drawing");
	
	indices.clear();
	colors.clear();
	positions.clear();
	normals.clear();
	
	drawing = false;
}

std::shared_ptr<Mesh> MeshBuilder::getMesh() {
	if (cachedMesh) {
		return cachedMesh;
	}
	
	auto mesh = std::make_shared<Mesh>();
	
	mesh->setAttribute("vertPos", positions);
	mesh->setAttribute("vertColor", colors);
	mesh->setAttribute("vertNormal", normals);
	mesh->setIndices(indices);
	
	cachedMesh = mesh;
	
	return mesh;
}
