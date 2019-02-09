
class SheerBox extends ColorBox {
  float alpha;
  SheerBox (float _boxCentX, float _boxCentY, float _boxWidth, float _boxHeight, 
    float _hue, float _sat, float _bright, float _alpha) {
    super( _boxCentX,  _boxCentY,  _boxWidth,  _boxHeight, 
     _hue,  _sat,  _bright);
    alpha = _alpha;
  }
  void display() {
    noStroke();
    fill(hue, sat, bright, alpha);
    rect(boxCentX - boxWidth/2, boxCentY - boxHeight/2, boxWidth, boxHeight);
  }
  
}
