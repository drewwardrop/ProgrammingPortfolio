class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  int startTime;
  int delay;
  int rad;

  Animation(String imagePrefix, int count, int delay) {
    imageCount = count;
    images = new PImage[imageCount];
    startTime = millis();
    delay = delay * 1000;
    rad = 50;

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf((i+1), 4) + ".png";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    if (millis() > startTime + delay) {
      startTime = millis(); // reset start time
      frame = (frame+1) % imageCount;
      imageMode(CENTER);
      image(images[frame], xpos, ypos);
    }
  }

  int getWidth() {
    return images[0].width;
  }
}
