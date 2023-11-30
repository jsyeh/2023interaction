PImage img;
void setup(){
  size(400,400);
  img = loadImage("ball.png");
  imageMode(CENTER);
}
void draw(){
  background(#FFaFF2);
  image(img, mouseX, mouseY, 250,250);
}
