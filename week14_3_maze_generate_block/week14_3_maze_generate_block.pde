//產生地圖maze的方法
int [][] maze = new int[10][10];
boolean [][] visited = new boolean[10][10];
boolean testVisible(int i, int j){
  if(i<0 || j<0 || i>=10 || j>=10) return true;
  return visited[i][j]; //false 要用它
}
void genMaze(int i, int j){
  if(i==9&&j==9) return;
  visited[i][j] = true;
  int unvisitedN = 0;
  if(testVisible(i+1, j)==false) unvisitedN++;
  if(testVisible(i-1, j)==false) unvisitedN++;
  if(testVisible(i, j+1)==false) unvisitedN++;
  if(testVisible(i, j-1)==false) unvisitedN++;
  int choose = int(random(unvisitedN));
  
  if(testVisible(i+1, j)==false) {if(choose==0) {genMaze(i+1,j); return;} choose--; }
  if(testVisible(i-1, j)==false) {if(choose==0) {genMaze(i-1,j); return;} choose--; }
  if(testVisible(i, j+1)==false) {if(choose==0) {genMaze(i,j+1); return;} choose--; }
  if(testVisible(i, j-1)==false) {if(choose==0) {genMaze(i,j-1); return;}choose--; }
  
}
void setup(){
  size(500,500);
  genMaze(0,0);
}
void draw(){
  for(int i=0; i<10; i++){
    for(int j=0; j<10; j++){
      if(visited[i][j]) fill(125);
      else fill(0);
      rect(j*50, i*50, 50, 50);
    }
  }
}
