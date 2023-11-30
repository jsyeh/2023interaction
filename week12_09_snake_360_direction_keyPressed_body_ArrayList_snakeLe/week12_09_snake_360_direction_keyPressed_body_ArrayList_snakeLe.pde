//360度的貪食蛇
float x=250, y=250, dir=0, s=1;
int snakeLen = 1;
ArrayList<PVector> body = new ArrayList<PVector>();
void setup(){
  size(500,500);
  rectMode(CENTER);
}
void draw(){
  background(#FFFFF2);
  drawBody();
  drawHead(x, y, dir);
  x += s*cos(dir);
  y += s*sin(dir);
  if(body.size()<snakeLen*10){
    body.add( new PVector(x, y, dir) );
  }else{
    for(int i=0; i<body.size()-1; i++){
      body.get(i).x = body.get(i+1).x;
      body.get(i).y = body.get(i+1).y;
      body.get(i).z = body.get(i+1).z;
    }
    body.get(body.size()-1).x = x;
    body.get(body.size()-1).y = y;
    body.get(body.size()-1).z = dir;
  }
}
void drawBody(){
  for(int i=0; i<body.size(); i+=10){
    PVector b = body.get(i);
    ellipse(b.x, b.y, 30, 30);
    line(b.x, b.y, b.x-15*cos(b.z), b.y-15*sin(b.z) );
  }
}
void drawHead(float x, float y, float dir){
  ellipse(x, y, 30, 30);
  line(x, y, x+15*cos(dir), y+15*sin(dir) );
}
void keyPressed(){
  if(keyCode==LEFT) dir -= 0.15;
  if(keyCode==RIGHT) dir += 0.15;
  if(key==' ') {snakeLen ++; }
}
