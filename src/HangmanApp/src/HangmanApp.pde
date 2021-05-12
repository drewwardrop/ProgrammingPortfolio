
boolean won;
boolean lost;
Person person;
Word word;
Keyboard keyboard;
Button newGameBtn;
PFont txtFont;

void setup() { 
  size(850, 750);
  newGame();
}

void draw() {
  // keep drawing these to handle clicks, hovers and end of game
  keyboard.display();
  keyboard.hover();
  newGameBtn.display();
  newGameBtn.hover();
  // check to see if we have won or lost
  //checkResult();
}

// start a new game
void newGame() {
  background(26,83,92);
  person = new Person((width/2), 0);
  person.drawRope();
  word = new Word((width/2), 400);
  word.display();
  keyboard = new Keyboard((width/2), 500);
  keyboard.reset();
  newGameBtn = new Button((width/2), 700);  
  won = false;
  lost = false;
}

// track when a letter button is pressed or new game button is pressed
void mouseReleased() {
  // check for new game click
  if(newGameBtn.hover) {
    newGame();
  } 
  if(won || lost) {
    return;
  }
  // check for letter click
  for(int i=0; i<keyboard.letters.size(); i++) {
    Letter l = keyboard.letters.get(i);
    if(l.hover && l.active) {
      // choose the letter
      if(word.hasLetter(l.letter)) {
        // add letter to word blanks
        word.addLetter(l.letter);
        // see if the whole word has been filled
        if(word.isComplete()) {
          won = true;
          displayResult(true);          
        }
      } else {
        person.loseLife();
        // see if we don't have any more lives
        if(person.isDead()) {
          lost = true;
          displayResult(false);          
        }
      }
      // deactivate the letter
      l.active = false;
      return;
    }
  }
}

void displayResult(boolean won) {
  String msg;
  color col;
  if(won) {
    msg = "YOU WON! :)";
    col = #CCFFCC;
  } else {
    msg = "YOU LOST :(";
    col = #FF6666;
  }
  resetMatrix();
  fill(col);
  textAlign(CENTER, CENTER);
  txtFont = createFont("Helvetica", 18);
  textFont(txtFont);
  text(msg, (width/2)+100, 50);
}
