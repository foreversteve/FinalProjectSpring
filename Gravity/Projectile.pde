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
    if (colour.equals("White")){
      fill(255);
    }
    if (colour.equals("Yellow")){
      fill(255,140,0);
    }
    
    ellipse(xcor,ycor,r,r);
  }
  
  void run(){
    for(MapObject obj : world){
      if(obj != player){
         obj.collide(obj, this); 
      }
    }
    
    xcor += xspeed;
    ycor += yspeed;
    
    
    
    display();
  }
}
