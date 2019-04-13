class Circle {
 
  float x;
  float y;
  float r;
  boolean growing = true;
  
  Circle(float nx, float ny) {
    x = nx;
    y = ny;
    r = 1;
  }
  
  void grow() {
    if(growing) r = r+1; 
  }
  
  boolean edges() {
    if(x-r < 0 || r+r > width || y-r < 0 || y+r > height) {
      return true;
    } else {
      return false; 
    }
  }
  
  void show() {
    stroke(255);
    strokeWeight(2);
    noFill();
    ellipse(x,y,r*2,r*2);
  }
  
}
