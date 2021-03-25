// SpaceGame | Dec 2020 //<>//
// By Drew Wardrop

import processing.sound.*;
SoundFile Laser;
SpaceShip s1; 
ArrayList<Laser> lasers;
ArrayList<Rock> rocks;
ArrayList<PowerUp> powerups;
ArrayList<Star> stars;
Timer timer, puTimer;
int score, pass;
boolean play;
Animation explosion;
SoundFile explode;

void setup() {
  size(1000, 600);
  Laser = new SoundFile(this, "Narn-FighterGun (1).wav");
  s1 = new SpaceShip(#E3A11E);
  lasers = new ArrayList();
  rocks = new ArrayList();
  stars = new ArrayList();
  powerups = new ArrayList();
  timer = new Timer (int(random(800, 1200)));
  timer.start();
  puTimer = new Timer(5000);
  puTimer.start();
  pass = 0;
  score = 0;
  play = false;
  explosion = new Animation("explode_", 16, 5);
  explode = new SoundFile(this, "boom.wav");  
}

void draw() {
  noCursor();
  if (!play) {
    startScreen();
  } else {
    background(0);

    stars.add(new Star(int(random(width)), int(random(height))));
    for (int i = 0; i < stars.size(); i++) {
      Star star = stars.get(i);
      star.display();
      star.move();
      if (star.reachedBottom()) {
        stars.remove(star);
      }
    }

    if (timer.isFinished()) {
      rocks.add(new Rock(int(random(width)), -50));
      timer.start();
    }

    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();
      // Rock vs Ship Collision
      if (s1.rockIntersection(rock)) {
        s1.health-=rock.health;
        pass ++;
        rocks.remove(rock);
        explosion.display(rock.x, rock.y);    
        score+=50;
      }
      if (rock.reachedBottom()) {
        pass++;
        rocks.remove(rock);
      }
    }
    
    // PowerUp Distribution
    if (puTimer.isFinished()) {
      powerups.add(new PowerUp(int(random(width)), -20));
      puTimer.start();
    }
    // PowerUp rendering and collision detection
    for (int i = 0; i<powerups.size(); i++) {
      PowerUp powerup = powerups.get(i);
      powerup.move();
      powerup.display();
      // PowerUp and ship intersection
      if (s1.puIntersection(powerup)) {
        // Apply PowerUp Effects
        if (powerup.pu == 0) { // Adds ammo
          s1.ammo+=1000;
        } else if (powerup.pu == 1) { //Adds health
          s1.health+=100;
        }         
        powerups.remove(powerup);
      }
      // dispose of rocks at bottom
      if (powerup.reachedBottom()) {
        powerups.remove(powerup);
      }
    }    

    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      laser.display();
      laser.fire();
      // Laser vs Rock Intersection
      for (int j = 0; j < rocks.size(); j++) {
        Rock rock = rocks.get(j);
        if (rock.laserIntersection(laser)) {
          lasers.remove(laser);
          score+=5;
          rock.health-=25;
          if (rock.health<1);
          rocks.remove(rock);
          explosion.display(rock.x, rock.y);
          explode.play();
          score+=rock.health;
        }
      }
      if (laser.reachedTop()) {
        lasers.remove(laser);
      }
    }


    s1.display(mouseX, mouseY);
    infoPanel();

    //GameOver logic
    if (s1.health<1 || pass>10) {
      play = false;      
      gameOver();
    }
  }
}


void mousePressed() {
  if(play) {
    Laser.play();
  }
  
  if (s1.ammo >0) {
    lasers.add(new Laser(s1.x, s1.y));
  }
  s1.ammo--;
}

void startScreen() {
  background(0);
  textAlign(CENTER);
  text("Welcome!", width/2, height/2);
  text("Click to continue...", width/2, height/2+20);

  if (mousePressed) {
    play = true;
  }
}

void infoPanel() {
  fill(128, 128);
  rectMode(CORNER);
  rect(0, height-50, width, 50);
  fill(255, 128);
  text("Health:" + s1.health, 20, height-20);
  text("Lives:" + s1.lives, 150, height-20);
  text("Ammo:" + s1.ammo, 210, height-20);
  text("Level:", 300, height-20);
  text("Score:" + score, 350, height-20);
  if (pass > 7) {
    fill(255, 0, 0);
  }
  text("pass: " + pass, 420, height-20);
}

void gameOver() {
  background(0);
  textAlign(CENTER);
  fill(222);
  text("Game Over!", width/2, height/2);
  text("final score;" + score, width/2, height/2+20);
  noLoop();
}
