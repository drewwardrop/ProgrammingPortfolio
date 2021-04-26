
class Lines { 
  // class variables
  float xpos;
  float ypos;
  float strokeW;
  float lineLength;
  
  // constructor
  Lines(float tempX, float tempY, float tempStroke, float tempLength) {
    xpos = tempX;
    ypos = tempY;
    strokeW = tempStroke;
    lineLength = tempLength;
  }
  
  // display
  void display() {
    strokeW = random(1,5);
    lineLength = random(1,50);
    stroke(random(200),random(100),random(10));
    if(xpos > width || xpos < 0 || ypos > height || ypos < 0) {
      xpos = random(width);
      ypos = random(height);    
    } else {
      if(random(100)>90) {
        strokeWeight(strokeW);
        moveLeft(xpos,ypos,lineLength);   
      } else if(random(100)>80) {
        strokeWeight(strokeW);
        moveUp(xpos,ypos,lineLength);  
      } else if(random(100)>70) {
        strokeWeight(strokeW);
        moveDown(xpos,ypos,lineLength);
      } else if(random(100)>60) {
        strokeWeight(strokeW);
        moveRight(xpos,ypos,lineLength);
      } else if(random(100)>50) {
        strokeWeight(strokeW);
        moveRightDiagonalUp(xpos,ypos,lineLength);
      } else if(random(100)>40) {
        strokeWeight(strokeW);
        moveRightDiagonalDown(xpos,ypos,lineLength);
      } else if(random(100)>30) {
        strokeWeight(strokeW);
        moveLeftDiagonalUp(xpos,ypos,lineLength);
      } else {
        strokeWeight(strokeW);
        moveLeftDiagonalDown(xpos,ypos,lineLength);
      }
    }    
  }
  
  void moveRight(float startX, float startY, float moveCount) {
    for(float i=0; i<moveCount; i++) {
      point(startX+i, startY);
      xpos = startX + i;
      ypos = startY;
    }
  }
  
  void moveUp(float startX, float startY, float moveCount) {
    for(float i=0; i<moveCount; i++) {
      point(startX, startY-i);
      xpos = startX;
      ypos = startY - i;
    }
  }
  
  void moveLeft(float startX, float startY, float moveCount) {
    for(float i=0; i<moveCount; i++) {
      point(startX-i, startY);
      xpos = startX - i;
      ypos = startY;
    }
  }
  
  void moveDown(float startX, float startY, float moveCount) {
    for(float i=0; i<moveCount; i++) {
      point(startX, startY+i);
      xpos = startX;
      ypos = startY + i;
    }
  }  
  
  void moveRightDiagonalUp(float startX, float startY, float moveCount) {
    for(float i=0; i<moveCount; i++) {
      point(startX+i, startY-i);
      xpos = startX + i;
      ypos = startY - i;
    }
  }  
  
  void moveRightDiagonalDown(float startX, float startY, float moveCount) {
    for(float i=0; i<moveCount; i++) {
      point(startX+i, startY+i);
      xpos = startX + i;
      ypos = startY + i;
    }
  }
  
  void moveLeftDiagonalUp(float startX, float startY, float moveCount) {
    for(float i=0; i<moveCount; i++) {
      point(startX-i, startY-i);
      xpos = startX - i;
      ypos = startY - i;
    }
  }
  
  void moveLeftDiagonalDown(float startX, float startY, float moveCount) {
    for(float i=0; i<moveCount; i++) {
      point(startX-1, startY+i);
      xpos = startX - i;
      ypos = startY + i;
    }
  }  
  
}

int lineCount = 0;

Lines[] myLines = new Lines [10];

void setup() {
  background(random(0,30));
  size(1000,500,P3D);
    
  for (int i=0; i<myLines.length; i++) {
    myLines[i] = new Lines(random(width),random(height),random(1,5),random(1,20));
  }
}

void draw() {  
  for (int i=0; i<myLines.length; i++) {
    Lines iLines = myLines[i];
    iLines.display();
    lineCount++;
    //if (lineCount>500){
    //  reset();
    //}
  }  
}

// reset the screen
void reset() {
  background(random(0,30));
  lineCount = 0;  
}

void mouseClicked() {
  reset();
}
