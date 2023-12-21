//黃色的小精靈
ArrayList<PVector> reddot = new ArrayList<PVector>(); //x,y
ArrayList<PVector> block = new ArrayList<PVector>(); //x,y
ArrayList<PVector> blockWH = new ArrayList<PVector>(); //w,h
void setup(){
  size(800,600);
  for(int x=100; x<=700; x+=100){
    for(int y=100; y<=500; y+=100){
      reddot.add(new PVector(x,y));      
    }
  }
}
void draw(){
  background(255);
  for(int i=0; i<reddot.size(); i++){ //for(PVector red : reddot){
    PVector red = reddot.get(i);
    fill(255,0,0); ellipse(red.x, red.y, 30, 30);
    if( dist(x,y, red.x, red.y)<30 ){
      reddot.remove(i);
    }
  }
  drawPacMan();
}
int x = 100, y = 100, dir = 0;
int [] dx = {+1, 0, -1, 0};
int [] dy = {0, +1, 0, -1};
void drawPacMan(){
  fill(255,255,0);
  // 0...30...60 => -30...0...+30 =>/30 => -1...0...+1 => 1-?? => 0...1...0
  float r = 1-abs((frameCount%60-30)/30.0), dd = dir*PI/2;//方向的改角度
  arc(x, y, 80, 80, dd+r, dd+PI*2-r, PIE);
  x += dx[dir];
  y += dy[dir];
}
void keyPressed(){
  if(keyCode==RIGHT) dir = 0;
  if(keyCode==DOWN) dir = 1;
  if(keyCode==LEFT) dir = 2;
  if(keyCode==UP) dir = 3;
}
