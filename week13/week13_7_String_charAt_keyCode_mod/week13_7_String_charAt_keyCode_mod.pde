//很長的字串、跑馬燈
String line = "12312354321";
void setup(){
  size(500, 300);
}
int lineI = 0;
void draw(){
  background(#FFFFF2);
  fill(0);
  textSize(60);
  text(line, 70,70);
  text( line.charAt(lineI), 200, 200);
}
void keyPressed(){
  if(keyCode==RIGHT) lineI = (lineI + 1) % line.length();
}
