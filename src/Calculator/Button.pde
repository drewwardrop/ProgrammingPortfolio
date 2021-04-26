class Button {     

  // Button location and size 
  int x;    
  int y;    
  int d; // diameter
  String v;
  color vColor, bColor;
  boolean hover, isNumber, isOperator;

  // Constructor initializes all variables 
  Button(int tempX, int tempY, int tempD, String tempV, boolean isNumber, boolean isOperator) {
    x = tempX;    
    y = tempY;    
    d = tempD;
    v = tempV;
    this.isNumber = isNumber;
    this.isOperator = isOperator;
    hover = false;
  }

  // Display a button
  void display() {
    
    // Set value and background colors
    if(isNumber) {
      if(hover) {
        bColor = #888888;
      } else {
        bColor = #666666;
      }
      vColor = #ffffff;
    } else if(isOperator) {
      bColor = #FF9B00;
      if(hover) {
        bColor = #FFD736;
      } else {
        bColor = #FF9B00;        
      }
      vColor = #ffffff;      
    } else {
      if(hover) {
        bColor = #EEEEEE;
      } else {
        bColor = #CCCCCC;        
      }
      vColor = #000000;
    }
    
    // Create button
    fill(bColor);
    noStroke();
    circle(x, y, d);
    textSize(32);
    textAlign(CENTER);
    fill(vColor);
    text(v, x, y+8);
  }

  // Hover over a button
  void hover() {
    hover = mouseX > x-(d/2) && mouseX < x+(d/2) && mouseY > y-(d/2) && mouseY < y+(d/2);
  }
}
