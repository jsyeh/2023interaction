//要如何在程式中,讓視窗可以改變大小呢? 有兩種簡單的方法
//google: processing.org how to change window size and position
//1. The size() function can only be used once inside a sketch, and it cannot be used for resizing. Use windowResize() instead
//2. By default, Processing sketches can't be resized. When surface.setResizable(true) is used within a sketch, the window can be resized
void setup(){
  size(500,500,P2D);
  surface.setResizable(true); //第2種方法,可以在視窗右下角縮放它
}
void draw(){
  if(frameCount/60%2==0) windowResize(300,300);
  else windowResize(500,500); //第1種方法,可以呼叫 windowResize()
  background(255,255,0);  
}
void mousePressed(){
  windowResize(600,300); //第1種方法,可以呼叫 windowResize()
  background(255,255,0);
}
