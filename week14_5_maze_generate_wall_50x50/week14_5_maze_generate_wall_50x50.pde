//產生地圖maze的方法
int [][] maze = new int[50][50];
boolean [][] visited = new boolean[50][50];
boolean testVisible(int i, int j){ //true: nothing
  if(i<0 || j<0 || i>=50 || j>=50) return true;
  return visited[i][j]; //false 要用它 doing something
}
int [][] wallH = new int[50][49];
int [][] wallW = new int[49][50];
void genMaze2(int i, int j, int ii, int jj){
  if(i==ii) wallH[i][min(j,jj)] = 1;
  if(j==jj) wallW[min(i,ii)][j] = 1;
  genMaze(ii,jj);
}
void genMaze(int i, int j){
  //if(i==9&&j==9) return;
  visited[i][j] = true;
  println(i,j);
  while(true){
    if(testVisible(i+1, j)==false && int(random(2))==0) {genMaze2(i,j,i+1,j);}
    if(testVisible(i-1, j)==false && int(random(2))==0) {genMaze2(i,j,i-1,j);}
    if(testVisible(i, j+1)==false && int(random(2))==0) {genMaze2(i,j,i,j+1);}
    if(testVisible(i, j-1)==false && int(random(2))==0) {genMaze2(i,j,i,j-1);}
    if(testVisible(i+1, j) && testVisible(i-1, j) && testVisible(i,j+1) && testVisible(i,j-1)) break;
  }
}
void setup(){
  size(500,500);
  genMaze(0,0);
}
void draw(){
  for(int i=0; i<50; i++){
    for(int j=0; j<49; j++){
      if(wallH[i][j]==0) line(10+j*10, i*10, 10+j*10, 10+i*10);
    }
  }
  for(int i=0; i<49; i++){
    for(int j=0; j<50; j++){
      if(wallW[i][j]==0) line(j*10, 10+i*10, 10+j*10, 10+i*10);
    }
  }
  
  for(int i=0; i<10; i++){
    for(int j=0; j<10; j++){
      noStroke();
      if(visited[i][j]) fill(125,125);
      else fill(255,0,0,125);
      //rect(j*50+5, i*50+5, 40, 40);
    }
  }
}
