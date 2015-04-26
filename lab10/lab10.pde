ArrayList<Sphere> spheres;
boolean doAnimation = true;


void setup() {
  size(640,480);
  
  // Create spheres and initialize with random positions and sizes
  spheres = new ArrayList<Sphere>();
  for (int i=0; i<30; i++) {
    Sphere sphere = new Sphere(random(width), random(height), random(10) + 5);
    spheres.add(sphere);
  }
}

void draw() {
  background(80);
  
  // If animating, loop over all spheres and have them animate
  if (doAnimation) {
    for (int i=0; i<spheres.size(); i++) {
      spheres.get(i).tick();
    }
  }
  
  // Create a new BVHNode based on the current set of Spheres
  BVHNode node = new BVHNode(spheres, 0);
  
  // Loop over the spheres to draw them to screen
  // When you have fully implemented this lab, you should
  // be able to remove this line without changing the resulting
  // image, since the BVHNode also renders the Spheres inside
  // of it
  for (int i=0; i<spheres.size(); i++) {
    spheres.get(i).draw();
  }
  
  // Finally, draw the BVHNode.  The parameter indicates the
  // "depth" of the node, and is used to provide different
  // shading to the different levels of the tree
  node.draw(0);
}

void keyPressed() {
  if (key == ' ') {
    doAnimation = !doAnimation;
  }
}
