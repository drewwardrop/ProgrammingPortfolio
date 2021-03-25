class SpaceShip {
  // member variable
  int x, y, health, ammo, lives, rad;
  char displayMode;
  color c1;

  // constructor
  SpaceShip(color c1) {
    x = 0;
    y = 0;
    health = 100;
    ammo =1000;
    lives = 3;
    displayMode = '1';
    this.c1 = c1;
    rad = 25;
  }
  
  // Rock vs Ship Collision
  boolean rockIntersection(Rock rock) {
    float distance = dist(x,y,rock.x,rock.y);
    if(distance < rad + rock.rad) {
      return true;
    } else {
      return false;
    }
  }

  // Rock vs PowerUp Collision
  boolean puIntersection(PowerUp powerup) {
    float distance = dist(x,y,powerup.x,powerup.y);
    if(distance < rad + powerup.r) {
      return true;
    } else {
      return false;
    }
  }


  // member methods
  void display(int x, int y) {
    this.x = x;
    this.y = y;
    if (displayMode == '1') {      
      stroke(0);
      fill(#2147FC);
      arc(x, y-20, 20, 20, PI, TWO_PI);
      fill(#767575);
      rectMode(CORNER);
      rect(x-10, y-20, 20, 40);
      fill(255);
      ellipse(x, y-5, 10, 10);
      fill(#2147FC);
      quad(x-10, y+15, x-25, y+15, x-25, y-5, x-10, y-10);
      quad(x+25, y+15, x+10, y+15, x+10, y-10, x+25, y-5);
      stroke(255, 255, 0);
      line(x-6, y+25, x-6, y+35);
      line(x-6, y+40, x-6, y+45);
      line(x, y+25, x, y+30);
      line(x, y+35, x, y+50);
      line(x+6, y+25, x+6, y+40);
    }
  }
}
