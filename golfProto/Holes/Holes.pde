int numPegs = 1;
Hole[] holes = new Hole[numPegs*2+1];
Peg[] pegs = new Peg[numPegs*2];
boolean handFull = false;
Peg hand;

void setup() {
  size(700, 200);
  for(int i = 0; i < holes.length; i++) {
    holes[i] = new Hole(i*60+50,100);
    if(i < pegs.length/2) {
      pegs[i] = new Peg(i*60+50,100,53);
      pegs[i+pegs.length/2] = new Peg(i*60+50+60*pegs.length/2+60,100,255);
    }
    if(i < pegs.length/2) {
      holes[i].peg = pegs[i];
      pegs[i].hole = holes[i];
    }
    if(i > pegs.length/2) {
      holes[i].peg = pegs[i-1];
      pegs[i-1].hole = holes[i];
    }
  }
}

void draw() {
  background(152);
  for(int i = 0; i < holes.length; i++) {
    holes[i].draw();
  }
  for(int i = 0; i < pegs.length; i++) {
    pegs[i].draw();
  }
}

void mouseDragged() {
  for(int i = 0; i < pegs.length; i++) {
    if(pegs[i].inRange(mouseX,mouseY) && (!handFull || pegs[i].inHand)) {
      handFull = true;
      hand = pegs[i];
      hand.inHand = true;
      hand.x = mouseX;
      hand.y = mouseY;
    }
  }
}

void mouseReleased() {
  handFull = false;
  Hole goal = null;
  for(int  i = 0; i < holes.length; i++) {
    if(hand.inRange(holes[i].x,holes[i].y)) {
      goal = holes[i];
    }
  }
  if(hand.inHand == true) {
      hand.inHand = false;
      if(goal != null && goal.peg == null) {
        int d = abs(hand.x - hand.xO);
        println(d);
        if(d <= 120) {
          hand.hole.peg = null;
          hand.hole = goal;
          goal.peg = hand;
          hand.xO = goal.x;
          hand.yO = goal.y;
        }
      }
      hand.reset();
    }
}

class Peg {
  int x,y,xO,yO,colr;
  Hole hole;
  boolean inHand = false;
  Peg(int x, int y, int colr) {
    this.x = x;
    this.y = y;
    this.xO = x;
    this.yO = y;
    this.colr = colr;
  }
  boolean inRange(int x, int y) {
    return x > this.x-50 && x < this.x+50 
    && y > this.y-50 && y < this.y+50;
  }
  void reset() {
    x = xO;
    y = yO;
  }
  void draw() {
    fill(colr);
    ellipse(x,y,50,50);
  }
}

class Hole {
  int x,y;
  Peg peg;
  Hole(int x, int y) {
    this.x = x;
    this.y = y;
  }
  void draw() {
    fill(0);
    ellipse(x,y,50,50);
  }
}
