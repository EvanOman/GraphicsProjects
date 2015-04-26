/*
  Evan Oman 
  Lab 10: BVH
*/


class BVHNode {
  // Pointers to left and right child nodes
  BVHNode left;
  BVHNode right;
  
  //Axis indicators for partitioning
  final int VERTICAL = 0;
  final int HORIZONTAL = 1;
  
  // Values for the bounding box
  float minX;
  float minY;
  float maxX;
  float maxY;
  
  // The sphere contained in this node.  If left and right aren't null, then this
  // should be null
  Sphere sphere;
  
  // TODO: If there is more than one child node, properly
  // set up the left and right subtrees
  //Added an axis indicator to allow the alternation between horizontal and vertical
  public BVHNode(ArrayList<Sphere> spheres, int axis) {
    // Can't create a node from zero spheres
    if (spheres.size() == 0) {
      return;
    }
    
    // Calculate the minimal bounding box containing all of
    // the spheres.
    minX = spheres.get(0).minX();
    minY = spheres.get(0).minY();
    maxX = spheres.get(0).maxX();
    maxY = spheres.get(0).maxY();
    
    for (int i=0; i<spheres.size(); i++) {
      minX = min(spheres.get(i).minX(), minX);
      minY = min(spheres.get(i).minY(), minY);
      maxX = max(spheres.get(i).maxX(), maxX);
      maxY = max(spheres.get(i).maxY(), maxY);
    }
    
    // If we only are passed in one sphere, set our 'sphere'
    // member to that and return
    if (spheres.size() == 1) {
      sphere = spheres.get(0);
      return;
    }
    //If we have axactly 2 spheres, there is no need for special paritioning
    else if (spheres.size() == 2)
    {
      //A lot of code to put one sphere in the left and one sphere in the right
      ArrayList<Sphere> lSpheres = new ArrayList<Sphere>();
      ArrayList<Sphere> rSpheres = new ArrayList<Sphere>();
      lSpheres.add(spheres.get(0));
      rSpheres.add(spheres.get(1)); 
      left = new BVHNode(lSpheres, axis);
      right = new BVHNode(rSpheres, axis);
      return;
    }
    //If we have more than two, we need some way of partioning the space
    else
    {
      //Container arraylists for our left and right spherese 
      ArrayList<Sphere> lSpheres = new ArrayList<Sphere>();
      ArrayList<Sphere> rSpheres = new ArrayList<Sphere>(); 
      
      //If the mode is vertical, we partition along the y axis
      if (axis == VERTICAL)
      {
        float mid = (minY + maxY)/2;
        
        //Simple partitioning based on what side of the midpoint this sphere is
        for (Sphere s : spheres)
        {
           if (s.maxY() < mid)
           {
              lSpheres.add(s); 
           }
           else
           {
             rSpheres.add(s);
           }
        }
      }
      //Else default to horizontal and partition along the x axis
      else
      {
        float mid = (minX + maxX)/2;
        
        //Simple partitioning based on what side of the midpoint this sphere is
        for (Sphere s : spheres)
        {
           if (s.maxX() < mid)
           {
              lSpheres.add(s); 
           }
           else
           {
             rSpheres.add(s);
           }
        }
      }
      
      //This handles a weird case where we are always putting the spheres into the same node
      //All this does is even things out if one of the two lists is empty while the other is not
      if (lSpheres.size() > 1 && rSpheres.size() == 0)
      {
        rSpheres.add(lSpheres.remove(lSpheres.size() - 1));
      } 
      else if (rSpheres.size() > 1 && lSpheres.size() == 0)
      {
        lSpheres.add(rSpheres.remove(rSpheres.size() - 1)); 
      }
      
      //Sets our left and right node with the lists generated above(and alternates the axis)
      left = new BVHNode(lSpheres, (axis + 1) % 2);
      right = new BVHNode(rSpheres, (axis + 1) % 2);
      return;
    }
  }
  
  public void draw(int depth) {
    // Calculate a fill and stroke color based on the depth
    // of the node.  This will result in a change from black
    // to dark red to orange to yellow to white
    fill(depth*100, depth*30, depth*10, 64);
    strokeWeight(5);
    stroke(depth * 100, depth * 30, depth * 10);
    rect(minX, minY, maxX-minX, maxY-minY);
    
    // If we have a left subtree, draw it
    if (left != null) {
      left.draw(depth + 1);
    }
    
    // If we have a right subtree, draw it
    if (right != null) {
      right.draw(depth + 1);
    }
    
    // If we are a leaf node, draw our Sphere
    if (sphere != null) {
      sphere.draw();
    }
  }
  
  
}
