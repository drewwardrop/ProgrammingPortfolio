class Keyboard {

  int x;    
  int y;
  ArrayList<Letter> letters;
  
  Keyboard(int x, int y) {
    this.x = x;
    this.y = y;
    this.create();
  }
  
  void create() {
    int y = this.y;
    int w = 40;
    int h = 42;
    int space = 10;
    int[] lettersPerRow = { 10, 9, 7 };
    int c = 65;
    this.letters = new ArrayList();
    for(int i = 0; i<lettersPerRow.length; i++) {
      int x = this.x - (((lettersPerRow[i] * w) + ((lettersPerRow[i] - 1) * space)) / 2);      
      for(int j = 0; j < lettersPerRow[i]; j++) {
        letters.add(new Letter(x, y, w, h, char(c)));
        x += (w + space);
        c++;
      }
      y += (h + space);
    }    
  }

  // draw letters for keyboard
  void display() {
    for(int i=0; i<letters.size(); i++) {
      Letter l = letters.get(i);
      l.display();
    }    
  }
  
  // set hover for letters on keyboard
  void hover() {
    for(int i=0; i<letters.size(); i++) {
      Letter l = letters.get(i);
      l.hover();
    }
  }
  
  // deactivate a letter
  void deactivate(char l) {
        
  }
  
  void reset() {
    for(int i=0; i<letters.size(); i++) {
      Letter l = letters.get(i);
      l.reset();
    }    
  }
  
}
