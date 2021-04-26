class Car {
  
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float r;
    
  // Constructor initializes all variables 
  Car(color c, float xspeed) {
    this.c = c;    
    xpos = random(width);    
    ypos = random(height);    
    this.xspeed = xspeed;
    this.r = random(1,10);
  }
  
  void display() {
    rectMode(CENTER);
    fill(c);
    rect(xpos, ypos, 20, 10,4);
    fill(0);
    rect(xpos-6, ypos-5, 5,3);
    rect(xpos+6, ypos-5, 5,3);
    rect(xpos+6, ypos+5, 5,3);
    rect(xpos-6, ypos+5, 5,3);
  }
  
  void drive() {
    if(r > 5) {
      xpos -= xspeed;
    } else {
      xpos += xspeed;
    }
    if(xpos > width) {
      xpos = 0;
    }
  }
  
  
  
}
