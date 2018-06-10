public class AI extends MapObject{
  float fs =1;
  float pspeed,frame;

  public AI(float x,float y){
    health = 100;
    
    xcor = x;
    ycor = y;
    
    xspeed = 0.0;
    yspeed = 0.0;
    
    r = 40.0;
    
    pspeed = 10;
    frame = 0;
  }
  
  
  public boolean moves(){
    return true; 
  }
   
  
  
  void update(){
    for(int i = 0; i < world.size(); i++){
      String temp = world.get(i).getType();
      if (temp.equals("Planet") ){
       world.get(i).collide(world.get(i), this); 
      }
    }
    
    float theta = atan((player.ycor - ycor)/(player.xcor - xcor));
    float xdiff = abs(5 * cos(theta));
    float ydiff = abs(5 * sin(theta));
    
    if(player.xcor < xcor){
      xdiff *= -1;
    }
    
    if(player.ycor < ycor){
       ydiff *= -1; 
    }
    xcor += xdiff;
    ycor += ydiff;
    
    //if (frame > 1000){
    //   frame =0;
   // }
     //float dxcor = 200 * cos(radians(frame));
     //float dycor = 200 * sin(radians(frame));
     
     //this.xcor = player.xcor + dxcor;
     //this.ycor = player.ycor + dycor;
     //frame+=2;
    
  }
  
  
  
  void display(){
    tint(100, 0, 0);
    image(ship, xcor - ship.width / 2, ycor - ship.height / 2);
    noTint();
  }
  
  
  void run(){
    update();
    display();
    fire(player);
  }
  
  void takeDamage(MapObject obj){
    health--; 
    if(health == 0){
       world.remove(this); 
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
      if(ycor > player.ycor){
        Projectile proj = new Projectile(xcor, ycor, cx,cy,"foe");
        world.add(proj);
      }
    }
    fs+=1;
    
  }
  public String getType(){
     return "AI";
   }
}
