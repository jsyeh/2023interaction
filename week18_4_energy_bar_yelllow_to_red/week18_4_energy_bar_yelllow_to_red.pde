class Player{
  int x, y, w, h, energy;
  Player(int _x, int _y, int _w, int _h){
    x = _x;  y = _y; w = _w; h = _h; energy = 5;
  }
  void drawEnergy(int dx){ //能量條 20格
    if(energy>7) fill(255,0,0);
    else fill(255,255,0);
    for(int i=0; i<energy; i++){ //energy 一開始黃色,但>7變紅色
      if( dx==+1 ){ rect(x + 25 + i*25, 25, 25, 25); }
      if( dx==-1 ){ rect(x + w - 50 -i*25, 25, 25, 25); }
    }
  }
}
Player player1 = new Player(0, 0, 300, 250);
Player player2 = new Player(300, 0, 300, 250);
void setup(){
  size(600,500);
}
void draw(){
  background(0);
  player1.drawEnergy(+1);
  player2.drawEnergy(-1);
}
void mousePressed(){
  if(mouseButton==LEFT) player1.energy += 1;
  if(mouseButton==RIGHT) player2.energy += 1;
}
