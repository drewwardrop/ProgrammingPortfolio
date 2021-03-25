class Rock{
  // member variables
  //int x,y,dia,health,speed,rad;
  int x,y,health,speed,rad;
  char displayMode;
  color c;
  PImage rock;
  
  // constructor 
  Rock(int x, int y) {
    this.x=x;
    this.y=y;
    //dia = 100;
    health = 25;
    speed = int(random(1,8));
    displayMode = '1';
    c = #715109;
    rock = loadImage("asteriod.png");
    rad = 50;
  }
  
  
  // Laser vs Rock Intersection
  boolean laserIntersection(Laser l) {
    float distance = dist(x,y,l.x,l.y);
    if(distance < rad + l.rad) {
      return true;
    } else {
      return false;
    }
  }
  
   boolean reachedBottom() {
    if(y>height) {
      return true;
    }  else {
       return false;
    }
  }
  
  void move() {
    y+=speed;
  }
  
  // member methods
  void display() {
    image(rock,x,y);  
  }
}
