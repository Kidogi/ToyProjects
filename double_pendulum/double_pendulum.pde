float r1 = 100;
float r2 = 100;
float m1 = 10;
float m2 = 10;
float a1 = PI/3;
float a2 = PI/2;
float a1_v = 0;
float a2_v = 0;
float g = .08;

float prevx2 = -1;
float prevy2 = -1;

PGraphics canvas;

void setup() {
  size(600,600);
  canvas = createGraphics(600,600);
  canvas.beginDraw();
  canvas.background(255);
  canvas.endDraw();
}

void draw() {
  
   float term1 = -g * (2*m1 + m2) * sin(a1) - m2 * g * sin(a1-2*a2) - 2 * sin(a1-a2) * m2 * (a2_v * a2_v * r2 + a1_v * a1_v * r1 * cos(a1-a2));
   float term2 = r1 * (2*m1 + m2 - m2 * cos(2 * a1 - 2 * a2));
   
   float a1_a = term1/term2;
   
   float term3 = 2 * sin(a1 - a2) * (a1_v * a1_v * r1 * (m1 + m2) + g * (m1 + m2) * cos(a1) + a2_v * a2_v * r2 * m2 * cos(a1-a2));
   float term4 = r2 * (2 * m1 + m2 - m2 * cos(2 * a1 - 2 * a2));
   
   float a2_a = term3/term4;
  
   image(canvas,0,0);
   stroke(0);
   strokeWeight(2);
   
   translate(300,300);
   
   float x1 = r1 * sin(a1);
   float y1 = r1 * cos(a1);
   
   float x2 = x1 + r2 * sin(a2);
   float y2 = y1 + r2 * cos(a2);
   
   line(0,0,x1,y1);
   fill(0);
   ellipse(x1,y1,m1,m1);
   
   line(x1,y1,x2,y2);
   fill(0);
   ellipse(x2,y2,m2,m2);
   
   a1_v += a1_a;
   a2_v += a2_a;
   a1 += a1_v;
   a2 += a2_v;
   
   canvas.beginDraw();
   canvas.translate(300,300);
   canvas.strokeWeight(1);
   canvas.stroke(0);
   if(frameCount > 1) {
     canvas.line(prevx2,prevy2,x2,y2);
   }
   canvas.endDraw();
   
   prevx2 = x2;
   prevy2 = y2;
}
