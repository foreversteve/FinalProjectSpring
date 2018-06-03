class Turret extends MapObject{
  float fs;
  float pspeed;
  
  String colour;
  float angle;
  
  
  public boolean moves(){
      return false; 
   }
  
  
  public Turret(float x, float y, float ps, float fspeed, String c, Planet p){
    health = 15;
    
    xcor = x;
    ycor = y;
    
    r = 5;
    
    fs = fspeed;
    
    pspeed = ps;
    
    colour = c;
    
    float theta = atan((y - p.ycor)/(x - p.xcor));
    if(x - p.xcor > 0){
      angle = -theta;
    }
    else{
      angle = theta;
    }
  }
  
  void takeDamage(MapObject obj){
    for(int i = 0; i < world.size(); i++){
      try{
        if(((Projectile) obj).colour.equals("White")){
          
          health--;
          if(health == 0){
             world.remove(this); 
          }
        }
     }catch(ClassCastException e){}
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
      Projectile proj = new Projectile(xcor,ycor - 10,cx,cy,"Yellow");
      world.add(proj);
    }
    fs+=1;
  }
  
  
  void run(){
    translate(xcor,ycor);
    display();
    translate(-xcor,-ycor);
    fire(player);
  }
  
  void display(){
    System.out.println(health);
    fill((255 / 15) * (15 - health),140,0);
    //rotate(radians(60));
    ellipse(25,0,30,16);
    rect(0,0,50,20);
    
  }
}
