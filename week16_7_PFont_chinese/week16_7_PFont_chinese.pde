//顯示中文, 只要有中文的字型
size(600,500);
fill(255,0,0);
PFont font = createFont("微軟正黑體 Bold", 40);
textFont(font);
//textSize(40);
text("Hello中文", 50, 50);
//print(PFont.list());
//for( String name : PFont.list() ){
//  println(name); //微軟正黑體 Bold
//}
