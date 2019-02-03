colorBox cb1, cb2, cb3, cb4;

void setup() {
  size(400, 400);
  //Hue色相 (0-360), Saturation彩度 (0-100%), Brightness明度 (0-100%)
  colorMode(HSB, 360, 100, 100);
  background(0, 0, 100); //白
  noLoop();
  cb1 = new colorBox(width/2 - 50, height/2, 100, 200, 20, 10, 60);
  cb2 = new colorBox(width/2 - 25, height/2, 50, 50, 20, 30, 60);
  cb3 = new colorBox(width/2 + 50, height/2, 100, 200, 20, 50, 60);
  cb4 = new colorBox(width/2 + 25, height/2, 50, 50, 20, 80, 60);
}

void draw() {
  cb1.display();
  cb2.display();
  cb3.display();
  cb4.display();
  save("20190204.png");
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
    noStroke();
    fill(hue, sat, bright);
    rect(boxCentX - boxWidth/2, boxCentY - boxHeight/2, boxWidth, boxHeight);
  }
}
