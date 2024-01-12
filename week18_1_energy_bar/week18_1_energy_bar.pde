//能量條 20格
void setup(){
  size(600,500);
}
int energy=5;
void draw(){
  background(0);
  for(int i=0; i<energy; i++){
    fill(255,0,0); rect(25+i*25, 25, 25,25);
  }
}
void keyPressed(){
  energy += 1;
}
