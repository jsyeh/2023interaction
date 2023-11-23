int state = 0; //0: white, 1: red, 2: blue
void setup(){
  size(400,400);
}
void draw(){
  if(state==0){ //第0關,白色
    background(255);
    
  }else if(state==1){ //第1關,紅色
    background(255,0,0);
    
  }else if(state==2){ //第2關,藍色
    background(0,0,255);
    
  }
}
