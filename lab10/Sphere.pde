class Sphere {
  
  // X and Y position of center
  float x;
  float y;
  
  // Radius
  float r;
  
  // Movement speed in X and Y direction (for animation only)
  float dx;
  float dy;

  public Sphere(float ix, float iy, float ir) {
    x = ix;
    y = iy;
    r = ir;
    dx = random(-.5, .5);
    dy = random(-.5, .5);
  }
  
  // Utility functions to get min and max X and Y coordinates
  public float minX() {
    return x - r;
  }
  public float maxX() {
    return x + r;
  }
  public float minY() {
    return y - r;
  }
  public float maxY() {
    return y + r;
  }
  
  // Move spheres and bounce off walls (but not each other)
  public void tick() {
    x += dx;
    y += dy;
    if (x < r) {
      x = r;
      dx = -dx;
    }
    if (x > width-r) {
      x = width-r;
      dx = -dx;
    }
    if (y < r) {
      y = r;
      dy = -dy;
    }
    if (y > height - r) {
      y = height - r;
      dy = -dy;
    }
  }
  
  public void draw() {
    noStroke();
    fill(255);
    ellipse(x, y, r*2, r*2);
  }
}
