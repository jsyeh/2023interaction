ArrayList<Integer> deck1 = new ArrayList<Integer>();
ArrayList<Integer> deck2 = new ArrayList<Integer>();
ArrayList<Integer> deck3 = new ArrayList<Integer>();
void setup(){
  size(600,400);
  for(int i=0; i<7; i++){
    deck1.add( int(random(13)) );
  }
  for(int i=0; i<6; i++){
    deck2.add( int(random(13)) );
  }
}
void draw(){
  background(#FFFFF2);
  for(int i=0; i<deck1.size(); i++){
    fill(255); rect(450, i*10, 50, 50);
    fill(0); text( ""+deck1.get(i), 475, i*10+25, 25);
  }
  for(int i=0; i<deck2.size(); i++){
    fill(255); rect(350, i*10, 50, 50);
    fill(0); text( ""+deck2.get(i), 375, i*10+25, 25);
  }
}
