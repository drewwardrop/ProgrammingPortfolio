class Laser{
  // member variables
  int x,y,speed,rad;
  color c;
  
  // constructor 
  Laser(int x, int y) {
    this.x=x;
    this.y=y;
    speed = 6;
    c = #FC1008;
    rad = 4;
  }
  
  // member methods
  void fire() {
    y-=speed;  
  }
  
  boolean reachedTop() {
    if(y<-3) {
      return true;
    }  else {
       return false;
    }
  }
  
  
  void display() {
    fill(c);
    noStroke();
    rectMode(CENTER);
    rect(x,y,rad,rad*2);
  }
}
