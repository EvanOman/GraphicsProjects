// Fragment shader

// Intensity and color for ambient component
const float ambientIntensity = 0.6;
const vec3 ambientColor = vec3(0.3, 0.3, 0.5);

// Intensity and color for diffuse component
const float diffuseIntensity = 0.6;
const vec3 diffuseColor = vec3(1.0, 0.8, 0.3);

// Intensity, color, and exponent for specular component
const float specularIntensity = 1.5;
const vec3 specularColor = vec3(1.0, 1.0, 1.0);
const float specularExponent = 30.0;

// normal vector to be interpolated across surface
varying vec3 interpNormal;
varying vec4 interpL;

// Texture samplers
uniform sampler2D diffuseRamp;
uniform sampler2D specularRamp;

void main() {
	// interpNormal is linearly interpolated across the surface, but it
	// is *NOT* guaranteed to be of unit length, which can cause
	// unappealing lighting artifacts.  This normalizes the vector to be
	// of unit length.
	vec3 normal = normalize(interpNormal);
  
	// You will want to add together the various lighting components
	// into 'accumulated' and then assign the accumulated value to
	// gl_FragColor.
	vec3 accumulated = vec3(0.0, 0.0, 0.0);
  
  float diffuseAmount = 0.0;
  float specularAmount = 0.0;
  
  diffuseAmount = dot(normal, normalize(interpL.xyz));
  diffuseAmount = max(0.0, diffuseAmount);
  
  // Add in each term to the color value
	accumulated += ambientIntensity * ambientColor;
	accumulated += diffuseIntensity * diffuseColor * diffuseAmount;
	accumulated += specularIntensity * specularColor * specularAmount;
  
	// Assign 'accumulated' to the red, green, blue components of
	// gl_FragColor
	gl_FragColor.rgb = accumulated;
  
	// Set the alpha component of the fragment color to 1.0.
	gl_FragColor.a = 1.0;
}
