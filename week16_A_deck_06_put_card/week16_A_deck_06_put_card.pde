ArrayList<ArrayList<Integer>> decks = new ArrayList<ArrayList<Integer>>();
void setup() {
  size(600, 400);
  for (int i=0; i<7; i++) {
    ArrayList<Integer> deck = new ArrayList<Integer>();
    for (int k=0; k<=i; k++) {
      deck.add( int(random(13)) );
    } //第i個牌堆，第k張牌
    decks.add( deck );
  }
}
void draw() {
  background(#FFFFF2);
  for (int i=0; i<decks.size(); i++) {
    ArrayList<Integer> deck = decks.get(i);
    for (int k=0; k<deck.size(); k++) {
      if(pressedI == i && k==deck.size()-1) continue; 
      fill(255); rect(200 + i*50, 150+k*20, 40, 50); //x:100 + L * 50;
      if(k==deck.size()-1){
        fill(0); text( ""+deck.get(k), 200+i*50+25, 175+k*20); //y: 50 + k * 30;
      }
    }
  }
  if(pressedI!=-1){
    int i = pressedI, k = (decks.get(i).size()-1);
    fill(255,255,0);
    rect(200 + i*50 + dx, 150+k*20 + dy, 40, 50);
    fill(0); text( ""+decks.get(i).get(k), 200+i*50+25+dx, 175+k*20+dy);
  }
}
void mouseDragged(){
  dx += mouseX-pmouseX;
  dy += mouseY-pmouseY;
}
int pressedI = -1, dx=0, dy=0;
boolean insideCard(int x, int y, int w, int h){
  if(x<mouseX && mouseX<x+w && y<mouseY && mouseY<y+h){
    return true;
  }
  return false;
}
void mousePressed(){
  for (int i=0; i<decks.size(); i++) {
    int k = decks.get(i).size()-1;
    if(insideCard(200 + i*50, 150+k*20, 40, 50)){
      pressedI = i;
      return;
    }
  }
  pressedI = -1;
}
void mouseReleased(){
  for(int i=0; i<7; i++){
    int x = 200+i*50;
    if(x<mouseX && mouseX<x+40) {
      int kk = decks.get(pressedI).size()-1;
      decks.get(i).add( decks.get(pressedI).get(kk) );
      decks.get(pressedI).remove(kk);
    }
  }
  pressedI = -1;
  dx=0; dy=0;
}
