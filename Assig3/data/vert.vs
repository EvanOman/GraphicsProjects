// Vertex shader

// Position of the light in 3D space
uniform vec4 light1Position;
uniform vec4 light2Position;

// Normal value to be interpolated across the surface.
varying vec3 interpNormal;

varying vec4 interpL;

void main(void)
{
	// Compute the normal for this vertex by multiplying the set normal
	// (gl_Normal) by the transpose of the upper-left 3x3 of the
	// modelview matrix (gl_NormalMatrix).
	interpNormal = gl_NormalMatrix * gl_Normal;

  interpL = gl_ModelViewMatrix * light1Position - gl_ModelViewMatrix * gl_Vertex;

	// Convert the assigned 3D vertex position (gl_Vertex) into the
	// screen coordinates by multiplying by the gl_ModelViewMatrix and
	// the gl_ProjectionMatrix.
	gl_Position = gl_ProjectionMatrix * gl_ModelViewMatrix * gl_Vertex;
}

