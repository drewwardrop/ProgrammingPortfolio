class PowerUp {
  // member variables
  int x, y, speed, pu, r;

  char displayMode;
  color c;
  PImage ammo, medkit;
  String[] puInfo = {"Ammo", "Health"};

  // constructor 
  PowerUp(int x, int y) {
    this.x = x;
    this.y = y;
    r = 100;
    medkit = loadImage("medkit.png");
    ammo = loadImage("ammo.png");
    speed = int(random(2, 8));
    pu = int(random(2));
  }

  void move() {
    y += speed;
  }  

  boolean reachedBottom() {
    if (y > height + r*4) { 
      return true;
    } else {
      return false;
    }
  }


  // member methods
  void display() {
    fill(c);
    //ellipse(x,y,dia,dia);
    switch(pu) {
    case 0: // Ammo
      image(ammo, x, y);
      break;
    case 1: // Health
      image(medkit, x, y);
      break;
    }
  }
}
