//隨機生成怪物,碰到怪物時,要跳到戰鬥畫面。
ArrayList<PVector> monster = new ArrayList<PVector>();
void setup(){
  size(600,400);
}
float x = 300, y = 200, vx=0, vy=0;
int state=0;
void draw(){
  if(state==0){
    background(#FFFFF2);
    for(PVector p : monster){
      fill(255,0,0); ellipse(p.x, p.y, 50, 50);
      if(dist(x,y,p.x,p.y)<50) state=1;
    }
    x += vx;
    y += vy;
    fill(0,255,0); ellipse(x, y, 50,50);
  }else if(state==1){
    background(0);
    fill(0,255,0); ellipse(150,200, 100,150);
    fill(255,0,0); ellipse(450,200, 100,150);
  }
}
void mousePressed(){
  monster.add( new PVector(random(600),random(400)) );
}
void keyPressed(){
  if(keyCode==LEFT) vx = -1;
  if(keyCode==RIGHT) vx = +1;
  if(keyCode==UP) vy = -1;
  if(keyCode==DOWN) vy = +1;
}
void keyReleased(){
  if(keyCode==LEFT||keyCode==RIGHT) vx = 0;
  if(keyCode==UP||keyCode==DOWN) vy = 0;
}
