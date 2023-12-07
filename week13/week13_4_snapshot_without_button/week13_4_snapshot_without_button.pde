//捏臉,要存圖時, 不要連button都存起來。
void setup(){
  size(400, 400);
}
boolean saving=false;
void draw(){
  background(#FFFFF2);
  ellipse( 200, 100, 100, 100);
  ellipse( 200, 200, 200, 200);
  if(saving==false) rect(300, 350, 80, 40);
}
void keyPressed(){
  if(key=='s'){
    saving=true;
    draw();
    saveFrame();
    saving=false;
  }
}
