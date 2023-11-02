Box box1, box2, box3;
void setup(){
  size(400,400);
  box1 = new Box(100, 150, 20, 20);
  box2 = new Box(200, 150, 20, 20);
  box3 = new Box(300, 150, 20, 20);
}
float marioX=50, marioY=250, vx=0, vy=0;
void draw(){
  background(108,137,255);
  marioX += vx;
  if(flying){ //如果在飛行中
    marioY += vy; //上下的位置會改變
    vy += 0.98; //重力加速度往下
    if(marioY >= 250){ //碰到地板
      marioY = 250; //站在地板上
      flying = false; //不再飛行
    }
  }
  fill(255,0,0); ellipse(marioX, marioY, 15,20);
  fill(229,119,42); rect(0, 260, 400, 150);
  box1.drawAndTest();
  box2.drawAndTest();
  box3.drawAndTest();
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
boolean flying = false; //一開始,沒有在飛!!!
void keyPressed(){
  if(keyCode==RIGHT) vx = 2;
  if(keyCode==LEFT) vx = -2;
  if(keyCode==UP && flying==false){ //如果沒有在飛的話,才能飛
    vy = -20;
    flying = true; //開始飛行
    box1.stand_on_me = false; //現在有2個變數,都要處理!
    box2.stand_on_me = false; //現在有2個變數,都要處理!
    box3.stand_on_me = false; //現在有2個變數,都要處理!
  }//小心大括號!!!
}
void keyReleased(){
  if(keyCode==LEFT || keyCode==RIGHT) vx = 0;
}
