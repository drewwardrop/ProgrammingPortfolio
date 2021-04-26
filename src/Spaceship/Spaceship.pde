void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  display(mouseX, mouseY);  
}

void display(int x, int y) {
  stroke(0);
  fill(255,25,25);
  arc(x, y+20, 20, 20, 0, PI);
  fill(0,68,204);
  rect(x-10, y-20, 20, 40);
  fill(255);
  ellipse(x, y+5, 10, 10);
  fill(255,25,25);
  quad(x-10, y-15, x-25, y-15, x-25, y+5, x-10, y+10);
  quad(x+25, y-15, x+10, y-15, x+10, y+10, x+25, y+5);
  stroke(255,255,0);
  line(x-6, y-25, x-6, y-35);
  line(x-6, y-40, x-6, y-45);
  line(x, y-25, x, y-30);
  line(x, y-35, x, y-50);
  line(x+6, y-25, x+6, y-40); 
}
