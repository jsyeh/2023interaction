//想要把球放蛋糕上
void setup(){
  size(500,500,P3D);
}
float rotCake=0;
void draw(){
  background(#FFFFF2);
  lights();
  fill(#FFFF81);
  noStroke();
  translate(width/2, height/2);
  pushMatrix();
    translate(0, 100);
    rotateY(radians(rotCake));
    drawCylinder(0, 0, 200,100);
    for(PVector p : pt){
      pushMatrix();
      translate(p.x, p.y, p.z);
      sphere(50);
      popMatrix();
    }
  popMatrix();
}
void drawCylinder(float x, float y, float r, float h){
  beginShape(TRIANGLE_STRIP);
  for(float angle=0; angle<=PI*2; angle+=0.1){
    vertex(x+r*cos(angle), h/2, y+r*sin(angle));
    vertex(x+r*cos(angle), -h/2, y+r*sin(angle));
  }
  endShape(CLOSE);
  circleFan(x,y,-h/2, r);
  circleFan(x,y,+h/2, r);
}
void circleFan(float x, float y, float z, float r){
  beginShape(TRIANGLE_FAN);
  vertex(x, z, y);
  for(float angle=0; angle<=PI*2+0.1; angle+=0.1){
    vertex(x+r*cos(angle), z, y+r*sin(angle));
  }
  endShape(CLOSE);
}
void mouseDragged(){
  if(mouseButton==CENTER) rotCake += (mouseX-pmouseX);
  if(mouseButton==LEFT){
    PVector p = pt.get(pt.size()-1);
    p.x +=  mouseX-pmouseX;
    p.z += mouseY-pmouseY;
  }
}
ArrayList<PVector> pt = new ArrayList<PVector>();
void mousePressed(){
  if(mouseButton==LEFT) pt.add(new PVector(0,-50,0));
  if(mouseButton==RIGHT && pt.size()>0) pt.remove(pt.size()-1);
}
