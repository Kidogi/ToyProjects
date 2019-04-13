float x = 0;
float y = 0;

void setup() {
  size(600,600);
  background(0);
}

void drawPoint() {
  
  stroke(255);
  strokeWeight(1);
  float px = map(x,-3,3,0,width);
  float py = map(y,0,11,height,0);
  point(px,py);
  
}

void draw() {
  
  for(int i = 0; i < 1000; i++) {
    drawPoint();
    nextPoint();
  }
  
}

void nextPoint() {

  float nx;
  float ny;
  
  float r = random(1);
  
  if(r < 0.01) {
    nx = 0;
    ny = 0.16 * y;
  } else if(r < 0.86) {
    nx = 0.85 * x + 0.04 * y;
    ny = -0.04 * x + 0.85 * y + 1.6;
  } else if(r < 0.93) {
    nx = 0.2 * x - 0.26 * y;
    ny = .23 * x + 0.22 * y + 1.6;
  } else {
    nx = -0.15 * x + 0.28 * y;
    ny = 0.26 * x + 0.24 * y + 0.44;
  }
  
  x = nx;
  y = ny;

}
