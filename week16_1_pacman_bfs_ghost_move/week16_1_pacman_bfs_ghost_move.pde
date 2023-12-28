int [][] map = {
  {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
  {2, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 2}, 
  {2, 1, 2, 1, 2, 1, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 1, 2, 1, 2, 1, 2},
  {2, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 2}, 
  {2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 2, 2}, 
  {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2}};
int M, N;
int [][]yuutaDist;
boolean [][] visited;
void setup(){
  size(600,300);
  M = map.length;
  N = map[0].length;
  print(N);
  yuutaDist = new int[M][N];
  visited = new boolean[M][N];
  buildBFS(3, 3, 0);
}
void draw(){
  background(0);
  for(int i=0; i<M; i++){
    for(int j=0; j<N; j++){
      if(map[i][j]==2) {
        fill(128,0,128); rect(j*20, i*20, 20, 20);
      }else{
        fill(255, 128, 0); ellipse(10+j*20, 10+i*20, 8, 8);
      }
      fill(255,0,0);
      text(yuutaDist[i][j]+" ", 10+j*20, 10+i*20);
    }
  }
  fill(255,255,0);
  ellipse(10+3*20, 10+3*20, 15, 15);
  fill(255,0,0);
  ellipse(10+ghostJ*20, 10+ghostI*20, 15, 15);
  if(frameCount%10==0) ghostMove();
}
void ghostMove(){
  if(ghostMoveIJ(ghostI+1,ghostJ, yuutaDist[ghostI][ghostJ])) return;
  if(ghostMoveIJ(ghostI-1,ghostJ, yuutaDist[ghostI][ghostJ])) return;
  if(ghostMoveIJ(ghostI,ghostJ+1, yuutaDist[ghostI][ghostJ])) return;
  if(ghostMoveIJ(ghostI,ghostJ-1, yuutaDist[ghostI][ghostJ])) return;
}
boolean ghostMoveIJ(int i, int j, int oldValue){
  if(i<0 || j<0 || i>=M || j>=N) return false;
  if(yuutaDist[i][j]==0) return false;
  if(yuutaDist[i][j] ==oldValue-1){
    ghostI = i;
    ghostJ = j;
    return true;
  }
  return false;
}
ArrayList<Integer> queueI = new ArrayList<Integer>();
ArrayList<Integer> queueJ = new ArrayList<Integer>();
ArrayList<Integer> queueD = new ArrayList<Integer>();
void buildBFS(int I, int J, int D){
  queueI.add(I);
  queueJ.add(J);
  queueD.add(D);
  yuutaDist[I][J] = D;
  visited[I][J] = true;
  while( queueI.size()>0 ){
    int i = queueI.remove(queueI.size()-1);
    int j = queueJ.remove(queueJ.size()-1);
    int d = queueD.remove(queueD.size()-1);
    yuutaDist[i][j] = d;
    testAndPush(i+1, j, d+1);
    testAndPush(i-1, j, d+1);
    testAndPush(i, j+1, d+1);
    testAndPush(i, j-1, d+1);
  }
  
}
int ghostI = 1, ghostJ = 21;
void testAndPush(int i, int j, int d){
  if(i<0 || j<0 || i>=M || j>=N) return;
  if(visited[i][j]) return;
  visited[i][j] = true;
  if(map[i][j]==2) return;
  queueI.add(i);
  queueJ.add(j);
  queueD.add(d);
}
