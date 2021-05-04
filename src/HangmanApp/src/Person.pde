class Person {     

  int lives;
  int x; // center x for person
  int y; // center y for person
  color c; // color
  
  Person(int x, int y) {
    this.x = x;
    this.y = y;

    this.lives = 6;
    this.c = #FFFFFF;
  }

  // Draw the hangman's rope
  void drawRope() {
    
  }

  void drawBodyPart() {
    
  }
  
  void loseLife() {
    this.lives--;
    // draw person body part
  }

}
