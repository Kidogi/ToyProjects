int colr = 0;
int x = 300;
int y = 300;
int goalX;
int goalY;
int originX;
int originY;

void setup() {
  size(600,600);
  goalX = 100;
  goalY = 100;
}

void draw() {
  background(160);
  fill(255);
  ellipse(goalX, goalY, 50, 50);
  fill(colr);
  ellipse(x,y,50,50);
}

void mousePressed() {
  if(mouseX > x-50 && mouseX < x+50 && mouseY > y-50 && mouseY < y+50) {
    originX = x;
    originY = y;
  }
}

void mouseDragged() {
  if(mouseX > x-50 && mouseX < x+50 && mouseY > y-50 && mouseY < y+50) {
    x = mouseX;
    y = mouseY;
  }
}

void mouseReleased() {
  if(x > goalX-50 && x < goalX+50 && y > goalY-50 && y < goalY+50) {
    println("WIN!");
    colr = 50;
    x = goalX;
    y = goalY;
  } else {
    x = originX;
    y = originY;
  }
}
