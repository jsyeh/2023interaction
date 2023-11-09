PImage img;
//Y: 443, 477, 511
int [][]keyPos={{80,477},{234,511},{165,511},{149,477},{139,443},{182,477},{216,477},{250,477},{309,443},{286,477},{319,477},{353,477},{302,511},{268,511},{346,443},{378,443},{70,443},{174,443},{114,477},{207,443},{276,443},{203,511},{103,443},{131,511},{243,443},{97,511}};
boolean [] pressed = new boolean[26];
void setup(){
  size(800, 600);
  img = loadImage("keyboard.png");
}
void draw(){
  background(#FFFFF2);
  image(img, 0, height-266);
  //rect(mouseX,mouseY, 25, 25);
  fill(128,128,255,128);
  for(float x=55; x<=433; x+=34.3) rect(x, 409, 25, 27, 5);
  for(float x=71; x<=448; x+=34.2) rect(x, 443, 25, 27, 5);
  for(float x=80; x<=458; x+=34.3) rect(x, 477, 25, 27, 5);
  for(float x=97; x<=406; x+=34.22) rect(x, 511, 25, 27, 5);
  for(int i=0; i<26; i++){
    fill(255,0,0,128);
    if(pressed[i]) rect(keyPos[i][0], keyPos[i][1], 25, 27, 5);
  }
  fill(0,255,0,128);
  rect(mouseX-25+dx, mouseY-27+dy, 25, 27, 5);
}
int dx=0, dy=0;
void mouseMoved(){
  dx=0;
  dy=0;
}
void mousePressed(){
  println(mouseX-25, mouseY-27);
}
void keyPressed(){
  //println(key, keyCode);
  if(keyCode==LEFT) dx--;
  if(keyCode==RIGHT) dx++;
  if(keyCode==UP) dy--;
  if(keyCode==DOWN) dy++;
  println(mouseX-25+dx, mouseY-27+dy);
  if(key>='a'&&key<='z')  pressed[key-'a']=true;
}
void keyReleased(){
  if(key>='a'&&key<='z')  pressed[key-'a']=false;
}

/*
//Y: 409, 443, 477, 511
// backquote 21 ,409
//X-1: 55, 89, 123, 157, ...431
//X-q: 71, 105, ... 447
//X-a: 80, 114, ... 456
//X-z: 97, 131, ... 405

左邊shift: 22, 511 - 62, 511
右邊shift: 439, 511 - 497, 511

space: 148, 545 - 327, 545
*/
