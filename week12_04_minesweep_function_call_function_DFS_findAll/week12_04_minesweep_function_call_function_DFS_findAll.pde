//踩地雷: 深度優先搜尋/廣度優先搜尋 DFS/BFS
color [] c = { #FFFFFA, #5A5757, #E5C18C, #FFFFFF, #FFF8C5, #FFE9FF};
boolean [][] open = new boolean[28][20]; //false沒打開, true打開
void openAll(int i , int j){
  if(i<0 || j<0 || i>=28 || j>=20) return; //範圍外,不處理
  if(open[i][j]==true) return; //已經開的,不處理
  
  if(dog[i][j]!=0) return ; //0才開, 所以不是0就不開, 不處理
  
  open[i][j] = true;
  openAll(i-1,j);
  openAll(i,j-1);
  openAll(i,j+1);
  openAll(i+1,j);
}
int [][] dog = {
  {0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0},
  {0,0,1,2,1,0,0,0,0,0,0,0,0,0,0,1,2,1,0,0},
  {0,0,1,2,2,1,0,0,0,0,0,0,0,0,1,2,2,1,0,0},
  {0,0,1,2,2,2,1,0,0,0,0,0,0,1,2,2,2,1,0,0},
  {0,0,1,2,2,2,2,1,0,0,0,0,1,2,2,2,2,1,0,0},
  {0,0,1,2,2,2,2,2,1,1,1,1,2,2,2,2,2,1,0,0},
  {0,0,1,1,2,2,2,2,2,3,3,2,2,2,2,2,1,1,0,0},
  {0,0,1,2,2,2,2,3,3,3,3,3,3,2,3,3,3,1,0,0},
  {0,1,3,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,1,0},
  {0,1,3,3,2,1,1,1,1,3,3,1,1,1,1,3,3,3,1,0},
  {0,1,3,1,1,1,2,2,2,2,2,2,2,2,1,1,1,3,1,0},
  {0,0,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,0,0},
  {0,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,0},
  {1,1,2,2,4,4,4,1,1,2,2,1,1,4,4,4,2,2,1,1},
  {1,2,2,4,4,4,4,3,1,1,1,1,3,4,4,4,4,2,2,1},
  {1,2,4,4,3,3,3,3,3,1,1,3,3,3,3,3,4,4,2,1},
  {1,4,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,1},
  {1,4,3,3,3,3,3,3,3,5,5,3,3,3,3,3,3,3,4,1},
  {1,4,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,1},
  {1,4,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,1},
  {1,4,4,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,1},
  {1,2,4,4,3,3,3,3,3,3,3,3,3,3,3,3,4,4,2,1},
  {0,1,2,2,3,3,3,3,3,1,1,3,3,3,3,3,2,2,1,0},
  {0,0,1,2,2,3,3,3,3,1,1,3,3,3,3,2,2,1,0,0},
  {0,0,0,1,2,2,2,3,1,0,0,1,3,2,2,2,1,0,0,0},
  {0,0,0,0,1,3,2,1,0,0,0,0,1,2,3,1,0,0,0,0},
  {0,0,0,0,1,3,3,1,0,0,0,0,1,3,3,1,0,0,0,0},
  {0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0}};

void setup(){
  size(800,800);
  println(dog.length);
  println(dog[0].length);
}
int x=400, y=700;
void draw(){
  background(#FFFFFA);
  for(int i=0; i<dog.length; i++){
    for(int j=0; j<dog[0].length; j++){
      if(open[i][j]) fill(255);
      else fill(128);
      rect(200+j*20, 100+i*20, 20, 20);
      fill(0); text(""+dog[i][j], 200+j*20+10, 100+i*20+10);
    }
  }
  x = mouseX;
  y = mouseY;
  //int ii = findI(y), jj=findJ(x);
  //fill(255,0,0,128); rect(200+jj*20, 100+ii*20, 20, 20);
  //if(ii>=0 && ii<28 && jj>=0 && jj<20) dog[ii][jj]=0;
  
}
void mousePressed(){
  int i = findI(mouseY), j = findJ(mouseX);
  if(i>=0 && i<28 && j>=0 && j<20)  openAll(i,j); //open[i][j] = true;
}
int findI(int y){
  return (y-100)/20;
}
int findJ(int x){
  return (x-200)/20;
}
