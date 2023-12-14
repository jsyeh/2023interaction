//有個計時器, 暫停後, 要繼續剛剛的時間, 而不重設的時間
void setup(){
  size(400,400);
}
int T=5*60;
int state=0; //0: countdown, 1: pause
void draw(){
  if(state==0){
    background(#FFFFF2);
    fill(0); textSize(30); text(""+int((T+59)/60), 100,200);
    if(T>0) T--;
  }else if(state==1){
    background(#FFFF00);
    text("Pause", 100,200);
  }
}
void mousePressed(){
  state = 1-state;
}
