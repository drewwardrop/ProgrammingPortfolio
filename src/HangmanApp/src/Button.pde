class Button {     

  int x; // center x for word
  int y; // center y for word
  int w;
  int h;
  color tc; // text color
  color bc; // background color
  color hc; // hover border color
  boolean hover;
  String txt;
  int fs; // font size
  PFont txtFont;
  
  Button(int x, int y) {
    this.x = x;
    this.y = y;
    this.w = 180;
    this.h = 30;
    this.tc = #FFFFFF;
    this.bc = #336067;
    this.hc = #4ECCC3;
    this.txt = "NEW GAME";
    this.fs = 14;
  }
  
  void display() {
    rectMode(CENTER);
    fill(this.bc);
    if(this.hover) {
      stroke(this.hc);
    } else {
      stroke(this.tc);
    }
    rect(this.x, this.y, this.w, this.h, 12, 12, 12, 12);    
    fill(this.tc);
    textAlign(CENTER, CENTER);
    txtFont = createFont("Helvetica", this.fs);
    textFont(txtFont);
    text(this.txt, this.x, this.y); 
  }
  
  // Hover over a button
  void hover() {    
    hover = mouseX > x-w+fs && mouseX < x+w-fs && mouseY > y-h+fs && mouseY < y+h-fs;
  }

  
}
