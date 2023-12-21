//想要有粗的字體
PFont font1, font2, font01, font02, font03;
void setup(){
  size(500,500);
  font1 = createFont("Arial Black", 30);
  font2 = createFont("Ariel", 30);
  font01 = createFont("微軟正黑體 Light", 30);
  font02 = createFont("微軟正黑體", 30);
  font03 = createFont("微軟正黑體 Bold", 30);
  for(String name : PFont.list()){
    println(name);
  } //println(PFont.list());
}
void draw(){
  background(255,0,0);
  fill(0);
  textFont(font01);
  text("Hello World哈囉", 100,100);
  textFont(font02);
  text("Hello World哈囉", 100,200);
  textFont(font03);
  text("Hello World哈囉", 100,300);
}
