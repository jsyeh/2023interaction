//接龍的翻牌、移牌
float []cardX = new float[52];
float []cardY = new float[52];
int []cardI = new int[52];
int N = 0;
void setup(){
  size(600,300);
  for(int i=0; i<52; i++) cardI[i] = i;
  for(int i=0; i<20000; i++){
    //洗牌、交換
  }
  int now = 0;
  for(int L= 1; L<=7; L++){ //1,2,3,4,5,6,7
    for(int k=0; k<L; k++){
      cardX[now] = 100 + L * 50;
      cardY[now] = 50 + k * 30;
      now++;
    }
  }
  N = now;
}
void draw(){
  background(#FFFFF2);
  for(int i=0; i<N; i++) {
    if(i==pressedI) fill(255,0,0);
    else fill(255);
    drawCard(i);
  }
  fill(255); rect(50, 50, 40, 60);
}
void drawCard(int i){
  rect(cardX[i], cardY[i], 40, 60);
  int num = i%13 + 1, c = i/13 % 4;
  textSize(20); textAlign(CENTER);
  if( c==1 || c==2) fill(255,0,0);
  else fill(0); 
  String word = "" + num;
  if(num==11) word = "J";
  if(num==12) word = "Q";
  if(num==13) word = "K";
  text(word, cardX[i]+20, cardY[i]+34); 
}
int pressedI = -1;
float oldX, oldY;
void mousePressed(){
  for(int i=0; i<52; i++){
    if(cardX[i]<mouseX&&mouseX<cardX[i]+40&&cardY[i]<mouseY&&mouseY<cardY[i]+60){
      pressedI = i;
      oldX = cardX[i];
      oldY = cardY[i];
    }
  }
  if(50<mouseX&&mouseX<50+40&&50<mouseY&&mouseY<50+60){ //50, 50, 40, 60);
    cardX[N] = 100;
    cardY[N] = 50+s;
    s+= 8;
    N++;  
  }
}
int s = 0;
void mouseDragged(){
  if(pressedI!=-1){
    cardX[pressedI]+= mouseX-pmouseX;
    cardY[pressedI]+= mouseY-pmouseY;
  }
}
void mouseReleased(){
  if(pressedI!=-1){
    cardX[pressedI] = oldX;
    cardY[pressedI] = oldY;
  }
  pressedI = -1;
}
