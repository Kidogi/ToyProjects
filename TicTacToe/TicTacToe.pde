int length = 600;

void setup() {
  size(600,600);
  for(int i = 0; i < 2; i++) {
    fill(0);
    rect(length/3+i*length/3,0,10,length);
  }
  for(int i = 0; i < 3; i++) {
    fill(0);
    rect(0,length/3+i*length/3,length,10);
  } 
}

void draw() {

  
}

void mouseClicked() {
  if(mouseX > 0 && mouseX < 200 && mouseY > 0 && mouseY < 200) {
    noFill();
    stroke(0);
    strokeWeight(10);
    ellipse(300,100,150,150);
    line(50,50,150,150);
    line(50,150,150,50);
  }
  if(mouseX > 200 && mouseX < 400 && mouseY > 200 && mouseY < 400) {
    noFill();
    stroke(0);
    strokeWeight(10);
    ellipse(300,100,150,150);
    line(50,50,150,150);
    line(50,150,150,50);
  }
}
