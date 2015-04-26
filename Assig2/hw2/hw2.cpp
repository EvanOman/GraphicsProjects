#include "glinclude.h"
#include "util.h"

#include <cmath>
#include <iostream>
#include <vector>

#include "MeshBuilder.h"

using namespace std;

// Function prototypes for the functions declared in this file
void printOpenGLInfo();
GLuint loadShaders();
GLuint loadShader(GLenum type, const std::string &source);

void updateGeometry();

void drawGeometry(GLuint program);

void keyboardCallback(GLFWwindow* window, int key, int scancode, int action, int mods);

void mouseCallback(GLFWwindow *window, double x, double y);

int currentObject = 1;
bool needUpdate = true;

double around;
double up;

double oldMouseX;
double oldMouseY;

MeshBuilder mb;

const int MAX_U = 20;
const int MAX_V = 20;

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
	
	glfwSetKeyCallback(window, keyboardCallback);
	glfwSetCursorPosCallback(window, mouseCallback);
	
	// Activate the OpenGL context associated with the window we created
	glfwMakeContextCurrent(window);
	
	glEnable(GL_DEPTH_TEST);
	
	// Print out OpenGL vendor and version
	printOpenGLInfo();
	
	// Load, compile and link shaders
	GLuint program = loadShaders();
	
	// This is what's called the "run loop" or "rendering loop"
	// We keep looping until the user wants to quit.
	while (!glfwWindowShouldClose(window)) {
		assertGLOk();
		
		// If needed, update the geometry on the GPU
		updateGeometry();
		
		// Set the color to clear the widow with
		glClearColor(0.35, 0.35, 0.35, 0.0);
		
		// Clear both the color and the depth buffers
		glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
		
		// Draw the geometry to the screen using the shader program
		drawGeometry(program);
		
		// Swap the front and back buffers
		glfwSwapBuffers(window);
		
		// Check for any user events, such as pressing a key or clicking
		// the "close" button
		glfwPollEvents();
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
	
	uniform vec4 lightDirection;
	
	void main() {
		vec3 normal = normalize(interpNormal.xyz);
		vec3 light = normalize(lightDirection.xyz);
		
		float diffuseAmount = max(0.0, dot(normal, light));
		
		color = interpColor * (diffuseAmount*0.75 + 0.25);
		color.a = 1.0;
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

glm::vec4 cylinderPosition(float u, float v) {
	float uf = u * 1.0 / MAX_U;
	float vf = v * 1.0 / MAX_V;
	
	return {cos(3.1415926 * 2.0 * uf) * 0.7,
		(vf - 0.5) * 1.3,
		sin(3.1415926 * 2.0 * uf) * 0.7,
		1.0};
}

glm::vec4 cylinderNormal(float u, float v) {
	float uf = u * 1.0 / MAX_U;
	
	return {cos(3.1415926 * 2.0 * uf),
		0.0,
		sin(3.1415926 * 2.0 * uf),
		0.0};
}

/*
	Function which outputs the uth and vth coordinate of a sphere using 
	sphere parameterization
*/
glm::vec4 spherePosition(float u, float v) {
	float uf = u * 1.0 / MAX_U;
	float vf = v * 1.0 / MAX_V;

	/* From wikipedia */
	return {sin(3.1415926 * uf) * cos(3.1415926 * 2.0 * vf)* 0.7,
		sin(3.1415926 * uf) * sin(3.1415926 * 2.0 * vf) * 0.7,
		cos(3.1415926 * uf) * 0.7,
		1.0};
}

/*
	Function which outputs the uth, vth normal vector of a sphere using 
	sphere parameterization and mathematica to find the normal vector
*/
glm::vec4 sphereNormal(float u, float v) {
	float uf = u * 1.0 / MAX_U;
	float vf = v * 1.0 / MAX_V;

	/* Computed in mathematica */
	glm::vec3 pos = {sin(3.1415926 * uf) * cos(3.1415926 * 2.0 * vf)* 0.7,
		sin(3.1415926 * uf) * sin(3.1415926 * 2.0 * vf) * 0.7,
		cos(3.1415926 * uf) * 0.7};

	return glm::vec4(glm::normalize(pos), 1.0);
}

/*
	Function which outputs the uth and vth coordinate of a torus using 
	torus parameterization
*/
glm::vec4 torusPosition(float u, float v) {
	float uf = u * 1.0 / MAX_U;
	float vf = v * 1.0 / MAX_V;

	float r = .3;
	float R = .7;

	/* From wikipedia */
	return {(R + r * cos(3.1415926 * 2.0 * vf))*cos(3.1415926 * 2.0 * uf),
		r * sin( 3.1415926 * 2.0 * vf),
		(R + r * cos(3.1415926 * 2.0 * vf))*sin( 3.1415926 * 2.0 * uf),
		1.0};
}

/*
	Function which outputs the uth, vth normal vector of a torus using 
	torus parameterization and mathematica to find the normal vector
*/
glm::vec4 torusNormal(float u, float v) {
	float uf = 3.1415926 * 2.0 * u * 1.0 / MAX_U;
	float vf = 3.1415926 * 2.0 * v * 1.0 / MAX_V;

	/* Computed in mathematica */
	glm::vec3 dxu = {
		-sin(uf),
		0,
		cos(uf)
	};

	glm::vec3 dxv = {
		cos(uf)*(-sin(vf)),
		cos(vf),
		sin(uf)*(-sin(vf))
	};

	return glm::normalize(glm::vec4(glm::cross(dxv, dxu), 0.0));
}

/*
	Function which outputs the uth and vth coordinate of a cone using 
	cone parameterization
*/
glm::vec4 conePosition(float u, float v) {
	float uf = u * 1.0 / MAX_U;
	float vf = v * 1.0 / MAX_V;
	float h = 1.2;

	/* From wikipedia */
	return {cos(3.1415926 * 2.0 * uf) * (h - h*vf)/h,
		(h*vf - 0.5) *h,
		sin(3.1415926 * 2.0 * uf) * (h - h*vf)/h,
		1.0};
}

/*
	Function which outputs the uth, vth normal vector of a cone using 
	cone parameterization and mathematica to find the normal vector
*/
glm::vec4 coneNormal(float u, float v) {
	float uf = u * 1.0 / MAX_U;
	float vf = v * 1.0 / MAX_V;
	float h = 1.2;

	/* Computed in mathematica */
	glm::vec3 out = {
		sin(3.1415926 * 2.0 * uf)*(h*vf),
		1.0,
		cos(3.1415926 * 2.0 * uf)*(h*vf),
	};
	
	return glm::vec4(glm::normalize(out), 1.0);
}


void updateGeometry() {
	assertGLOk();
	
	// If we don't need to update geometry on graphics card, return.
	if (!needUpdate) return;
	
	mb.clear();
	
	
	vector<glm::vec4> positions;
	vector<glm::vec4> colors;
	vector<int> indices;
	
	if (currentObject == 1) {
		// Draw tetrahedron
		mb.beginDraw(MeshBuilder::DrawMode::TRIANGLES);
		
		float nc = 0.5773502691896258; // 1/sqrt(3)
		
		mb.setColor({0.9, 0.4, 0.1, 1.0});
		mb.setNormal({-nc, nc, nc});
		mb.sendVertex({0.5, 0.5, 0.5, 1.0});
		mb.sendVertex({-0.5, -0.5, 0.5, 1.0});
		mb.sendVertex({-0.5, 0.5, -0.5, 1.0});
		
		mb.setColor({0.1, 0.4, 0.2, 1.0});
		mb.setNormal({nc, -nc, nc});
		mb.sendVertex({0.5, 0.5, 0.5, 1.0});
		mb.sendVertex({-0.5, -0.5, 0.5, 1.0});
		mb.sendVertex({0.5, -0.5, -0.5, 1.0});
		
		mb.setColor({0.1, 0.6, 1.0, 1.0});
		mb.setNormal({nc, nc, -nc});
		mb.sendVertex({0.5, 0.5, 0.5, 1.0});
		mb.sendVertex({-0.5, 0.5, -0.5, 1.0});
		mb.sendVertex({0.5, -0.5, -0.5, 1.0});

		mb.setColor({0.3, 0.0, 0.9, 1.0});
		mb.setNormal({-nc, -nc, -nc});
		mb.sendVertex({-0.5, -0.5, 0.5, 1.0});
		mb.sendVertex({-0.5, 0.5, -0.5, 1.0});
		mb.sendVertex({0.5, -0.5, -0.5, 1.0});

		
		mb.endDraw();
	} else if (currentObject == 2) {
		// Draw cube
		mb.beginDraw(MeshBuilder::DrawMode::QUADS);
		
		mb.setColor({0.9, 0.5, 0.2, 1.0});
		mb.setNormal({0, 0, -1});
		mb.sendVertex({-0.5, 0.5, -0.5, 1.0});
		mb.sendVertex({0.5, 0.5, -0.5, 1.0});
		mb.sendVertex({0.5, -0.5, -0.5, 1.0});
		mb.sendVertex({-0.5, -0.5, -0.5, 1.0});
		
		mb.setColor({0.2, 0.5, 0.5, 1.0});
		mb.setNormal({0, -1, 0});
		mb.sendVertex({-0.5, -0.5, 0.5, 1.0});
		mb.sendVertex({0.5, -0.5, 0.5, 1.0});
		mb.sendVertex({0.5, -0.5, -0.5, 1.0});
		mb.sendVertex({-0.5, -0.5, -0.5, 1.0});
		
		mb.setColor({0.9, 0.9, 0.2, 1.0});
		mb.setNormal({-1, 0, 0});
		mb.sendVertex({-0.5, -0.5, 0.5, 1.0});
		mb.sendVertex({-0.5, 0.5, 0.5, 1.0});
		mb.sendVertex({-0.5, 0.5, -0.5, 1.0});
		mb.sendVertex({-0.5, -0.5, -0.5, 1.0});
		
		mb.setColor({0.1, 0.2, 0.9, 1.0});
		mb.setNormal({1, 0, 0});
		mb.sendVertex({0.5, -0.5, 0.5, 1.0});
		mb.sendVertex({0.5, 0.5, 0.5, 1.0});
		mb.sendVertex({0.5, 0.5, -0.5, 1.0});
		mb.sendVertex({0.5, -0.5, -0.5, 1.0});
		
		mb.setColor({0.9, 0.5, 0.9, 1.0});
		mb.setNormal({0, 0, 1});
		mb.sendVertex({0.5, -0.5, 0.5, 1.0});
		mb.sendVertex({0.5, 0.5, 0.5, 1.0});
		mb.sendVertex({-0.5, 0.5, 0.5, 1.0});
		mb.sendVertex({-0.5, -0.5, 0.5, 1.0});
		
		mb.setColor({0.9, 0.1, 0.9, 1.0});
		mb.setNormal({0, 1, 0});
		mb.sendVertex({-0.5, 0.5, -0.5, 1.0});
		mb.sendVertex({0.5, 0.5, -0.5, 1.0});
		mb.sendVertex({0.5, 0.5, 0.5, 1.0});
		mb.sendVertex({-0.5, 0.5, 0.5, 1.0});
		
		mb.endDraw();
		
	} else if (currentObject == 3) {
		// Draw cylinder
		
		mb.setColor({1.0, 1.0, 1.0, 1.0});
	   
		for (int v=0; v<MAX_V; v++) {
			mb.beginDraw(MeshBuilder::DrawMode::TRIANGLE_LOOP);
			
			for (int u=0; u<MAX_U; u++) {
				mb.setNormal(cylinderNormal(u, v));
				mb.sendVertex(cylinderPosition(u, v));
				
				mb.setNormal(cylinderNormal(u, v+1));
				mb.sendVertex(cylinderPosition(u, v+1));
			}
			
			mb.endDraw();
		}
		
	} else if (currentObject == 4) {
		// Draw sphere
		mb.setColor({1.0, 1.0, 1.0, 1.0});

		/*
			Iterates over the u and v ranges and adds triangles according to the sphere functions
			defined above
		*/
		for (int v=0; v<MAX_V; v++) {
			mb.beginDraw(MeshBuilder::DrawMode::TRIANGLE_LOOP);
			
			for (int u=0; u<MAX_U; u++)
			{
				 mb.setNormal(sphereNormal(v, u));
				 mb.sendVertex(spherePosition(v, u));
				
				mb.setNormal(sphereNormal(v + 1, u));
				mb.sendVertex(spherePosition(v + 1, u));
			}
			mb.endDraw();
		}
	}
	else if (currentObject == 5) {
		// Draw torus
		mb.setColor({1.0, 1.0, 1.0, 1.0});

		/*
			Iterates over the u and v ranges and adds triangles according to the torus functions
			defined above
		*/
		for (int u=0; u<MAX_U; u++) {
			mb.beginDraw(MeshBuilder::DrawMode::TRIANGLE_LOOP);
			
			for (int v=0; v<MAX_V; v++)
			{
				mb.setNormal(torusNormal(u, v));
				mb.sendVertex(torusPosition(u, v));
				
				mb.setNormal(torusNormal(u+1, v));
				mb.sendVertex(torusPosition(u+1, v));
			}
			mb.endDraw();
		}
		
	} else if (currentObject == 6) {
		// Draw cone
		mb.setColor({1.0, 1.0, 1.0, 1.0});

		/*
			Iterates over the u and v ranges and adds triangles according to the cone functions
			defined above
		*/
		for (int v=0; v<MAX_V; v++) {
			mb.beginDraw(MeshBuilder::DrawMode::TRIANGLE_LOOP);
			
			for (int u=0; u<MAX_U; u++) {
				mb.setNormal(coneNormal(u, v));
				mb.sendVertex(conePosition(u, v));
				
				mb.setNormal(coneNormal(u, v+1));
				mb.sendVertex(conePosition(u, v+1));
			}
			
			mb.endDraw();
		}
	}
	needUpdate = false;
}

// Render geometry to screen with a given shader program
void drawGeometry(GLuint program) {
	assertGLOk();
	
	// Use our shader to draw to the screen
	glUseProgram(program);
	
	glm::mat4 rot(1.0);
	
	//rot = glm::rotate(float(glfwGetTime()), glm::vec3(0.0, 1.0, 0.1));
	
	float cameraDistance = 2.5;
	
	glm::vec3 eyePos{cos(around)*cos(up)*cameraDistance,
		sin(up)*cameraDistance,
		sin(around)*cos(up)*cameraDistance};
	
	rot = glm::lookAt(eyePos, glm::vec3{0.0, 0.0, 0.0}, glm::vec3{0.0, 1.0, 0.0})  * rot;
	
	rot = glm::perspective<float>(3.141 * 0.30, 4.0/3.0, 0.01, 20.0) * rot;
	
	GLint rotLocation;
	rotLocation = glGetUniformLocation(program, "rot");
	assertMsg(rotLocation != -1, "Unable to find 'rot' location");
	glUniformMatrix4fv(rotLocation, 1, GL_FALSE, glm::value_ptr(rot));
	
	GLint lightDirectionLocation = glGetUniformLocation(program, "lightDirection");
	assertMsg(lightDirectionLocation != -1, "Unable to find lightDirection");
	
	float angle = glfwGetTime();
	glm::vec4 lightDirection{cos(angle), 1.0, sin(angle), 0};
	lightDirection = glm::normalize(lightDirection);
	glUniform4f(lightDirectionLocation, lightDirection.x, lightDirection.y, lightDirection.z, lightDirection.w);
	
	assertGLOk();
	
	mb.getMesh()->render(program);
	
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