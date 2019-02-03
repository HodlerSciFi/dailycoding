colorBox cb1;

void setup() {
  size(500, 500);
  //Hue色相 (0-360), Saturation彩度 (0-100%), Brightness明度 (0-100%)
  colorMode(HSB, 360,100, 100);
  background(0, 0, 100); //白
  noLoop();
  cb1 = new colorBox(width/2, height/2, 100, 100);
}

void draw() {
  cb1.display();
  save("20190203.png");
}

class colorBox {
  float boxCentX;
  float boxCentY;
  float boxWidth;
  float boxHeight;
  colorBox(float _boxCentX, float _boxCentY, float _boxWidth, float _boxHeight){
    boxCentX = _boxCentX;
    boxCentY = _boxCentY;
    boxWidth = _boxWidth;
    boxHeight = _boxHeight;
  }
  
  void display() {
    noStroke();
    fill(0, 60, 30);
    rect(boxCentX - boxWidth/2, boxCentY - boxHeight/2, boxWidth, boxHeight);
  }
  
}
