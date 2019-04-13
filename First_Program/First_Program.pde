int x;
int y;
int vel;

void setup() {
  size(500,500);
  x = 50;
  y = 50;
  vel = 10;
}

void draw() {
  background(255);
  fill(255,0,0);
  rect(50,50,100,100);
  fill(244, 100, 60);
  ellipse(x,y+250,50,50);
}

void keyPressed() {
  if(key == CODED) {
    if(keyCode == 38) {
      y-=vel;
    } else if(keyCode == 40) {
      y+=vel;
    } else if(keyCode == 37) {
      x-=vel;
    } else if(keyCode == 39) {
      x+=vel;
    }
  }
}
