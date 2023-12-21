//Parkour跑酷的背景會往左邊一直移動
PImage [] img = new PImage[3];
void setup(){
  size(300,300);
  img[0] = loadImage("bg.png");
  img[1] = loadImage("bg2.png");
  img[2] = loadImage("bg3.png");
}
float x = 0;
void draw(){
  image(img[0], x, 0);
  image(img[1], x+1243, 0);
  image(img[2], x+1243+1243, 0);
  image(img[0], x+1243+1243+1243, 0);
  x-=7;
  if(x<-1243-1243-1243) x = 0;
}
