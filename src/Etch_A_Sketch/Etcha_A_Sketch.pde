int x, y;  //<>//

void setup() { 
  size(400, 400); 
  frameRate(10);
  // Set start coords 
  x = 0; 
  y = 0;
} 

void draw() { 
  fill(255); 
  drawName(); 
  noLoop();
} 

// Algorithm for your first name 
void drawName() { 
  
  // Draw 'D'
  moveRight(5);
  moveDown(10);
  for(int i = 0; i<5; i++) {
    moveRight(1);
    moveUp(1);
  }
  for(int i = 0; i<5; i++) {
    moveLeft(1);
    moveUp(1);
  }
  moveDown(10);
  
  // Draw 'r'
  moveRight(7);
  moveUp(5);
  moveDown(2);
  moveRight(1);
  moveUp(1);
  moveRight(1);
  moveUp(1);
  moveRight(2);
  moveDown(1);
  
  moveUp(1);  
  moveLeft(2);
  moveDown(1);
  moveLeft(1);
  moveDown(1);
  moveLeft(1);
  moveDown(3);
  moveRight(6);
  
  // Draw 'e'
  moveUp(5);
  moveRight(3);
  moveDown(2);
  moveLeft(3);
  moveDown(3);
  moveRight(3);
  moveUp(1);
  moveDown(1);
  moveRight(4);
  
  // Draw 'w'
  moveUp(5);
  moveDown(5);
  moveRight(2);
  moveUp(5);
  moveDown(5);
  moveRight(2);
  moveUp(5);
  moveDown(5);
    
} 

// Method to draw right line 
void moveRight(int rep) { 
  for (int i=0; i<rep*10; i++) { 
    point(x+i, y);
  }
  x=x+(10*rep);
}

// Method to draw left line 
void moveLeft(int rep) { 
  for (int i=0; i<rep*10; i++) { 
    point(x-i, y);
  }
  x=x-(10*rep);
}

// Method to draw down line 
void moveDown(int rep) { 
  for (int i=0; i<rep*10; i++) { 
    point(x, y+i);
  }
  y=y+(10*rep);
}

// Method to draw up line 
void moveUp(int rep) { 
  for (int i=0; i<rep*10; i++) { 
    point(x, y-i);
  }
  y=y-(10*rep);
}
