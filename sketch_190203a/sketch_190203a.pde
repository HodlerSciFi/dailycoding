colorBox[] colorBoxes = new colorBox[20] ;

void setup() {
  size(400, 400);
  //Hue色相 (0-360), Saturation彩度 (0-100%), Brightness明度 (0-100%)
  colorMode(HSB, 360, 100, 100);
  background(0, 0, 100); //白
  noLoop();

  float boxCentX;
  float boxCentY;
  float boxWidth;
  float boxHeight;
  float hue;
  float sat;
  float bright;
  for (int i = 0; i < 20; i ++) {
    boxCentX = random(0, width);
    boxCentY = random(0, height);
    boxWidth = random(10, 200);
    boxHeight = random(10, 200);
    hue = random(0, 360);
    sat = random(0, 100);
    bright = random(0, 100);
    colorBoxes[i] = new colorBox(boxCentX, boxCentY, 
      boxWidth, boxHeight, hue, sat, bright);
  }
}

void draw() {
  for (int i = 0; i < 20; i ++) {
    colorBoxes[i].display();
  }
  save("20190205.png");
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
