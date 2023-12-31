ArrayList<PVector> pt = new ArrayList<PVector>();
void setup(){
  size(400,400);
  for(int i=0; i<10; i++){
    pt.add( new PVector(random(400),random(400)) );
  }
}
void draw(){
  background(0);
  for( PVector p : pt ){
    ellipse(p.x, p.y, 20, 20);
  }
}
