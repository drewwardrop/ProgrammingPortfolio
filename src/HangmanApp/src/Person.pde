class Person {     

  int lives;
  int x; // center x for person
  int y; // center y for person
  color c; // color
  color rc; // rope color
  color bc; // background color;
  
  Person(int x, int y) {
    this.x = x;
    this.y = y;

    this.lives = 6;
    this.c = #FFFFFF;
    this.rc = #4ECCC3;
  }

  // Draw the hangman's rope
  void drawRope() {
    fill(this.rc);
    noStroke();
    rectMode(CENTER);
    rect(this.x, this.y+50, 6, 100);
  }

  void drawBodyPart() {
    fill(this.c);
    noStroke();    

    switch(lives) {
      case 6: // head
        ellipseMode(CENTER);
        ellipse(this.x, this.y+130, 50, 60);
        break;
        
      case 5: // body
        rectMode(CENTER);
        rect(this.x, this.y+200, 6.5, 100);
        // noose
        fill(this.rc);
        rect(this.x, this.y+162, 12, 6);        
        break;
        
      case 4: // left arm
        rectMode(CENTER);
        rect(this.x-25, this.y+175, 50, 6.5);
        break;
        
      case 3: // right arm
        rectMode(CENTER);
        rect(this.x+25, this.y+175, 50, 6.5);
        break;

      case 2: // left leg
        rectMode(CENTER);
        resetMatrix();
        rotate(radians(-45));
        translate(-300, 300);
        rect(this.x-36, this.y+176, 75, 6.5);
        break;

      case 1: // right leg      
        resetMatrix();
        rotate(radians(45));
        translate(100, -300);
        rect(this.x-10, this.y+176, 75, 6.5);      
        break;
      
    }
    
  }
  
  void loseLife() {
    // draw person body part
    this.drawBodyPart();
    // lose life
    this.lives--; 
  }
  
  void reset() {
    this.lives = 6;
  }
  
  // whether or not the person is dead
  boolean isDead() {
     return (this.lives <= 0); 
  }

}
