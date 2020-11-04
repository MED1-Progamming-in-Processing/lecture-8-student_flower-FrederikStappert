Object myObject1, myObject2;  // the first instance of the Flower class

void setup() {
  size(800, 800);

  noStroke();
  
  float _size1 = 40;
  float _size2 = 150;
  float _x1 = random(0 + width/5, width-width/5);
  float _y1 = random(0 + height/5, height-height/5);
  float _x2 = random(0 + width/5, width-width/5);
  float _y2 = random(0 + height/5, height-height/5);
  boolean _mouseControlled = true;

  rectMode(CENTER);

  myObject1 = new Object(_x1, _y1, _size1, 5); 
  myObject2 = new Object(_x2, _y2, _size2, -1, _mouseControlled);
}

void draw() {
  background(0);

  myObject1.display();
  myObject1.move();  
  myObject2.display();
  //myObject2.move();
  
  myObject1.bounce(myObject2);
}
