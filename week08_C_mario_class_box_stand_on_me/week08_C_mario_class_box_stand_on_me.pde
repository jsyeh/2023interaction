Box [] box = new Box[6];
void setup(){
  size(500,400);
  box[0] = new Box(0, 270, 400, 200); //floor
  for(int i=1; i<5; i++){
    box[i] = new Box(i*80, 150, 20, 20);
  }
}
float marioX=50, marioY=200, vx=0, vy=0;
void draw(){
  background(108,137,255);
  marioX += vx;
  if(flying){ //如果在飛行中
    marioY += vy; //上下的位置會改變
    vy += 0.98; //重力加速度往下
    //if(marioY >= 250){ //碰到地板
    //  marioY = 250; //站在地板上
    //  flying = false; //不再飛行
    //}
    if(marioY >= 400){
      marioX=50; marioY=200; vx=0; vy=0;
    }
  }
  fill(255,0,0); ellipse(marioX, marioY, 15,20);
  //fill(229,119,42); rect(0, 260, 400, 150);
  for(int i=0; i<5; i++){
    box[i].drawAndTest();
  }
}
class Box{
  boolean stand_on_me;
  int x, y, w, h;
  Box(int _x, int _y, int _w, int _h){
    stand_on_me = false;
    x = _x;
    y = _y;
    w = _w;
    h = _h;
  }
  void drawAndTest(){
    fill(229,119,42); rect(x, y, w, h);
    if(hitBox(x, y, w, h)){
      if(vy>0){
        marioY = y-10;
        flying = false;
        stand_on_me = true;
      }else{
        vy = 0;
        marioY = y+h+10;
      }
    }
    if(stand_on_me==true && flying==false && leaveBox(x, y, w, h)){
      stand_on_me = false;
      flying = true;
      vy = 0;
    }  
  }
}
boolean leaveBox(int x, int y, int w, int h){
  if(x-7>marioX || marioX>x+w+7) return true;
  else return false;
}
boolean hitBox(int x, int y, int w, int h){
  if(x-7<marioX && marioX<x+w+7 && y-10<marioY && marioY<y+h+10) return true;
  else return false;
}
boolean flying = true; //一開始,沒有在飛!!!
void keyPressed(){
  if(keyCode==RIGHT) vx = 2;
  if(keyCode==LEFT) vx = -2;
  if(keyCode==UP && flying==false){ //如果沒有在飛的話,才能飛
    vy = -20;
    flying = true; //開始飛行
    for(int i=0; i<5; i++){
      box[i].stand_on_me = false; //現在有2個變數,都要處理!
    }
  }//小心大括號!!!
}
void keyReleased(){
  if(keyCode==LEFT || keyCode==RIGHT) vx = 0;
}
