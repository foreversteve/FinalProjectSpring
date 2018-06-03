class Projectile extends MapObject{
  String colour;
  
  public Projectile(float x, float y, float xv, float yv, String c){
    health = 2;
    
    xcor = x;
    ycor = y;
  
    xspeed = xv;
    yspeed = yv;
    
    colour = c;
    r = 10;
  }
  
  public boolean moves(){
      return true; 
   }
   
  void display(){
    if (colour.equals("White")){
      fill(255);
    }
    if (colour.equals("Yellow")){
      fill(255,140,0);
    }
    
    ellipse(xcor,ycor,r,r);
  }
  
  void takeDamage(MapObject obj){
   health--; 
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
