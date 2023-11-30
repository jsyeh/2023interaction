PImage dog;
void setup() {
  size(400, 400, P3D);
  dog = loadImage("dog.png");
}
void draw() {
  beginShape();
  texture(dog);
  vertex(40, 80, 0, 0);
  vertex(320, 20, 500, 0);
  vertex(380, 360, 500, 600);
  vertex(160, 380, 0, 600);
  endShape();
}
void mouseDragged(){
  dog.loadPixels();
  for(int i=0; i<20; i++){
    for(int j=0; j<20; j++){
      dog.pixels[(mouseY+i)*dog.width+mouseX+j] = color(0,255,0);
    }
  }
  dog.updatePixels();
}
void keyPressed(){
  dog.loadPixels();
  for(int i=0; i<dog.width*dog.height; i++){
    dog.pixels[i] = color(255,0,0);
  }
  dog.updatePixels();
}
