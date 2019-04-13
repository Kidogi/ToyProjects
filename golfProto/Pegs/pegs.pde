Hole[] holes = new Hole[11];
Peg[] blackPegs = new Peg[5];
Peg[] whitePegs = new Peg[5];
boolean handFull = false;

void setup() {
  size(600,600);
  int x,y;
  boolean noSpace = true;
  //make holes
  for(int i = 0; i<11; i++) {
    while(noSpace) {
      noSpace = false;
      x = (int)random(50,550);
      y = (int)random(50,550);
      for(int j = 0; j < holes.length && holes[j] != null; j++)  if(holes[j].inRange(x,y))  noSpace = true;
      if(!noSpace) {
        holes[i] = new Hole(x,y);
      }
    } noSpace = true;
  }
  //generate black pegs
  for(int i = 0; i<blackPegs.length ; i++) {
    while(noSpace) {
      noSpace = false;
      x = (int)random(50,550);
      y = (int)random(50,550);
      for(int j = 0; j < holes.length && holes[j] != null; j++)  if(holes[j].inRange(x,y))  noSpace = true;
      for(int j = 0; j < blackPegs.length && blackPegs[j] != null; j++)  if(blackPegs[j].inRange(x,y))  noSpace = true; 
      if(!noSpace) blackPegs[i] = new Peg(x,y,155);
    } noSpace = true;
  }
  //generate white pegs
  for(int i = 0; i<whitePegs.length ; i++) {
    while(noSpace) {
      noSpace = false;
      x = (int)random(50,550);
      y = (int)random(50,550);
      for(int j = 0; j < holes.length && holes[j] != null; j++)  if(holes[j].inRange(x,y))  noSpace = true;
      for(int j = 0; j < blackPegs.length && blackPegs[j] != null; j++)  if(blackPegs[j].inRange(x,y))  noSpace = true; 
      for(int j = 0; j < whitePegs.length && whitePegs[j] != null; j++)  if(whitePegs[j].inRange(x,y))  noSpace = true; 
      if(!noSpace) whitePegs[i] = new Peg(x,y,250);
    } noSpace = true;
  }
}

void draw() {
  background(120);
  for(int i = 0; i < holes.length; i++) {
    holes[i].draw();
  }
  for(int i = 0; i< blackPegs.length; i++) {
    blackPegs[i].draw();
  }
  for(int i = 0; i < whitePegs.length; i++) {
    whitePegs[i].draw();
  }
}

void mouseDragged() {
  for(int i = 0; i < blackPegs.length; i++) {
    if(blackPegs[i].inRange(mouseX,mouseY) && !handFull) {
     blackPegs[i].inHand = true;
     handFull = true;
    }
    if(whitePegs[i].inRange(mouseX,mouseY) && !handFull) {
     whitePegs[i].inHand = true;
     handFull = true;
    } 
  }
  for(int i = 0; i < blackPegs.length; i++) {
    if(blackPegs[i].inHand) {
      blackPegs[i].x = mouseX;
      blackPegs[i].y = mouseY;
    }
    if(whitePegs[i].inHand) {
      whitePegs[i].x = mouseX;
      whitePegs[i].y = mouseY;
    }
  }
}

void mouseReleased() {
  handFull = false;
  Hole goal = null;
  for(int i = 0; i < holes.length; i++) {
    if(holes[i].inRange(mouseX,mouseY)) {
      goal = holes[i];
    }
  }
  for(int i = 0; i < blackPegs.length; i++) {
    if(blackPegs[i].inHand && goal != null && goal.peg == null) {
      blackPegs[i].xO = goal.x;
      blackPegs[i].yO = goal.y;
      if(blackPegs[i].hole == null) {
        blackPegs[i].hole = goal;
      }
      if(blackPegs[i].hole != null) {
        blackPegs[i].hole.peg = null;
        blackPegs[i].hole = goal;
      }
      goal.peg = blackPegs[i];
    }
    blackPegs[i].inHand = false;
    blackPegs[i].reset();
    if(whitePegs[i].inHand && goal != null && goal.peg == null) {
      whitePegs[i].xO = goal.x;
      whitePegs[i].yO = goal.y;
      if(whitePegs[i].hole == null) {
        whitePegs[i].hole = goal;
      }
      if(whitePegs[i].hole != null) {
        whitePegs[i].hole.peg = null;
        whitePegs[i].hole = goal;
      }
      goal.peg = whitePegs[i];
    }
    whitePegs[i].inHand = false;
    whitePegs[i].reset();
  }
}

class Hole {
  int x,y;
  Peg peg = null;
  Hole(int x, int y) {
    this.x = x;
    this.y = y;
  }
  void draw() {
    fill(0);
    ellipse(x,y,50,50);
  }
  boolean inRange(int x, int y) {
    return (x > this.x-50 && x < this.x+50 && y > this.y-50 && y < this.y+50);
  }
}

class Peg {
  int x,y;
  int xO,yO;
  int colr;
  boolean inHand = false;
  Hole hole = null;
  Peg(int x, int y, int colr) {
    this.x = x;
    this.y = y;
    this.xO = x;
    this.yO = y;
    this.colr = colr;
  }
  void draw() {
    fill(colr);
    ellipse(x,y,50,50);
  }
  boolean inRange(int x, int y) {
    return (x > this.x-50 && x < this.x+50 && y > this.y-50 && y < this.y+50);
  }
  void reset() {
    this.x = this.xO;
    this.y = this.yO;
  }
}
