import gifAnimation.*;
GifMaker gifExport;

int boxNum = 25;
colorBox[] colorBoxes = new colorBox[boxNum] ;

void setup() {
  size(400, 400);
  //Hue色相 (0-360), Saturation彩度 (0-100%), Brightness明度 (0-100%)
  colorMode(HSB, 360, 100, 100);
  background(0, 0, 100); //白
  //noLoop();
  frameRate(3);

  gifExport = new GifMaker(this, "20190206.gif"); 
  gifExport.setRepeat(0); 
  gifExport.setQuality(10); 
  gifExport.setDelay(300);

  float x = width/2 - 100;
  float y = height/2 - 100;
  float bWidth;
  float bHeight;
  float h;
  float s;
  float b;
  for (int i = 0; i < boxNum; i ++) {
    if (i > 0) {
      x += 20;
    }
    if (x % 50 == 0) {
      y += 20;
      x = width/2 - 50;
    }
    bWidth = 20;
    bHeight = 20;
    h = random(0, 360);
    s = random(0, 100);
    b = random(0, 100);
    colorBoxes[i] = new colorBox(x, y, bWidth, bHeight, h, s, b);
  }
}

void draw() {
  for (int i = 0; i < boxNum; i ++) {
    colorBoxes[i].display();
    //colorBoxes[i].hue = random(0, 360);
    colorBoxes[i].sat = random(0, 100);
    //colorBoxes[i].bright = random(0, 100);
  }
  //save("20190206.png");
  gifExport.addFrame();
}

void mouseClicked() {
  gifExport.finish();
  exit();
}

class colorBox {
  float boxCentX;
  float boxCentY;
  float boxWidth;
  float boxHeight;
  float hue;
  float sat;
  float bright;
  colorBox(float _boxCentX, float _boxCentY, float _boxWidth, float _boxHeight, 
    float _hue, float _sat, float _bright) {
    boxCentX = _boxCentX;
    boxCentY = _boxCentY;
    boxWidth = _boxWidth;
    boxHeight = _boxHeight;
    hue = _hue;
    sat = _sat;
    bright = _bright;
  }

  void display() {
    stroke(0, 0, 100);
    fill(hue, sat, bright);
    rect(boxCentX - boxWidth/2, boxCentY - boxHeight/2, boxWidth, boxHeight);
  }
}
