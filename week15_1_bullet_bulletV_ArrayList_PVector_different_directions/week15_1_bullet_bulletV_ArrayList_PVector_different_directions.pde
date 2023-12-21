//子彈要能向著"不同"方向==每個子彈要有自己的方向
ArrayList<PVector> bullet = new ArrayList<PVector>();
ArrayList<PVector> bulletV = new ArrayList<PVector>(); //!!!!!
void setup(){
  size(500,500);
}
float x=250, y=450, vx=0, vy=-1;
void draw(){
  background(0);
  ellipse(x,y,40,40);
  for(int i=0; i<bullet.size(); i++){ //for(PVector p: bullet){
    PVector p = bullet.get(i);
    p.add( bulletV.get(i) );
    ellipse(p.x, p.y, 8, 8);
  }
}
void keyPressed(){
  if(key==' '){
    bullet.add( new PVector(x, y) );
    bulletV.add( new PVector(vx,vy) );
  }
  if(keyCode==LEFT) { vx=-1; vy=0; }
  if(keyCode==UP) { vx=0; vy=-1; }
}
