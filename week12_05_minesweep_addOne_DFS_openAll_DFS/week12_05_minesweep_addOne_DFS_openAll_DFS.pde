void openAll(int i , int j){
  if(i<0 || j<0 || i>=20 || j>=20) return; //範圍外,不處理
  if(open[i][j]==true) return; //已經開的,不處理
  
  //if(mine[i][j]!=0) return ; //0才開, 所以不是0就不開, 不處理
  
  open[i][j] = true;
  if(mine[i][j]==0){
    openAll(i-1,j);
    openAll(i,j-1);
    openAll(i,j+1);
    openAll(i+1,j);
  }
}
void addOne(int i, int j){
  if(i<0 || j<0 || i>=20 || j>=20) return; //範圍外,不處理
  if(mine[i][j]==9) return ; //都是地雷了, 就不用再+1
  mine[i][j]++;
}
void setup(){
  size(400,400);
  for(int k=0; k<40; k++){
    int i=int(random(20)), j=int(random(20));
    mine[i][j] = 9;
    addOne(i-1,j-1);
    addOne(i-1,j);
    addOne(i-1,j+1);
    addOne(i,j-1);
    addOne(i,j+1);
    addOne(i+1,j-1);
    addOne(i+1,j);
    addOne(i+1,j+1);
  }
}
boolean [][] open = new boolean[20][20]; //false
int [][] mine = new int[20][20]; //0
void draw(){
  for(int i=0; i<20; i++){
    for(int j=0; j<20; j++){
      if(open[i][j]) fill(255);
      else fill(128);
      rect(j*20, i*20, 20, 20);
      if(mine[i][j]==0) continue;
      
      textAlign(CENTER,CENTER);
      textSize(16); fill(0,0,255); text(""+mine[i][j], j*20+10, i*20+10);
    }
  }
}
void mousePressed(){
  int i = mouseY/20, j = mouseX/20;
  openAll(i,j);
}
