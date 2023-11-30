//想要做「餐廳出餐」的遊戲, 如何用陣列來決定用什麼來組合
//keyPressed 會有人進來點餐, mousePressed 會掉解決1位客人
int [] people = new int[100];//最多5人
char [][] menu = { //菜單與成份, 只有4種餐
  {'a','b','a','c','a'},
  {'a','c','b','a'},
  {'a','b','a'},
  {'a','c','b','c','a'},
};
String [] foodName = {"food1", "food2", "food3", "food4"};
void setup(){
  size(600,400);
  
  people[waiting] = int(random(4));
  waiting++;
}
int waiting=0;
void draw(){
  background(#FFFFF2);
  for(int i=0; i<waiting; i++){
    int m = people[i];
    fill(0); textSize(20); text( foodName[m], 50+i*80, 100);
  }
  int m2 = people[0];
  for(int c=0; c<menu[m2].length; c++){
    text( menu[m2][c], 300+c*30, 300);
  }
}
void keyPressed(){//有人來排隊了
  people[waiting] = int(random(4));
  waiting++;
}
void mousePressed(){
  for(int i=0; i<waiting-1; i++){//最多5人
    people[i] = people[i+1];
  }
  if(waiting>1) waiting--;
  //meal[4] = int(random(4));//只有4種餐
}
