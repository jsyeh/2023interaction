int [][]map = new int[3][3];//number 0,1...8
int [][]mine = new int[3][3];//1: mine here!
int [][]flag = new int[3][3];//mouse click it!//踩地雷的旗子
boolean [][]open = new boolean[3][3]; 
void setup(){
  size(300,300,P2D);
  mine[1][2] = 1;
}
void draw(){
  background(128);
  for(int i=0; i<3; i++){
    for(int j=0; j<3; j++){
      fill(255); rect(j*100,i*100, 100,100);
      if(flag[i][j]==1){fill(255,0,0); triangle(50+j*100, 50+i*100, j*100, i*100, j*100, 100+i*100); }
      else if(open[i][j] && mine[i][j]==1){ fill(0); ellipse(50+j*100, 50+i*100, 50,50); }
      else if(open[i][j]){fill(0); text(""+map[i][j], 50+j*100, 50+i*100); }
    }
  }
}
void mousePressed(){
  int i = (mouseY/100), j = (mouseX/100);
  if(mouseButton==LEFT) open[i][j] = true;
  else flag[i][j] = 1;
}
