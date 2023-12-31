ArrayList<ArrayList<Integer>> decks = new ArrayList<ArrayList<Integer>>();
void setup() {
  size(600, 400);
  for (int i=0; i<7; i++) {
    ArrayList<Integer> deck = new ArrayList<Integer>();
    for (int k=0; k<=i+3; k++) {
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
      fill(255); rect(200 + i*50, 150+k*20, 40, 50); //x:100 + L * 50;
      if(k==deck.size()-1){
        fill(0); text( ""+deck.get(k), 200+i*50+25, 175+k*20); //y: 50 + k * 30;
      }
    }
  }
}
