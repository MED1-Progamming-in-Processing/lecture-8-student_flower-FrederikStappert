class Object {

  // Variables
  float xSpeed; // Speed along the x axis
  float ySpeed; // Speed along the y axis

  float objectSize;     // radius of the flower petal

  int num = 40;

  float[] xObject = new float[num];    // x-position of the center of the flower
  float[] yObject = new float[num];    // y-position of the center of the flower

  int indexPosition = 0;

  boolean transTail;

  boolean collision;

  Object(float _x, float _y, float _r, float _speed) {
    objectSize = _r;
    xObject[0] = _x;
    yObject[0] = _y;
    xSpeed = _speed;
    ySpeed = _speed/1.5;
  }

  // Constructor 2 that takes in an extra 
  Object(float _x, float _y, float _size, float _speed, boolean _transTail) {
    objectSize = _size;
    xObject[0] = _x;
    yObject[0] = _y;
    transTail = _transTail;
    xSpeed = _speed;
    ySpeed = _speed*1.5;
  }

  void display () {
    if (!transTail) {
      fill(200, 0, 0);
      // Draw the circles
      for (int i = num-1; i > 0; i--) {
        ellipse(xObject[i], yObject[i], objectSize-i, objectSize-i);
      }
    } else {
      fill(0, 200, 100);
      indexPosition = (indexPosition + 1) % num;
      xObject[indexPosition] = mouseX;
      yObject[indexPosition] = mouseY;
      for (int i = 0; i < num; i++) {
        // Set the array position to read
        int pos = (indexPosition + i) % num;
        float radius = objectSize+i-num;
        ellipse(xObject[pos], yObject[pos], radius, radius);
      }
    }
  }

  // Move function that moves the object
  void move() {

    for (int i = num-1; i > 0; i--) {
      xObject[i] = xObject[i-1];
      yObject[i] = yObject[i-1];
    }

    // X speed
    // Moves the first position of the X array according to the speed
    xObject[0] = xObject[0] + xSpeed;

    // Checks if it hits the right and left barriers, reversing the speed if it does.
    if (xObject[0] >= width-objectSize/2 || xObject[0] <= 0+objectSize/2) {
      xSpeed = xSpeed *= -1;
    }

    // Y speed
    // Moves the first position of the Y array according to the speed
    yObject[0] = yObject[0] + ySpeed;
    // Checks if it hits the upper and lower barriers, reversing the speed if it does.
    if (yObject[0] >= width-objectSize/2 || yObject[0] <= 0+objectSize/2) {
      ySpeed = ySpeed *= -1;
    }
  }

  // Bounce function that takes in a variable of this class, that is the other object
  void bounce(Object other) {
    // Float that checks the distance between this and the other object
    float d = dist(xObject[indexPosition], yObject[indexPosition], other.xObject[indexPosition], other.yObject[indexPosition]);
    // If the distance between them is smaller than the objects size AND the collision boolean is false:
    if (d < objectSize/2 + other.objectSize/2 && collision == false) { // collision boolean is just to prevent it getting stuck and bouncing back and forth
      // It will reverse the speed of the object
      println(d);
      xSpeed *= -1;
      ySpeed *= -1;
      // set the collision to true, to try and avoid the object getting stuck
      collision = true;
    } else {
      //Sets the collision to false when they are not touching
      collision = false;
    }
  }
}
