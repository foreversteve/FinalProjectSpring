class Projectile extends MapObject{
  String colour;
  String type = "Projectile";
  String ptype;
  
  
  public Projectile(float x, float y, float xv, float yv, String t){
    health = 2;
    
    xcor = x;
    ycor = y;
  
    xspeed = xv;
    yspeed = yv;
    
    ptype = t;
    r = 10;
    
  }
  
  public boolean moves(){
      return true; 
   }
   
  void display(){
    if (ptype.equals("friend")){
      image(friendP, xcor - friendP.width / 2, ycor - friendP.height/2); 
    }
    if (ptype.equals("foe")){
      image(foeP, xcor - foeP.width / 2, ycor - foeP.height/2); 
    }
    
    //ellipse(xcor,ycor,r,r);
  }
  
  void takeDamage(MapObject obj){
   health-=2; 
   if(health == 0){
      world.remove(this); 
   }
  }
 
  
  void run(){
    for(int i = 0; i < world.size(); i++){
      if(world.get(i) != player){
         world.get(i).collide(world.get(i), this); 
      }
    }
    
    xcor += xspeed;
    ycor += yspeed;
    
    display();
  }
  
}
