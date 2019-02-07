import gifAnimation.*;
GifMaker gifExport;

int boxNum = 25;
colorBox[] colorBoxes = new colorBox[boxNum] ;

void setup() {
  size(400, 400);
  //Hue色相 (0-360), Saturation彩度 (0-100%), Brightness明度 (0-100%)
  colorMode(HSB, 360, 100, 100);
  background(0, 0, 100); //白
  frameRate(3);

  gifExport = new GifMaker(this, "20190208.gif"); 
  gifExport.setRepeat(0); 
  gifExport.setQuality(10); 
  gifExport.setDelay(300);

  float x = width/2 - 50;
  float y = height/2 - 80;
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
    colorBoxes[i].bright = mapNoise(colorBoxes[i].tbright , 0, 100);
    colorBoxes[i].tbright += 1;
  }
  gifExport.addFrame();
  
}

void mouseClicked() {
  gifExport.finish();
  exit();
}

//パーリンノイズのマッピング関数
float mapNoise(float t, float mapMin, float mapMax) {
  float n = noise(t);
  //マッピングしたい値、現在の値の範囲(最小値、最大値)、使いたい範囲
  float x = map(n, 0, 1, mapMin, mapMax);
  return x;
}

class colorBox {
  float boxCentX;
  float boxCentY;
  float boxWidth;
  float boxHeight;
  float hue;
  float sat;
  float tsat;
  float bright;
  float tbright;
  colorBox(float _boxCentX, float _boxCentY, float _boxWidth, float _boxHeight, 
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
