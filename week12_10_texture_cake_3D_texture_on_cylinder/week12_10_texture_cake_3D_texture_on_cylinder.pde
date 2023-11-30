//圓柱的貼圖, 上面的圓形, 旁邊的長方形
PImage imgCakeSide, imgCakeTop;
void setup(){
  size(500,400, P3D);
  imgCakeSide = loadImage("cakeSide.jpg");
  imgCakeTop = loadImage("cakeTop.jpg");
}
void draw(){
  camera( 300,-400,-400, 0,0,0, 0,1,0);
  background(#FFFFF2);
  beginShape(TRIANGLE_FAN);
  noStroke();
  texture(imgCakeTop);
  for(float a=0; a<PI*2+0.1; a+=0.1){
    float x = 150*cos(a), z = 150*sin(a), y = -80;
    vertex(x, y, z, 121+95*cos(a), 93+95*sin(a));
  }
  endShape(CLOSE);

  beginShape(TRIANGLE_STRIP);
  texture(imgCakeSide);
  noStroke();
  for(float a=0; a<PI*2+0.1; a+=0.1){
    float x = 150*cos(a), z = 150*sin(a), y = 80;
    vertex(x, y, z, a*311/PI/2, 161);
    vertex(x, y-160, z, a*311/PI/2, 0);
  }
  endShape();
}
