//想要做出旋轉星雲的特效。
ArrayList<PVector> cloud = new ArrayList<PVector>();
ArrayList<PVector> v = new ArrayList<PVector>();
void setup(){
  size(500,500);
  addCloud(0);
}
void addCloud(float d){
  for(int i=0; i<10; i++){
    float a = i / 10.0 * PI * 2 + d;
    cloud.add( new PVector( 250+10*cos(a), 250+10*sin(a) ) );
    v.add(new PVector( cos(a)*2, sin(a)*2 ) );
  }  
}
void draw(){
  background(255);
  if(frameCount%3==0) addCloud( +frameCount/30.0 );
  //for(int i=0; i<cloud.size(); i++){
  for(int i=cloud.size()-1; i>=0; i--){
    PVector p = cloud.get(i);
    ellipse(p.x, p.y, p.z, p.z);
    p.x += v.get(i).x;
    p.y += v.get(i).y;
    p.z+=0.1;
    if(p.x<0 || p.x>500 || p.y<0 || p.y>500){
      cloud.remove(i);
      v.remove(i);
    }
  }
}
