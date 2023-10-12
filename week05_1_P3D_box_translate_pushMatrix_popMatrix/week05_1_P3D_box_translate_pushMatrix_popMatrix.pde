void setup(){
  size(400,400, P3D); //Processing 的 3D功能
}
void draw(){
  background(#FFFFF2); //老師喜歡的鵝黃色
  pushMatrix(); //備份矩陣
    translate(mouseX, mouseY); //移動
    box(100); //3D的盒子、方塊
  popMatrix(); //還原矩陣
}
