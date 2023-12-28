//娃娃往左選、往右選
color [] p = {#000000, #004E9F, #A6887E, #F4F082, #FF0000};
void setup(){
  size(400, 400);
}
int selectI = 0;
void draw(){
  background(#FFFFF2);
  for(int i=0; i<5; i++){
    fill( p[i] );
    rect(i*80, 0, 80, 80);
  }
  fill( p[selectI] );
  ellipse(200, 300, 100, 100);
}
void keyPressed(){
  if(keyCode==RIGHT) selectI = (selectI + 1) % 5;
  if(keyCode==LEFT) selectI = (selectI - 1 + 5) % 5;
}
