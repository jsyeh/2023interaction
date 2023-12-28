//娃娃的2種色彩(眼、髮) 頭、眼、髮、衣 要能獨立
color [] c = {#000000, #000000};
//PImage [] c = {img1, img2, img3, img4, img5};
int ci = -1;
color [] p = {#000000, #004E9F, #A6887E, #F4F082};
void setup(){
  size(400, 400);
}
int pi;
void draw(){
  background(#FFFFF2);
  for(int i=0; i<4; i++){
    fill(p[i]);
    rect( 300, 50+i*40, 40, 40);
  }
  fill(p[pi]); //調色盤選的色
  ellipse(320, 300, 40, 40); //右邊調色盤選的色
  
  fill(c[1]); //頭髮 c[1]
  ellipse(200, 100, 100, 100);
  rect(50, 40, 50, 50);
  
  fill(#FFFFF0); //臉
  ellipse(200, 120, 90, 90);
  
  fill(c[0]); //眼睛 c[0]
  ellipse(185, 110, 20, 15);
  ellipse(215, 110, 20, 15);
  rect(50,100, 50, 50);
}
boolean testMouse(float x, float y, float w, float h){
  return x<mouseX && mouseX<x+w && y<mouseY && mouseY<y+h;
}
void mousePressed(){
  for(int i=0; i<4; i++){
    if( testMouse(300, 50+i*40, 40, 40) ){
      pi = i;
      if(ci != -1) c[ci]= p[pi];
    }
  }
  if( testMouse(50, 100, 50, 50) ) ci = 0;
  if( testMouse(50, 40, 50, 50) ) ci = 1;
}
