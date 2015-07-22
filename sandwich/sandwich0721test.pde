import gifAnimation.*;

import processing.video.*;

Capture cam;

PImage backgroundImage;
PImage img;

float threshold = 20;

float diffTotal;
float diffCompare;

PImage sandwich;

boolean sit = false;
boolean prevSit = false;

Gif tablecloth;
Gif sandwich1;
Gif sandwich2;
Gif sandwich3;

String[] cameras;

void setup() {
  size(1280, 720);

  cameras = Capture.list();
  cam = new Capture(this, cameras[0]);
  cam.start();
  
  backgroundImage = createImage(100, 100, RGB);
  img = new PImage(100, 100, RGB);

  tablecloth = new Gif(this, "tablecloth0.gif");
  tablecloth.loop();

  sandwich1 = new Gif(this, "sandwich1.gif");
  sandwich2 = new Gif(this, "sandwich2.gif");
  sandwich3 = new Gif(this, "sandwich3.gif");
  sandwich1.loop();
  sandwich2.loop();
  sandwich3.loop();
}

void captureEvent(Capture cam) {
  cam.read();
  img.copy(cam, 0, 0, cam.width, cam.height, 0, 0, 100, 100);
}

void draw() {
  background(0);
  image(tablecloth, 0, 0, 768, 768);

  for (int x = 0; x <img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      int loc = x + y*img.width; // Reversing x to mirror the image
      color fgColor = img.pixels[loc];
      color bgColor = backgroundImage.pixels[loc];
      float r1 = red(fgColor);
      float g1 = green(fgColor);
      float b1 = blue(fgColor);
      float r2 = red(bgColor);
      float g2 = green(bgColor);
      float b2 = blue(bgColor);
      float diff = dist(r1, g1, b1, r2, g2, b2);
      if (diff > threshold) {
        //set(x, y, fgColor);
        diffTotal ++;
      } else {
        //set(x, y, color(0, 255, 0));
      }
    }
    updatePixels();
  }

  diffCompare = diffTotal;
  diffTotal = 0;
  if (diffCompare > 500) {
    //println("in "+diffCompare);
    sit = true;
  } else {
    //println("out "+diffCompare);
    sit = false;
  }

  if (sit == true && sandwich1 !=null && sandwich2 != null && sandwich3 != null) {
    image(sandwich1, 100, 100, 184, 184);
    image(sandwich2, 300, 300, 184, 184);
    image(sandwich3, 600, 600, 184, 184);
  }

  if (sit == true && prevSit == false) {
    //sit down
    tablecloth.pause();
    //g.removeCache(cam);
    g.removeCache(img);
    //cam = null;
    img = null;
    //cam = new Capture(this, cameras[0]);
    img = new PImage(100, 100, RGB);

    prevSit = true;
  } else if (sit == false && prevSit == true) {
    //leave
    tablecloth.play();   
    thread("changeSandwich");
    prevSit = false;
  } else if (sit == false && prevSit == false) {
  } else if (sit == true && prevSit == true) {
  }
}

void mousePressed() {
  backgroundImage.copy(cam, 0, 0, cam.width, cam.height, 0, 0, 100, 100);
  backgroundImage.updatePixels();
}

void changeSandwich() {

  int num1 = (int)random(15);
  int num2 = (int)random(15);
  int num3 = (int)random(15);
  //println(num1+","+num2+","+num3);
  switch(num1) {
  case 0:
    g.removeCache(sandwich1);
    sandwich1 = null;
    sandwich1 = new Gif(this, "sandwich0.gif");
    sandwich1.loop();
    break;
  case 1:
    g.removeCache(sandwich1);
    sandwich1 = null;
    sandwich1 = new Gif(this, "sandwich1.gif");
    sandwich1.loop();
    break;
  case 2:
    g.removeCache(sandwich1);
    sandwich1 = null;
    sandwich1 = new Gif(this, "sandwich2.gif");
    sandwich1.loop();
    break;
  case 3:
    g.removeCache(sandwich1);
    sandwich1 = null;
    sandwich1 = new Gif(this, "sandwich3.gif");
    sandwich1.loop();
    break;
  case 4:
    g.removeCache(sandwich1);
    sandwich1 = null;
    sandwich1 = new Gif(this, "sandwich4.gif");
    sandwich1.loop();
    break;
  case 5:
    g.removeCache(sandwich1);
    sandwich1 = null;
    sandwich1 = new Gif(this, "sandwich5.gif");
    sandwich1.loop();
    break;
  case 6:
    g.removeCache(sandwich1);
    sandwich1 = null;
    sandwich1 = new Gif(this, "sandwich6.gif");
    sandwich1.loop();
    break;
  case 7:
    g.removeCache(sandwich1);
    sandwich1 = null;
    sandwich1 = new Gif(this, "sandwich7.gif");
    sandwich1.loop();
    break;
  case 8:
    g.removeCache(sandwich1);
    sandwich1 = null;
    sandwich1 = new Gif(this, "sandwich8.gif");
    sandwich1.loop();
    break;
  case 9:
    g.removeCache(sandwich1);
    sandwich1 = null;
    sandwich1 = new Gif(this, "sandwich9.gif");
    sandwich1.loop();
    break;
  case 10:
    g.removeCache(sandwich1);
    sandwich1 = null;
    sandwich1 = new Gif(this, "sandwich10.gif");
    sandwich1.loop();
    break;
  case 11:
    g.removeCache(sandwich1);
    sandwich1 = null;
    sandwich1 = new Gif(this, "sandwich11.gif");
    sandwich1.loop();
    break;
  case 12:
    g.removeCache(sandwich1);
    sandwich1 = null;
    sandwich1 = new Gif(this, "sandwich12.gif");
    sandwich1.loop();
    break;
  case 13:
    g.removeCache(sandwich1);
    sandwich1 = null;
    sandwich1 = new Gif(this, "sandwich13.gif");
    sandwich1.loop();
    break;
  case 14:
    g.removeCache(sandwich1);
    sandwich1 = null;
    sandwich1 = new Gif(this, "sandwich14.gif");
    sandwich1.loop();
    break;
  }
  switch(num2) {
  case 0:
    sandwich2 = null;
    sandwich2 = new Gif(this, "sandwich0.gif");
    sandwich2.loop();
    break;
  case 1:
    sandwich2 = null;
    sandwich2 = new Gif(this, "sandwich1.gif");
    sandwich2.loop();
    break;
  case 2:
    sandwich2 = null;
    sandwich2 = new Gif(this, "sandwich2.gif");
    sandwich2.loop();
    break;
  case 3:
    sandwich2 = null;
    sandwich2 = new Gif(this, "sandwich3.gif");
    sandwich2.loop();
    break;
  case 4:
    sandwich2 = null;
    sandwich2 = new Gif(this, "sandwich4.gif");
    sandwich2.loop();
    break;
  case 5:
    sandwich2 = null;
    sandwich2 = new Gif(this, "sandwich5.gif");
    sandwich2.loop();
    break;
  case 6:
    sandwich2 = null;
    sandwich2 = new Gif(this, "sandwich6.gif");
    sandwich2.loop();
    break;
  case 7:
    sandwich2 = null;
    sandwich2 = new Gif(this, "sandwich7.gif");
    sandwich2.loop();
    break;
  case 8:
    sandwich2 = null;
    sandwich2 = new Gif(this, "sandwich8.gif");
    sandwich2.loop();
    break;
  case 9:
    sandwich2 = null;
    sandwich2 = new Gif(this, "sandwich9.gif");
    sandwich2.loop();
    break;
  case 10:
    sandwich2 = null;
    sandwich2 = new Gif(this, "sandwich10.gif");
    sandwich2.loop();
    break;
  case 11:
    sandwich2 = null;
    sandwich2 = new Gif(this, "sandwich11.gif");
    sandwich2.loop();
    break;
  case 12:
    sandwich2 = null;
    sandwich2 = new Gif(this, "sandwich12.gif");
    sandwich2.loop();
    break;
  case 13:
    sandwich2 = null;
    sandwich2 = new Gif(this, "sandwich13.gif");
    sandwich2.loop();
    break;
  case 14:
    sandwich2 = null;
    sandwich2 = new Gif(this, "sandwich14.gif");
    sandwich2.loop();
    break;
  }
  switch(num3) {
  case 0:
    sandwich3 = null;
    sandwich3 = new Gif(this, "sandwich0.gif");
    sandwich3.loop();
    break;
  case 1:
    sandwich3 = null;
    sandwich3 = new Gif(this, "sandwich1.gif");
    sandwich3.loop();
    break;
  case 2:
    sandwich3 = null;
    sandwich3 = new Gif(this, "sandwich2.gif");
    sandwich3.loop();
    break;
  case 3:
    sandwich3 = null;
    sandwich3 = new Gif(this, "sandwich3.gif");
    sandwich3.loop();
    break;
  case 4:
    sandwich3 = null;
    sandwich3 = new Gif(this, "sandwich4.gif");
    sandwich3.loop();
    break;
  case 5:
    sandwich3 = null;
    sandwich3 = new Gif(this, "sandwich5.gif");
    sandwich3.loop();
    break;
  case 6:
    sandwich3 = null;
    sandwich3 = new Gif(this, "sandwich6.gif");
    sandwich3.loop();
    break;
  case 7:
    sandwich3 = null;
    sandwich3 = new Gif(this, "sandwich7.gif");
    sandwich3.loop();
    break;
  case 8:
    sandwich3 = null;
    sandwich3 = new Gif(this, "sandwich8.gif");
    sandwich3.loop();
    break;
  case 9:
    sandwich3 = null;
    sandwich3 = new Gif(this, "sandwich9.gif");
    sandwich3.loop();
    break;
  case 10:
    sandwich3 = null;
    sandwich3 = new Gif(this, "sandwich10.gif");
    sandwich3.loop();
    break;
  case 11:
    sandwich3 = null;
    sandwich3 = new Gif(this, "sandwich11.gif");
    sandwich3.loop();
    break;
  case 12:
    sandwich3 = null;
    sandwich3 = new Gif(this, "sandwich12.gif");
    sandwich3.loop();
    break;
  case 13:
    sandwich3 = null;
    sandwich3 = new Gif(this, "sandwich13.gif");
    sandwich3.loop();
    break;
  case 14:
    sandwich3 = null;
    sandwich3 = new Gif(this, "sandwich14.gif");
    sandwich3.loop();
    break;
  }
}

