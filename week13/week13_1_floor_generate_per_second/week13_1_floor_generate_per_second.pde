ArrayList<PVector> floor = new ArrayList<PVector>();
void setup(){
  size(400,600);
  floor.add( new PVector(random(100,200),200) );
  floor.add( new PVector(random(100,200),300) );
  floor.add( new PVector(random(100,200),400) );
  floor.add( new PVector(random(100,200),500) );
}
void draw(){
  background(0);
  for(PVector p : floor){
    rect(p.x, p.y, 100, 30);
    p.y-=1;
  }
  if(floor.get(0).y<-30) floor.remove(0);
  
  if(frameCount%100==1){
    floor.add( new PVector(random(100,200),600) );
  }
}
