#define GLFW_INCLUDE_GLCOREARB
#define GL_GLEXT_PROTOTYPES
#include <GLFW/glfw3.h>

#include <cmath>
#include <iostream>
#include <vector>

#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtx/transform.hpp>
#include <glm/gtc/type_ptr.hpp>

using namespace std;

// Structure to hold the various OpenGL names for the buffers and array that
// hold our 3D geometry
struct geometry {
	GLuint vertexArray;
	GLuint indexBuffer;
	GLuint positionBuffer;
	GLuint colorBuffer;
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
				  vector<int> indices);

void updateGeometry(geometry &geom, GLuint program);

void drawGeometry(geometry geom, GLuint program, int frame);

void keyboardCallback(GLFWwindow* window, int key, int scancode, int action, int mods);


// Generic function that calculates the size in bytes of a C++ vector
template <typename T>
size_t vectorByteSize(vector<T> v) {
	return v.size() * sizeof(T);
}

// This line creates the "assertGLOk()" macro which will check to see if
// there is an OpenGL error set.  If so, it outputs the file and line where
// this error was encountered, the OpenGL error number, and aborts the program
#define assertGLOk() do{GLenum err = glGetError(); if (err != GL_NO_ERROR){cerr<<"OpenGL Error: "<<__FILE__<<":"<<__LINE__<<" "<<err<<endl;abort();}}while(0)

// This line creates an assert macro that allows you to assert a condition and
// provide a human-readable message if the condition is not met
#define assertMsg(cond,msg) do{if (!(cond)){cerr<<__FILE__<<":"<<__LINE__<<" "<<msg<<endl;abort();}}while(0)

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
	
	glfwSetKeyCallback(window, keyboardCallback);
	
	// Activate the OpenGL context associated with the window we created
	glfwMakeContextCurrent(window);
	
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
		glClearColor(0.2, 0.35, 0.4, 0.0);
		
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
	
	uniform mat4 rot;
	
	out vec4 interpColor;

	void main() {
		gl_Position = rot * vertPos;
		interpColor = vertColor;
	}
	)VERT";
	
	std::string fragmentSource = R"FRAG(
#version 150
	out vec4 color;
	
	in vec4 interpColor;
	
	void main() {
		color = interpColor;
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
	
	return geom;
	
	
	return geom;
}

void loadGeometry(geometry& geom,
				  GLuint program,
				  vector<glm::vec4> positions,
				  vector<glm::vec4> colors,
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
	vector<int> indices;
	
	if (currentObject == 1) {
		
		positions = {
			{-0.9, -0.9, 0, 1},
			{0.8, -0.6, 0, 1},
			{0.1, 0.8, 0, 1},
		};
		
		colors = {
			{1.0, 0.0, 0.0, 1.0},
			{0.0, 1.0, 0.0, 1.0},
			{0.0, 0.0, 1.0, 1.0},
		};
		
		indices = {
			0, 1, 2,
		};
	} else if (currentObject == 2) {
		positions = {
			{0, 0.9, 0, 1},
		};
		
		colors = {
			{0.5, 0.5, 0.5, 1.0},
		};
		for (int x = 0; x <= 19; x++) {
			positions.push_back({(x - 9) / 10.0, -0.8, 0, 1});
			if (x % 2 == 0) {
				colors.push_back({0,0,0,1});
			} else {
				colors.push_back({1,1,1,1});
			}
			
			if (x > 0) {
				// Can only add triangle after two vertices on the line
				// have been added
				indices.push_back(0);
				indices.push_back(x-1);
				indices.push_back(x);
			}
		}
	} else if (currentObject == 3) {

		/* Defines the vertices of the triangle making up the diamond  */
		positions = {
			{-.5, 0.0, 0.0, 1.0},
			{0.0, .5, 0.0, 1.0},
			{0.0, 0.0, 0.0, 1.0},
			{.5, 0.0, 0.0, 1.0},
			{0, .5, 0.0, 1.0},
			{0.0, 0.0, 0.0, 1.0},
			{.5, 0.0, 0.0, 1.0},
			{0.0, -.5, 0.0, 1.0},
			{0.0, 0.0, 0.0, 1.0},
			{-.5, 0.0, 0.0, 1.0},
			{0.0, -.5, 0.0, 1.0},
			{0.0, 0.0, 0.0, 1.0},
		};

		/* Our colors which match the given image */
		colors = {
			{0.0, 0.0, 0.0, 1.0},
			{0.0, 0.0, 0.0, 1.0},
			{1.0, 1.0, 1.0, 1.0},
			{0.0, 0.0, 0.0, 1.0},
			{0.0, 0.0, 0.0, 1.0},
			{1.0, 1.0, 1.0, 1.0},
			{0.0, 0.0, 0.0, 1.0},
			{0.0, 0.0, 0.0, 1.0},
			{1.0, 1.0, 1.0, 1.0},
			{0.0, 0.0, 0.0, 1.0},
			{0.0, 0.0, 0.0, 1.0},
			{1.0, 1.0, 1.0, 1.0},
		};

		indices = {
			0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,11
		};
	} else if (currentObject == 4) {
			/* Defines the vertices of the triangle making up the diamond  */
			positions = {
				{-.5, 0.0, 0.0, 1.0},
				{0.0, .5, 0.0, 1.0},
				{0.0, 0.0, 0.0, 1.0},
				{.5, 0.0, 0.0, 1.0},
				{0.0, .5, 0.0, 1.0},
				{0.0, 0.0, 0.0, 1.0},
				{.5, 0.0, 0.0, 1.0},
				{0.0, -.5, 0.0, 1.0},
				{0.0, 0.0, 0.0, 1.0},
				{-.5, 0.0, 0.0, 1.0},
				{0.0, -.5, 0.0, 1.0},
				{0.0, 0.0, 0.0, 1.0},
			};	

		/* Our colors which match the given image */
		colors = {
			{0.5, 0.5, 0.5, 1.0},
			{0.5, 0.5, 0.5, 1.0},
			{0.0, 0.0, 0.0, 1.0},
			{0.5, 0.5, 0.5, 1.0},
			{0.5, 0.5, 0.5, 1.0},
			{1.0, 1.0, 1.0, 1.0},
			{0.5, 0.5, 0.5, 1.0},
			{0.5, 0.5, 0.5, 1.0},
			{1.0, 1.0, 1.0, 1.0},
			{0.5, 0.5, 0.5, 1.0},
			{0.5, 0.5, 0.5, 1.0},
			{0.0, 0.0, 0.0, 1.0},
		};

		indices = {
			0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,11
		};
	} else if (currentObject == 5) {
		/* Specifies the number of triangles to use when triangulating the circle */
		int numTri = 20;

		/* If we are to use numTri triangles, we need to increment 1/numTri around the circle with each triangle */
		double angleIncr = (2 * M_PI)/numTri;
		for (float i = 0.0; i < numTri; i++)
		{
			/* Angle of the lower and upper vertex respectively */
			double lowerAngle = i*angleIncr;
			double upperAngle = (i + 1.0)*angleIncr;

			/* Get the x and y positions of the above angles */
			GLfloat p1X = cos(lowerAngle);
			GLfloat p1Y = sin(lowerAngle);
			GLfloat p2X = cos(upperAngle);
			GLfloat p2Y = sin(upperAngle);

			/* Pushes the vertices and their colors to their respective object */
			positions.push_back({p1X, p1Y, 0.0, 1.0});
			positions.push_back({p2X, p2Y, 0.0, 1.0});
			positions.push_back({0.0, 0.0, 0.0, 1.0});
			colors.push_back({0.0, 0.0, 0.0, 1.0});
			colors.push_back({0.0, 0.0, 0.0, 1.0});
			colors.push_back({1.0, 1.0, 1.0, 1.0});
		}
		
		/* We have a total of 3*numTri indices to list: */
		for(int j = 0; j < 3*numTri; j++)
		{
			indices.push_back(j);
		}
	} else if (currentObject == 6) {
		/* Similar idea to 5 but I made the circle smoother and added a cool coloring method*/
		int numTri = 1000;
		double angleIncr = (2 * M_PI)/numTri;
		for (float i = 0.0; i < numTri; i++)
		{
			double lowerAngle = i*angleIncr;
			double upperAngle = (i + 1.0)*angleIncr;
			GLfloat p1X = cos(lowerAngle);
			GLfloat p1Y = sin(lowerAngle);
			GLfloat p2X = cos(upperAngle);
			GLfloat p2Y = sin(upperAngle);
			positions.push_back({p1X, p1Y, 0.0, 1.0});
			positions.push_back({p2X, p2Y, 0.0, 1.0});
			positions.push_back({0.0, 0.0, 0.0, 1.0});

			/* Keeps the origin white but makes the y axis bluish and the x axis redish*/
			colors.push_back({abs(p1X), 0.0, abs(p1Y), 1.0});
			colors.push_back({abs(p2X), 0.0, abs(p2Y), 1.0});
			colors.push_back({1.0, 1.0, 1.0, 1.0});
		}
		for(int j = 0; j < 3*numTri; j++)
		{
			indices.push_back(j);
		}
	}
	
	needUpdate = false;
	
	loadGeometry(geom, program, positions, colors, indices);
}

// Render geometry to screen with a given shader program
void drawGeometry(geometry geom, GLuint program, int frame) {
	assertGLOk();
	
	// Bind the vertex array to use the indices and attributes we have set
	glBindVertexArray(geom.vertexArray);
	
	// Use our shader to draw to the screen
	glUseProgram(program);
	
	glm::mat4 rot(1.0);
	
	//rot = glm::rotate(float(frame*0.1), glm::vec3(1.0, 1.0, 1.0));
	//rot = glm::translate(glm::vec3(cos(frame * 0.1), 0.0, 0.0));
	
	GLint rotLocation;
	rotLocation = glGetUniformLocation(program, "rot");
	glUniformMatrix4fv(rotLocation, 1, GL_FALSE, glm::value_ptr(rot));
	
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












