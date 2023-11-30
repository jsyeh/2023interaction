//躲球
ArrayList<PVector> ball = new ArrayList<PVector>();
ArrayList<PVector> vv = new ArrayList<PVector>();
void setup(){
  size(400,400);
  ball.add(new PVector(200,200) );
  vv.add(new PVector(random(-2,+2), random(-2,+2)) );
}
void draw(){
  background(0);
  for(int i=0; i<ball.size(); i++){
    PVector p = ball.get(i), v = vv.get(i);
    ellipse(p.x, p.y, 8, 8);
    p.add( v );
    if(p.x<0 || p.x>400) { v.x = -v.x; ball.add(new PVector(200,200)); vv.add(new PVector(random(-2,+2), random(-2,+2)) );}
    if(p.y<0 || p.y>400) { v.y = -v.y; ball.add(new PVector(200,200)); vv.add(new PVector(random(-2,+2), random(-2,+2)) );}
  }
}
