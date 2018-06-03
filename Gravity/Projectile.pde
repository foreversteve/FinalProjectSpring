class Projectile extends MapObject{
  String colour;
  public Projectile(float x, float y, float xv, float yv, String c){
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
    
  }
  
  void update(Player user){
    
  }
  
  void die(){
    
  }
  
  void run(){
    if (colour.equals("White")){
      fill(255);
    }
    if (colour.equals("Yellow")){
      fill(255,140,0);
    }
    xcor += xspeed;
    ycor += yspeed;
    ellipse(xcor,ycor,r,r);
  }
}
