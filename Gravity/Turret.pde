ArrayList<Projectile> projectiless;
class Turret extends MapObject{
  //float xcor,ycor;
  
  float fs;
  float pspeed;
  
  String colour;
  float angle;
  
  public Turret(float x, float y, float ps, float fspeed, String c,Planet p){
    xcor = x;
    ycor = y;
    
    fs = fspeed;
    pspeed = ps;
    
    colour = c;
    
    float theta = atan((y - p.ycor)/(x - p.xcor));
    if (x - p.xcor > 0){
      angle = -theta;
    }
    else{
      angle = theta;
    }
  }
  
  void fire(Player p){
    float theta = atan((ycor - p.ycor)/(xcor - p.xcor));
    float cx;
    float cy;
    if (fs > 10000){
      fs = 0;
    }
    if (fs % 15 == 0){
      if (xcor - p.xcor > 0){
        cx = -pspeed * cos(theta);
        cy = -pspeed * sin(theta);
      }
      else{
        cx = pspeed * cos(theta);
        cy = pspeed * sin(theta);
      }
      projectiles.add(new Projectile(xcor,ycor,cx,cy,"Yellow"));
    }
    fs+=1;
  }
  
  void run(Player p){
    translate(xcor,ycor);
    display();
    translate(-xcor,-ycor);
    fire(p);
  }
  
  void display(){
    fill(255,140,0);
    //rotate(radians(60));
    ellipse(25,0,30,16);
    rect(0,0,50,20);
    
  }
}
