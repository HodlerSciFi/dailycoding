import gifAnimation.*;
GifMaker gifExport;

int boxNum = 36;
SheerBox[] SheerBoxes = new SheerBox[boxNum] ;

void setup() {
  size(400, 400);
  //Hue色相 (0-360), Saturation彩度 (0-100%), Brightness明度 (0-100%)
  colorMode(HSB, 360, 100, 100, 100);
  background(0, 0, 100); //白
  frameRate(3);

  gifExport = new GifMaker(this, "20190210.gif"); 
  gifExport.setRepeat(0); 
  gifExport.setQuality(10); 
  gifExport.setDelay(300);

  float x;
  float y;
  float bWidth;
  float bHeight;
  float h;
  float s;
  float b;
  float a;
  float radius = 50;
  for (int i = 0; i < boxNum; i ++) {
    x = radius * cos(radians(i * 10)) + width/2;
    y = radius * sin(radians(i * 10)) + height /2;
    bWidth = random(5, 20) ;
    bHeight = random(5, 20);
    h = random(0, 360);
    s = random(0, 100);
    b = random(0, 100);
    a = 80;
    SheerBoxes[i] = new SheerBox(x, y, bWidth, bHeight, h, s, b, a);
  }
}

void draw() {
  background(0, 0, 100);
  for (int i = 0; i < boxNum; i ++) {
    SheerBoxes[i].display();
    SheerBoxes[i].bright = mapNoise(SheerBoxes[i].tbright , 0, 100);
    SheerBoxes[i].sat = mapNoise(SheerBoxes[i].tsat , 0, 100);
    SheerBoxes[i].tbright += 1;
    SheerBoxes[i].tsat += 1;
    SheerBoxes[i].move();
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
