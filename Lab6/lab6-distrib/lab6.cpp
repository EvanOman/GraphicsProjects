/*
	Evan Oman
	Lab 6
	3/7/2014
*/


#include "glinclude.h"
#include "util.h"

#include <cmath>
#include <iostream>
#include <vector>

#include "CircleInclude.h"
#include "TorusInclude.h"

using namespace std;

// Structure to hold the various OpenGL names for the buffers and array that
// hold our 3D geometry
struct geometry {
	GLuint vertexArray;
	GLuint indexBuffer;
	GLuint positionBuffer;
	GLuint colorBuffer;
	GLuint normalBuffer;
	int numElements;
};

// Function prototypes for the functions declared in this file
void printOpenGLInfo();
GLuint loadShaders();
GLuint loadShader(GLenum type, const std::string &source);
geometry createBuffers();

void loadGeometry(geometry& geom,
				  GLuint program,
				  vector<glm::vec4> positions,
				  vector<glm::vec4> colors,
				  vector<glm::vec4> normals,
				  vector<int> indices);

void updateGeometry(geometry &geom, GLuint program);

void drawGeometry(geometry geom, GLuint program, int frame);

void keyboardCallback(GLFWwindow* window, int key, int scancode, int action, int mods);

void mouseCallback(GLFWwindow *window, double x, double y);

double around;
double up;
double cameraDistance;

double oldMouseX;
double oldMouseY;

int currentObject = 1;
bool needUpdate = true;

int main() {
	// Initialize the GLFW library
	int result = glfwInit();
	assertMsg(result, "Error initializing GLFW");
	
	// Request an OpenGL 3.2 core profile
	glfwWindowHint(GLFW_RESIZABLE, GL_FALSE);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 2);
	glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
	glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
	
	// Create 640x480 point window
	GLFWwindow *window = glfwCreateWindow(640, 480, "Hello OpenGL", nullptr, nullptr);
	
	assertMsg(window != nullptr, "Error creating window");
	
	around = 0;
	up = 0;
	cameraDistance = 2.5;
	
	glfwSetKeyCallback(window, keyboardCallback);
	glfwSetCursorPosCallback(window, mouseCallback);
	
	// Activate the OpenGL context associated with the window we created
	glfwMakeContextCurrent(window);
	
	glEnable(GL_DEPTH_TEST);
	
	// Print out OpenGL vendor and version
	printOpenGLInfo();
	
	// Load, compile and link shaders
	GLuint program = loadShaders();
	
	// Load geometry, and set attributes for the shader program
	geometry geom = createBuffers();
	
	// This is what's called the "run loop" or "rendering loop"
	// We keep looping until the user wants to quit.
	int frame = 0;
	while (!glfwWindowShouldClose(window)) {
		assertGLOk();
		
		// If needed, update the geometry on the GPU
		updateGeometry(geom, program);
		
		// Set the color to clear the widow with
		glClearColor(0.35, 0.35, 0.35, 0.0);
		
		// Clear both the color and the depth buffers
		glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
		
		// Draw the geometry to the screen using the shader program
		drawGeometry(geom, program, frame);
		
		// Swap the front and back buffers
		glfwSwapBuffers(window);
		
		// Check for any user events, such as pressing a key or clicking
		// the "close" button
		glfwPollEvents();
		
		// Increase the frame counter
		frame++;
	}
	
	// Window has been created.  Before quitting, we need to clean up
	glfwDestroyWindow(window);
	glfwTerminate();
	return 0;
}

// Utility function to print out the OpenGL vendor and version
void printOpenGLInfo() {
	assertGLOk();
	const GLubyte *str;
	str = glGetString(GL_VENDOR);
	cout << "GL_VENDOR: " << str << endl;
	
	str = glGetString(GL_VERSION);
	cout << "GL_VERSION: " << str << endl;
	
	assertGLOk();
}

// Given as input a shader type (either GL_VERTEX_SHADER or GL_FRAGMENT_SHADER),
// create a shader on the GPU, copy the source to the GPU, and compile the
// shader.  If any errors are detected, displays an error message and calls
// abort().  Returns the name of the shader
GLuint loadShader(GLenum type, const std::string &source) {
	GLuint shader = 0;
	shader = glCreateShader(type);
	
	assertMsg(shader != 0, "Error creating shader");
	
	// Send shader source to the graphics card.
	//
	// OpenGL demands a const char** for the shader source.
	// Create a const char* pointing to the std::string's c-string
	// representation and then pass a pointer to that to glShaderSource
	const char* shader_cstr = source.c_str();
	glShaderSource(shader, 1, &shader_cstr, nullptr);
	
	// Compile the shader source
	glCompileShader(shader);

	// Get shader status to see if there was a compilation error
	GLint status;
	glGetShaderiv(shader, GL_COMPILE_STATUS, &status);
	if (status != GL_TRUE) {
		cerr << "Error compiling shader:" << endl;
		const int BUFFER_SIZE = 8192;
		char errorMessage[BUFFER_SIZE];
		int messageLength;
		glGetShaderInfoLog(shader, BUFFER_SIZE, &messageLength, errorMessage);
		cerr << errorMessage << endl;
		abort();
	}
	// Return name of compiled shader
	return shader;
}

// Load hard-coded vertex and fragments shader source, link them, and return
// the name of the linked program on the GPU
GLuint loadShaders() {
	assertGLOk();
	
	// This uses C++11 raw string syntax to embed a multi-line string inside
	// C++ source.  The R" characters indicate the beginning of a raw string.
	// The characters between the " and the ( are the delimeter that is needed
	// to end the string.  Everything between the starting symbol 'R"VERT(' and
	// the ending symbol ')VERT"' is placed inside of the string.  Instead of
	// using this notation, we could instead load this data from disk, but that
	// is more complicated.
	std::string vertexSource = R"VERT(
#version 150
	in vec4 vertPos;
	in vec4 vertColor;
	in vec4 vertNormal;
	
	uniform mat4 rot;
	
	out vec4 interpColor;
	out vec4 interpNormal;

	void main() {
		gl_Position = rot * vertPos;
		interpColor = vertColor;
		interpNormal = vertNormal;
	}
	)VERT";
	
	std::string fragmentSource = R"FRAG(
#version 150
	out vec4 color;
	
	in vec4 interpColor;
	in vec4 interpNormal;
	uniform vec4 eyePos;
	uniform vec4 lightDirection;
	uniform vec4 lightColor;
	uniform vec4 ambientColor;
	
	void main() {
		
		vec3 normal = normalize(interpNormal.xyz);
		vec3 light = normalize(lightDirection.xyz);
		vec3 toEye = normalize(eyePos.xyz);

		float diffuseAmount = max(0.0, dot(normal, light));
		vec4 diffuseTerm = diffuseAmount * lightColor * interpColor;

		//Need to calculate the H vector
		vec3 H = normalize(light + toEye);
		float HdN = dot(normal, H);
		
		//Only use the specular term if the diffuseAmount is greater than 0
		vec4 specularTerm = (diffuseAmount > 0.0) ? lightColor * vec4(1.0, 1.0, 1.0, 1.0) * pow(HdN, 250) : vec4(0.0, 0.0 ,0.0, 0.0);
		
		vec4 ambientTerm = ambientColor * interpColor;
		
		color = diffuseTerm + specularTerm + ambientTerm;
	}
	)FRAG";
	
	// Call our "loadShader" function to copy shaders onto graphics card,
	// compile them, and output any errors if any are detected
	GLuint vertShader = loadShader(GL_VERTEX_SHADER, vertexSource);
	GLuint fragShader = loadShader(GL_FRAGMENT_SHADER, fragmentSource);
	
	assertMsg(vertShader != 0, "Error loading vertex shader");
	assertMsg(fragShader != 0, "Error loading fragment shader");
	
	// Create the program, attach the two shaders, and then link the program
	GLuint program = glCreateProgram();

	assertMsg(program != 0, "Error creating shader program");

	glAttachShader(program, vertShader);
	glAttachShader(program, fragShader);
	glLinkProgram(program);
	
	// If any errors are detected, display the error message and abort
	GLint err;
	glGetProgramiv(program, GL_LINK_STATUS, &err);
	if (err != GL_TRUE) {
		cerr << "Error linking program:" << endl;
		const int BUFFER_SIZE = 8192;
		char buffer[BUFFER_SIZE];
		int messageLength;
		glGetProgramInfoLog(program, BUFFER_SIZE, &messageLength, buffer);
		cerr << buffer << endl;
		abort();
	}
	
	assertGLOk();
	
	return program;
}

// Loads hard-coded geometry onto the graphics card and returns a 'geometry'
// struct that contains the names of the associated VAO and VBOs
geometry createBuffers() {
	assertGLOk();
	
	geometry geom;
	glGenVertexArrays(1, &geom.vertexArray);
	assertMsg(geom.vertexArray != 0, "Error creating vertex array");
	
	glGenBuffers(1, &geom.indexBuffer);
	assertMsg(geom.indexBuffer != 0, "Error creating index buffer");
	
	glGenBuffers(1, &geom.positionBuffer);
	assertMsg(geom.positionBuffer != 0, "Error creating position buffer");
	
	glGenBuffers(1, &geom.colorBuffer);
	assertMsg(geom.colorBuffer != 0, "Error creating color buffer");
	
	glGenBuffers(1, &geom.normalBuffer);
	assertMsg(geom.normalBuffer != 0, "Error creating normal buffer");
	
	return geom;
	
	
	return geom;
}

void loadGeometry(geometry& geom,
				  GLuint program,
				  vector<glm::vec4> positions,
				  vector<glm::vec4> colors,
				  vector<glm::vec4> normals,
				  vector<int> indices) {
	assertGLOk();
	
	
	// Bind the vertex array so that set attributes and buffer bindings are
	// applied to this VAO
	glBindVertexArray(geom.vertexArray);
	
	GLint attributeLocation;
	
	// Set the indices to be used for rendering
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, geom.indexBuffer);
	glBufferData(GL_ELEMENT_ARRAY_BUFFER, vectorByteSize(indices), &indices[0], GL_STATIC_DRAW);
	
	// Set the data to be used for vertex positions, look up the location of
	// the "vertPos" attribute in our shader, and set the attribute to our
	// data.
	glBindBuffer(GL_ARRAY_BUFFER, geom.positionBuffer);
	glBufferData(GL_ARRAY_BUFFER, vectorByteSize(positions), &positions[0], GL_STATIC_DRAW);
	
	attributeLocation = glGetAttribLocation(program, "vertPos");
	assertMsg(attributeLocation != -1, "Error finding attribute location");
	
	glVertexAttribPointer(attributeLocation, 4, GL_FLOAT, GL_FALSE, 0, nullptr);
	glEnableVertexAttribArray(attributeLocation);
	
	glBindBuffer(GL_ARRAY_BUFFER, geom.colorBuffer);
	glBufferData(GL_ARRAY_BUFFER, vectorByteSize(colors), &colors[0], GL_STATIC_DRAW);
	
	attributeLocation = glGetAttribLocation(program, "vertColor");

	if (attributeLocation != -1) {
		glVertexAttribPointer(attributeLocation, 4, GL_FLOAT, GL_FALSE, 0, nullptr);
		glEnableVertexAttribArray(attributeLocation);
	}
	glBindBuffer(GL_ARRAY_BUFFER, geom.normalBuffer);
	glBufferData(GL_ARRAY_BUFFER, vectorByteSize(normals), &normals[0], GL_STATIC_DRAW);
	
	attributeLocation = glGetAttribLocation(program, "vertNormal");
	assertMsg(attributeLocation != -1, "Error finding attribute location");
	
	glVertexAttribPointer(attributeLocation, 4, GL_FLOAT, GL_FALSE, 0, nullptr);
	glEnableVertexAttribArray(attributeLocation);
	
	geom.numElements = indices.size();
	
	assertGLOk();
	
	assertGLOk();
}

void updateGeometry(geometry &geom, GLuint program) {
	assertGLOk();
	
	// If we don't need to update geometry on graphics card, return.
	if (!needUpdate) return;
	
	vector<glm::vec4> positions;
	vector<glm::vec4> colors;
	vector<glm::vec4> normals;
	vector<int> indices;
	
	if (currentObject == 1) {
		
		positions = {
			{0.5, 0.5, 0.5, 1.0},
			{-0.5, -0.5, 0.5, 1.0},
			{-0.5, 0.5, -0.5, 1.0},
			

			{0.5, 0.5, 0.5, 1.0},
			{-0.5, -0.5, 0.5, 1.0},
			{0.5, -0.5, -0.5, 1.0},
			

			{0.5, 0.5, 0.5, 1.0},
			{-0.5, 0.5, -0.5, 1.0},
			{0.5, -0.5, -0.5, 1.0},
			
			{-0.5, -0.5, 0.5, 1.0},
			{-0.5, 0.5, -0.5, 1.0},
			{0.5, -0.5, -0.5, 1.0},
		};
		
		colors = {
			{1.0, 0.0, 0.0, 1.0},
			{1.0, 0.0, 0.0, 1.0},
			{1.0, 0.0, 0.0, 1.0},
			
			{0.0, 1.0, 0.0, 1.0},
			{0.0, 1.0, 0.0, 1.0},
			{0.0, 1.0, 0.0, 1.0},
			
			{0.0, 0.0, 1.0, 1.0},
			{0.0, 0.0, 1.0, 1.0},
			{0.0, 0.0, 1.0, 1.0},
			
			{1.0, 0.0, 1.0, 1.0},
			{1.0, 0.0, 1.0, 1.0},
			{1.0, 0.0, 1.0, 1.0},
		};
		
		indices = {
			0, 1,  2,
			3, 4,  5,
			6, 7,  8,
			9, 10, 11
		};
		
		float nc = 0.5773502691896258; // 1/sqrt(3)
		
		normals = {
			{-nc, nc, nc, 0},
			{-nc, nc, nc, 0},
			{-nc, nc, nc, 0},
			
			{nc, -nc, nc, 0},
			{nc, -nc, nc, 0},
			{nc, -nc, nc, 0},
			
			{nc, nc, -nc, 0},
			{nc, nc, -nc, 0},
			{nc, nc, -nc, 0},
			
			{-nc, -nc, -nc, 0},
			{-nc, -nc, -nc, 0},
			{-nc, -nc, -nc, 0},
		};
	} else if (currentObject == 2) {
		positions = circlePositions();
		normals = circleNormals();
		colors = circleColors();
		indices = circleIndices();
		
	} else if (currentObject == 3) {
		positions = torusPositions();
		normals = torusNormals();
		colors = torusColors();
		indices = torusIndices();
	} else if (currentObject == 4) {
		
		
		
	} else if (currentObject == 5) {
		
	} else if (currentObject == 6) {
		
	}
	
	needUpdate = false;
	
	// Check to make sure all attribute vectors are the same size
	assertMsg(positions.size() == colors.size(), "Positions and colors different size");
	assertMsg(positions.size() == normals.size(), "Positions and normals different size");
	
	loadGeometry(geom, program, positions, colors, normals, indices);
}

// Render geometry to screen with a given shader program
void drawGeometry(geometry geom, GLuint program, int frame) {
	assertGLOk();
	
	// Use our shader to draw to the screen
	glUseProgram(program);
	
	// Bind the vertex array to use the indices and attributes we have set
	glBindVertexArray(geom.vertexArray);
	
	glm::mat4 rot(1.0);
	
	glm::vec3 eyePos{cos(around)*cos(up)*cameraDistance,
		sin(up)*cameraDistance,
		sin(around)*cos(up)*cameraDistance};
	
	rot = glm::lookAt(eyePos, glm::vec3{0.0, 0.0, 0.0}, glm::vec3{0.0, 1.0, 0.0});//  * rot;
	
	rot = glm::perspective<float>(3.141 * 0.30, 4.0/3.0, 0.01, 20.0) * rot;
	
	GLint rotLocation;
	rotLocation = glGetUniformLocation(program, "rot");
	assertMsg(rotLocation != -1, "rotLocation not found");
	glUniformMatrix4fv(rotLocation, 1, GL_FALSE, glm::value_ptr(rot));
	
	GLint eyeLocation = glGetUniformLocation(program, "eyePos");
	
	glUniform4f(eyeLocation, eyePos.x, eyePos.y, eyePos.z, 1.0);
	
	GLint lightDirectionLocation = glGetUniformLocation(program, "lightDirection");
	
	float angle = glfwGetTime();
	glm::vec4 lightDirection{cos(angle), 1.0, sin(angle), 0};
	lightDirection = glm::normalize(lightDirection);
	glUniform4f(lightDirectionLocation, lightDirection.x, lightDirection.y, lightDirection.z, lightDirection.w);
	
	GLint lightColorLocation = glGetUniformLocation(program, "lightColor");
	glUniform4f(lightColorLocation, 0.8, 0.7, 0.6, 1.0);
	
	GLint ambientColorLocation = glGetUniformLocation(program, "ambientColor");
	glUniform4f(ambientColorLocation, 0.1, 0.2, 0.3, 1.0);
	
	assertGLOk();
	
	// Tell OpenGL to send geometry through the pipeline
	glDrawElements(GL_TRIANGLES, geom.numElements, GL_UNSIGNED_INT, nullptr);
	
	assertGLOk();
}

void keyboardCallback(GLFWwindow* window, int key, int scancode, int action, int mods) {
	if (action == GLFW_PRESS) {
		if (key == GLFW_KEY_1) {
			currentObject = 1;
			needUpdate = true;
		} else if (key == GLFW_KEY_2) {
			currentObject = 2;
			needUpdate = true;
		} else if (key == GLFW_KEY_3) {
			currentObject = 3;
			needUpdate = true;
		} else if (key == GLFW_KEY_4) {
			currentObject = 4;
			needUpdate = true;
		} else if (key == GLFW_KEY_5) {
			currentObject = 5;
			needUpdate = true;
		} else if (key == GLFW_KEY_6) {
			currentObject = 6;
			needUpdate = true;
		}
	}
}

void mouseCallback(GLFWwindow *window, double x, double y) {
	if (glfwGetMouseButton(window, GLFW_MOUSE_BUTTON_1) == GLFW_PRESS) {
		double deltaX = x - oldMouseX;
		double deltaY = y - oldMouseY;
		
		around += deltaX * 0.01;
		up += deltaY * 0.01;
		
		if (up > 3.13/2) {
			up = 3.13/2;
		}
		if (up < -3.13/2) {
			up = -3.13/2;
		}
	}
	oldMouseX = x;
	oldMouseY = y;
}











