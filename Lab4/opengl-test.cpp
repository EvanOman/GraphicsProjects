/*
	Evan Oman
	I decided to update the color of the triangle using phase shifts of the
	sine function using a per-frame counter as input
*/

#define GLFW_INCLUDE_GLCOREARB
#define GL_GLEXT_PROTOTYPES
#include <GLFW/glfw3.h>

#include <cmath>
#include <iostream>

using namespace std;

struct geometry {
	GLuint vertexArray;
	GLuint indexBuffer;
	GLuint positionBuffer;
	int numElements;
};


void printOpenGLInfo();
GLuint loadShaders();
GLuint loadShader(GLenum type, const std::string &source);
geometry loadGeometry(GLuint program);
void drawGeometry(geometry geom, GLuint program, GLfloat color[]);
GLfloat mySine(double x);

#define assertGLOk() do{GLenum err = glGetError(); if (err != GL_NO_ERROR){cerr<<"OpenGL Error: "<<__FILE__<<":"<<__LINE__<<" "<<err<<endl;abort();}}while(0)

int main() {
	
	// Initialize the GLFW library
	if (!glfwInit()) {
		cerr << "Error initializing GLFW" << endl;
		return 1;
	}
	
	// Request an OpenGL 3.2 core profile
	
	glfwWindowHint(GLFW_RESIZABLE, GL_FALSE);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 2);
	glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
	glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
	
	
	GLFWwindow *window = glfwCreateWindow(640, 480, "Hello OpenGL", nullptr, nullptr);
	
	if (!window) {
		glfwTerminate();
		cerr << "Error creating GLFW window" << endl;
		return 1;
	}
	
	// Activate the OpenGL context associated with the window we created
	glfwMakeContextCurrent(window);
	
	
	
	printOpenGLInfo();
	
	GLuint program = loadShaders();
	
	geometry geom = loadGeometry(program);

	double counter = 0;
	
	// This is what's called the "run loop" or "rendering loop"
	// We keep looping until the user wants to quit.
	while (!glfwWindowShouldClose(window)) {
		/* Need to increment our counter */
		counter++;
		/* Scales the counter so that the transition isn't too fast(makes the image seizure-proof) */
		double counter2 = counter/100;
		/* Creates our pseudo vec4 color vector. Using a sine wave for the transition since it has an image of [-1,1]*/
		GLfloat color[] = {abs(mySine(counter2)), abs(mySine(counter2 + M_PI/2)), abs(mySine(counter2 + M_PI)), abs(mySine(counter2 + 3*M_PI/2))};

		assertGLOk();
		glClearColor(0.0, 0.5, 0.5, 0.0);
		glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

		/* Draws the geometry and uses the new color array we made */
		drawGeometry(geom, program, color);

		glfwSwapBuffers(window);
		
		glfwPollEvents();
	}
	
	// Window has been created.  Before quitting, we need to clean up
	glfwDestroyWindow(window);
	glfwTerminate();
	return 0;
}

GLfloat mySine(double x)
{
	return (GLfloat)sin(x);
}

void printOpenGLInfo() {
	assertGLOk();
	const GLubyte *str;
	str = glGetString(GL_VENDOR);
	cout << "GL_VENDOR: " << str << endl;
	
	str = glGetString(GL_VERSION);
	cout << "GL_VERSION: " << str << endl;
	
	assertGLOk();
}

GLuint loadShader(GLenum type, const std::string &source) {
	GLuint shader = 0;
	shader = glCreateShader(type);
	if (shader == 0) {
		cerr << "Unable to create shader" << endl;
		abort();
	}
	const char* shader_cstr = source.c_str();
	glShaderSource(shader, 1, &shader_cstr, nullptr);
	
	glCompileShader(shader);

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
	return shader;
}

GLuint loadShaders() {
	assertGLOk();
	
	std::string vertexSource = R"VERT(
#version 150
	in vec4 vertPos;
	void main() {
		gl_Position = vertPos;
	}
	)VERT";
	
	std::string fragmentSource = R"FRAG(
#version 150
	/* Added uniform vec4 as suggested */
	uniform vec4 newColor;
	out vec4 color;
	void main() {
		color = newColor;
	}
	)FRAG";
	
	GLuint vertShader = loadShader(GL_VERTEX_SHADER, vertexSource);
	GLuint fragShader = loadShader(GL_FRAGMENT_SHADER, fragmentSource);
	
	if (vertShader == 0) {
		cerr << "Error loading vertex shader" << endl;
	}
	if (fragShader == 0) {
		cerr << "Error loading fragment shader" << endl;
	}
	
	GLuint program = glCreateProgram();
	if (program == 0) {
		cerr << "Error creating shader program" << endl;
		abort();
	}
	glAttachShader(program, vertShader);
	glAttachShader(program, fragShader);
	glLinkProgram(program);
	
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

geometry loadGeometry(GLuint program) {
	assertGLOk();
	float positions[] = {-0.9, -0.9, 0, 1,
		0.8, -0.6, 0, 1,
		0.1, 0.8, 0, 1};
	int indices[] = {0, 1, 2};
	
	geometry geom;
	glGenVertexArrays(1, &geom.vertexArray);
	glGenBuffers(1, &geom.indexBuffer);
	glGenBuffers(1, &geom.positionBuffer);
	
	glBindVertexArray(geom.vertexArray);
	
	GLuint attributeLocation;
	
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, geom.indexBuffer);
	glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(indices)*sizeof(int), indices, GL_STATIC_DRAW);
	
	glBindBuffer(GL_ARRAY_BUFFER, geom.positionBuffer);
	glBufferData(GL_ARRAY_BUFFER, sizeof(positions)*sizeof(float), positions, GL_STATIC_DRAW);
	attributeLocation = glGetAttribLocation(program, "vertPos");
	glVertexAttribPointer(attributeLocation, 4, GL_FLOAT, GL_FALSE, 0, nullptr);
	glEnableVertexAttribArray(attributeLocation);
	
	geom.numElements = sizeof(indices);
	
	assertGLOk();
	
	return geom;
}

void drawGeometry(geometry geom, GLuint program, GLfloat color[]) {
	assertGLOk();
	
	glBindVertexArray(geom.vertexArray);
	glUseProgram(program);

	assertGLOk();

	/* Need the location of our uniform vec4 color*/
	GLint colorLoc = glGetUniformLocation(program, "newColor");

	/* Sets the uniform value to the color passed in */
	glUniform4f(colorLoc, color[0], color[1], color[2], color[3]);

	
	glDrawElements(GL_TRIANGLES, geom.numElements, GL_UNSIGNED_INT, nullptr);
	
	assertGLOk();
}