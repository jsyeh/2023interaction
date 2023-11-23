PImage imgRack;
void setup(){
  size(300,300);
  imgRack = loadImage("rack.jpg");
}
boolean gameOver=false;
void keyPressed(){
  gameOver = true; //在某個狀態下 game over, 要暫停
}
void draw(){
  background(255);
  image(imgRack, 0, 0);
  if(flying){
    if( ! gameOver ) {//if( ! keyPressed ){
      x += vx; //反過來說, 沒有 game over 就會動
      y += vy;
      vy += 0.98;
    }
  }else{
    x = mouseX;
    y = mouseY;
    if(mousePressed){
      fill(255); ellipse(posX, posY, 20, 20);
      line(posX, posY, x, y);
    }
  }
  fill(#FFA652); ellipse(x, y, 20, 20);
}
boolean flying = false;
float x, y, vx, vy;
float posX = -100, posY = -100;
void mousePressed(){
  x = posX = mouseX;
  y = posY = mouseY;
  flying = false;
}
void mouseReleased(){
  vx = posX-mouseX;
  vy = posY-mouseY;
  flying = true;
}
