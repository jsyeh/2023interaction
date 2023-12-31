ArrayList<Integer> deck = new ArrayList<Integer>();
void setup(){
  size(600,400);
  for(int i=0; i<13; i++){
    deck.add( int(random(13)) );
  }
}
void draw(){
  background(#FFFFF2);
  //for(Integer i : deck){
  for(int i=0; i<deck.size(); i++){
    fill(255); rect(50, i*10, 50, 50);
    fill(0); text( ""+deck.get(i), 75, i*10+25, 25);
  }
}
