//想要讓視窗變大一些
void setup(){
  size(300,300,P2D);
  surface.setResizable(true); //第2種方法,可以在視窗右下角縮放它
}
void draw(){
  //if(frameCount/60%2==0) windowResize(300,300);
  //else windowResize(500,500); //第1種方法,可以呼叫 windowResize()
  background(255,255,0);  
}
int W = 300;
void mousePressed(){
  if(mouseButton==LEFT && W>100) W -= 100;
  if(mouseButton==RIGHT) W += 100;
  windowResize(W,300); //第1種方法,可以呼叫 windowResize()
  background(255,255,0);
}
