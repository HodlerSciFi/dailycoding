
class ColorBox {
  float boxCentX;
  float boxCentY;
  float boxWidth;
  float boxHeight;
  float hue;
  float sat;
  float tsat;
  float bright;
  float tbright;
  ColorBox(float _boxCentX, float _boxCentY, float _boxWidth, float _boxHeight, 
    float _hue, float _sat, float _bright) {
    boxCentX = _boxCentX;
    boxCentY = _boxCentY;
    boxWidth = _boxWidth;
    boxHeight = _boxHeight;
    hue = _hue;
    sat = _sat;
    bright = _bright;
    tsat = random(0, 10000);
    tbright = random(0, 10000);
  }

  void display() {
    stroke(0, 0, 100);
    fill(hue, sat, bright);
    rect(boxCentX - boxWidth/2, boxCentY - boxHeight/2, boxWidth, boxHeight);
  }
}
