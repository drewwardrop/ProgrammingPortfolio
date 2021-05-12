class Word {     

  String word;
  String[] words = {"computer", "language", "programming", "software", "keyboard", "mouse"};

  int x; // center x for word
  int y; // center y for word
  color c; // color
  color bc; // background cover
  
  int lineWidth;
  int spaceWidth;
  int wordWidth;
  int correct; // keep track of correct answers
  
  PFont txtFont;
  
  Word(int x, int y) {
    this.x = x;
    this.y = y;
    this.c = #FFFFFF;
    this.correct = 0;
  }

  void display() {
    this.pickRandomWord();
    this.drawLetterLines();
  }
    
  // pick a random letter to use for the game
  void pickRandomWord() {
    int i = int(random(0, this.words.length));
    this.word = words[i];
  }
  
  // draw lines for word letters
  void drawLetterLines() {
    // draw lines
    lineWidth = 30;
    spaceWidth = 10;
    wordWidth = (lineWidth * this.word.length()) + (spaceWidth * (this.word.length() - 1));
    int lx = this.x + (lineWidth/2) - (wordWidth/2);
    fill(this.c);
    rectMode(CENTER);
    for(int i = 0; i<this.word.length(); i++) {
        rect(lx, this.y, lineWidth, 2);
        lx += (lineWidth + spaceWidth);
    }
  }
  
  // check for letter in word
  boolean hasLetter(char l) {
    boolean found = false;
    for(int i = 0; i<word.length(); i++) {
      if(word.charAt(i) == Character.toLowerCase(l)) {
        // found it
        found = true;
      }
    }
    return found;
  }
  
  // add letter for word
  void addLetter(char l) {
    int lx = this.x + (lineWidth/2) - (wordWidth/2);
    for(int i = 0; i<word.length(); i++) {
      if(word.charAt(i) == Character.toLowerCase(l)) {
        // draw letter
        fill(this.c);
        textAlign(CENTER, CENTER);
        txtFont = createFont("Helvetica", 24);
        textFont(txtFont);
        text(l, lx, this.y-30);
        // count correct letters
        this.correct++;
      }
      lx += (lineWidth + spaceWidth);
    }
  }
  
  // if the word is complete or not
  boolean isComplete() {
    return (this.correct >= this.word.length());
  }
  
}
