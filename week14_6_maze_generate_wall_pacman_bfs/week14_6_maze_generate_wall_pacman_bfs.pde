//產生地圖maze的方法
int startI=3, startJ=3;
int ghostI=5, ghostJ=8;
ArrayList<Integer> queueI = new ArrayList<Integer>();
ArrayList<Integer> queueJ = new ArrayList<Integer>();
ArrayList<Integer> queueD = new ArrayList<Integer>();
int [][] maze = new int[10][10];
boolean [][] visited = new boolean[10][10];
boolean testVisible(int i, int j){ //true: nothing
  if(i<0 || j<0 || i>=10 || j>=10) return true;
  return visited[i][j]; //false 要用它 doing something
}
int [][] wallH = new int[10][9];
int [][] wallW = new int[9][10];
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
boolean [][]yuutaVisited = new boolean[10][10];
int [][] yuutaDist = new int[10][10];
void BFS(int i, int j, int d){
  queueI.add(i);
  queueJ.add(j);
  queueD.add(d);
  yuutaVisited[i][j] = true;
  yuutaDist[i][j] = d;
  while( queueI.size()>0){
    int ii = queueI.remove(0);
    int jj = queueJ.remove(0);
    int dd = queueD.remove(0);
    testAndAdd(ii,jj, ii+1, jj, dd+1);
    testAndAdd(ii,jj, ii-1, jj, dd+1);
    testAndAdd(ii,jj, ii, jj+1, dd+1);
    testAndAdd(ii,jj, ii, jj-1, dd+1);
  }
}
void testAndAdd(int i0, int j0, int i, int j, int d){
  if(i<0 || j<0 || i>=10 || j>=10) return;
  if(yuutaVisited[i][j]) return;
  if( (i0==i && wallH[i][min(j0,j)]==1) || (j0==j && wallW[min(i0,i)][j]==1) ) {
    queueI.add(i);
    queueJ.add(j);
    queueD.add(d);
    yuutaDist[i][j] = d;
    yuutaVisited[i][j] = true;
  }
}
void setup(){
  size(500,500);
  genMaze(0,0);
  BFS(startI, startJ, 0);
}
void draw(){
  for(int i=0; i<10; i++){
    for(int j=0; j<9; j++){
      if(wallH[i][j]==0) line(50+j*50, i*50, 50+j*50, 50+i*50);
    }
  }
  for(int i=0; i<9; i++){
    for(int j=0; j<10; j++){
      if(wallW[i][j]==0) line(j*50, 50+i*50, 50+j*50, 50+i*50);
    }
  }
  
  for(int i=0; i<10; i++){
    for(int j=0; j<10; j++){
      noStroke();
      if(visited[i][j]) fill(125,125);
      else fill(255,0,0,125);
      text(""+yuutaDist[i][j], j*50+5, i*50+5, 40, 40);
      //rect(j*50+5, i*50+5, 40, 40);
    }
  }
  fill(255,255,0); ellipse(startJ*50+25, startI*50+25, 40, 40);
  fill(255,0,0); ellipse(ghostJ*50+25, ghostI*50+25, 40, 40);
}
