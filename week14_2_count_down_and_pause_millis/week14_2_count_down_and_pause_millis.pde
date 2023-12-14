//有個計時器, 暫停後, 要繼續剛剛的時間, 而不重設的時間
void setup(){
  size(400,400);
}
int C=10;
int T=C*1000, startT=-1, pauseT=0;
int state=0; //0: countdown, 1: pause
void draw(){
  println(startT);
  if(state==1){
    if(startT==-1) startT = millis();
    background(#FFFFF2);
    fill(0); textSize(30); text(""+int((T+999)/1000), 100,200);
    if(T>0) T=C*1000-(millis()-startT);
  }else if(state==0){
    background(#FFFF00);
    text("Pause", 100,200);
  }
}
void mousePressed(){
  if(state==1) pauseT = millis();
  else if(state==0 && startT!=-1) startT= startT+(millis()-pauseT);
  state = 1-state;
}
