class Player{
  int x, y, energy;
  Player(int _x, int _y){
    x = _x;  y = _y; energy = 5;
  }
  void drawEnergy(){ //能量條 20格
    for(int i=0; i<energy; i++){
      fill(255,0,0); rect(x + 25+i*25, 25, 25,25);
    }
  }
}
Player player1 = new Player(0, 0);
Player player2 = new Player(300, 0);
void setup(){
  size(600,500);
}
void draw(){
  background(0);
  player1.drawEnergy();
  player2.drawEnergy();
}
