class Letter {     

  int x;    
  int y;    
  char letter;
  int w; // width
  int h; // height
  int fs; // font size
  color c; // color
  color ic; // inactive color
  color bc; // hover border color;
  color tc; // text color
  boolean hover; // if we are currently hovering over letter
  boolean active; // if this letter has already been chosen
  PFont txtFont;

  Letter(int x, int y, int w, int h, char letter) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.letter = letter;
    
    this.c = #336067;
    this.ic = #21555E;
    this.bc = #4ECCC3;
    this.tc = #FFFFFF;
    this.fs = 18;
    this.hover = false;
    this.active = true;
    this.hover();
    this.display();
  }

  // Display a letter button
  void display() {
    if(this.active) {
      if(this.hover) {
        stroke(this.bc);
      } else {
        stroke(this.c);
      }
      fill(this.c);
    } else {
      stroke(this.ic);
      fill(this.ic);
    }        
    rectMode(CENTER);
    rect(this.x, this.y, this.w, this.h);    
    fill(this.tc);
    textAlign(CENTER, CENTER);
    txtFont = createFont("Helvetica", this.fs);
    textFont(txtFont);
    text(this.letter, this.x, this.y);
  }
  
  // Hover over a button
  void hover() {    
    hover = mouseX > x-w+fs && mouseX < x+w-fs && mouseY > y-h+fs && mouseY < y+h-fs;
  }
  
  void reset() {
    this.active = true;
  }
}
    
