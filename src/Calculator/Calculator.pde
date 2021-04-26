/* /////////////////////
2020 Calculator for Programming 1
Drew Wardrop | Nov 2020
/////////////////////*/


Button[] numButtons = new Button[11];
Button[] opButtons = new Button[11];
String dVal, op;
boolean left; // left of operator or not
float r, l, result; 

void setup() { 
  size(420, 720);
  
  // Set starting values
  clearCalc();
      
  // Create number buttons    
  numButtons[0] = new Button(60, 550, 80, "0", true, false);
  numButtons[1] = new Button(60, 450, 80, "1", true, false);
  numButtons[2] = new Button(160, 450, 80, "2", true, false);
  numButtons[3] = new Button(260, 450, 80, "3", true, false);
  numButtons[4] = new Button(60, 350, 80, "4", true, false);
  numButtons[5] = new Button(160, 350, 80, "5", true, false);
  numButtons[6] = new Button(260, 350, 80, "6", true, false);
  numButtons[7] = new Button(60, 250, 80, "7", true, false);
  numButtons[8] = new Button(160, 250, 80, "8", true, false);
  numButtons[9] = new Button(260, 250, 80, "9", true, false);
  numButtons[10] = new Button(160, 550, 80, ".", true, false);

  // Create operator buttons
  opButtons[0] = new Button(360, 250, 80, "/", false, true);
  opButtons[1] = new Button(360, 350, 80, "x", false, true);
  opButtons[3] = new Button(360, 450, 80, "-", false, true);
  opButtons[2] = new Button(360, 550, 80, "+", false, true);
  opButtons[4] = new Button(260, 550, 80, "+/-", false, true);
  
  // Create special operator buttons
  opButtons[5] = new Button(60, 150, 80, "√", false, false);
  opButtons[6] = new Button(160, 150, 80, "x²", false, false);
  opButtons[7] = new Button(260, 150, 80, "|x|", false, false);
  opButtons[8] = new Button(360, 150, 80, "π", false, false);
  opButtons[9] = new Button(60, 650, 80, "C", false, false);
  opButtons[10] = new Button(360, 650, 80, "=", false, false);

}

void draw() {
  updateDisplay();
  for(int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover();
  }
  for(int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover();
  }
}

// track when keyboard buttons are pressed
void keyPressed() {
  if(key == '0') {
    handleEvent("0", true);
  } else if(key == '1') {
    handleEvent("1", true);    
  } else if(key == '2') {
    handleEvent("2", true);    
  } else if(key == '3') {
    handleEvent("3", true);    
  } else if(key == '4') {
    handleEvent("4", true);    
  } else if(key == '5') {
    handleEvent("5", true);    
  } else if(key == '6') {
    handleEvent("6", true);    
  } else if(key == '7') {
    handleEvent("7", true);    
  } else if(key == '8') {
    handleEvent("8", true);    
  } else if(key == '9') {
    handleEvent("9", true);    
  } else if(key == '+') {
    handleEvent("+", false);    
  } else if(key == '-') {
    handleEvent("-", false);    
  } else if(key == '/') {
    handleEvent("/", false);    
  } else if(key == '.') {
    handleEvent(".", true);
  } else if(key == 27 || key == 'C') {
    handleEvent("C", false);
  } else if(key == 10) {
    if(keyCode == ENTER || keyCode == RETURN) {
      handleEvent("=", false);
    }
  }  
}

// track when a calculator button is pressed
void mouseReleased() {  
  
  for(int i=0; i<numButtons.length; i++) {
    if(numButtons[i].hover && dVal.length() < 20) {
      handleEvent(numButtons[i].v, true);      
    }
  }
  
  for(int i=0; i<opButtons.length; i++) {
    if(opButtons[i].hover) {
      handleEvent(opButtons[i].v, false);
    }
  }
  
}


String handleEvent(String val, boolean num) {
  
  if(num) {
    
    if(dVal.equals("0")) {
      dVal = val;
    } else {
      dVal += val;          
    }
    
    if(left) {        
      l = float(dVal);
    } else {
      r = float(dVal);        
    }
    
  } else {
    
    if(val.equals("C")) {
        clearCalc();
      } else if(val.equals("=")) {
        performCalc();
      } else if(val.equals("+")) {
        if(left) {
          op = "+";
          left = false;
          dVal = "0";
        } else {
          performCalc();
        }
      } else if(val.equals("-")) {
        if(left) {
          op = "-";
          left = false;          
          dVal = "0";
        } else {
          performCalc();
        }        
      } else if(val.equals("/")) {
        if(left) {
          op = "/";
          left = false;          
          dVal = "0";
        } else {
          performCalc();
        }
      } else if(val.equals("x")) {
        if(left) {
          op = "x";
          left = false;          
          dVal = "0";
        } else {
          performCalc();
        }
      } else if(val.equals("+/-")) {
        if(left) {
          l = l * -1;
          dVal = str(l);
        } else {
          r = r * -1;          
          dVal = str(r);
        }
      } else if(val.equals("√")) {
        if(left) {
          l = sqrt(l);
          dVal = str(l);
        } else {
          r = sqrt(r);
          dVal = str(r);
        }
      } else if(val.equals("x²")) {
        if(left) {
          l = l * l;
          dVal = str(l);
        } else {
          r = r * r;
          dVal = str(r);
        }
      } else if(val.equals("|x|")) {
        if(left) {
          l = abs(l);
          dVal = str(l);
        } else {
          r = abs(r);
          dVal = str(r);
        }
      } else if(val.equals("π")) {
        if(left) {
          l = PI;
          dVal = str(l);
        } else {
          r = PI;
          dVal = str(r);
        }        
      }
      
  }
    
  println();
  println();
  println("l: "+l);
  println("r: "+r);
  println("op: "+op);
  println("result: "+result);
  println("left: "+left);

  return "";
}

// It will display number after clicking on it
void updateDisplay(){
  background(0);
  fill(0);
  noStroke();
  rect(0, 0, width, 70);
  fill(255);
  
  // Change size for bigger numbers
  int textSize = 60;
  if(dVal.length() > 10) {
    if(dVal.length() < 12) {
      textSize = 56;
    } else if(dVal.length() < 13) {
      textSize = 52;
    } else if(dVal.length() < 14) {
      textSize = 47;
    } else if(dVal.length() < 15) {      
      textSize = 44;
    } else if(dVal.length() < 16) {
      textSize = 40;
    } else if(dVal.length() < 17) {
      textSize = 37;
    } else if(dVal.length() < 19) {
      textSize = 34;
    } else if(dVal.length() < 21) {
      textSize = 31;      
    } else if(dVal.length() < 23) {
      textSize = 28;      
    } else if(dVal.length() < 25) {
      textSize = 25;      
    } else if(dVal.length() < 17) {
      textSize = 22;      
    } else {
      textSize = 18;
    }          
  }
  
  textSize(textSize);
  textAlign(RIGHT);
  text(dVal, width-20, 70);
}

void clearCalc() {
  dVal = "0";
  op = "";
  left = true;
  r = 0.0;
  l = 0.0;
  result = 0.0;
}

// Performing calculations
void performCalc(){
 if(op.equals("+")) {
   result = l + r;
 } else if(op.equals("-")) {
   result = l - r;   
 } else if(op.equals("/")) {
   result = l / r;
 } else if(op.equals("x")) {
   result = l * r;
 }
 l = result;
 left = true;
 dVal = str(result); 
}
