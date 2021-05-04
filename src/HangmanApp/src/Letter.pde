class Letter {     

  int x;    
  int y;    
  char letter;
  int w; // width
  int h; // height
  color c; // color
  boolean hover;

  Letter(int x, int y, char letter) {
    this.x = x;
    this.y = y;
    this.letter = letter;
    
    this.w = 50;
    this.h = 100;
    this.c = #336067;
    this.hover = false;    
  }

  // Display a letter button
  void display() {
    
  }
  
  // Hover over a button
  void hover() {
    hover = mouseX > x-w && mouseX < x+w && mouseY > y-h && mouseY < y+h;
  }
  
  
}
    
