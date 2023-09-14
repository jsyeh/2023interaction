//互動模式 Interactive Mode (Active Mode)
//大一大二學 int main() {...}
void setup(){ //設定
  size(500,500);
  background(255); //改白色背景 背景(255);
}

void draw(){ //畫圖 每秒畫60次
  if(mousePressed) { //如果 mouse有按下去的話
    line(mouseX,mouseY,pmouseX,pmouseY);
  }//畫線(滑鼠座標mouseX,mouseY, 到之前滑鼠座標pmouseX,pmouseY);
}

int w=1;
void keyPressed(){
  if(key=='1') stroke(255, 0, 0); //如果按下數字1 就筆觸是紅色
  if(key=='2') stroke(0, 255, 0); //如果按下數字2 就筆觸是綠色
  if(key=='3') stroke(0, 0, 255); //如果按下數字3 就筆觸是藍色
  if(key=='s'||key=='S') save("output.png"); //如果按下s鍵,就存檔output.png
  if(key=='+') strokeWeight(++w);
  if(key=='-') strokeWeight(--w);
  println(w);
}
