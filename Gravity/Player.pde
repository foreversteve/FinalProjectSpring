public class Player extends MapObject{
  
  public Player(){
    health = 100;
    
    xcor = width / 2;
    ycor = height / 2;
    
    xspeed = 0.0;
    yspeed = 0.0;
    
    r = 40.0;
  }
  
  public boolean moves(){
    return true; 
  }
   
  
  void userInput(){
    xspeed += .0006 * (mouseX - xcor);
    yspeed += .0006 * (mouseY - ycor);
  }
  
  
  void update(){
    for(int i = 0; i < world.size(); i++){
       world.get(i).collide(world.get(i), this); 
    }
    
    userInput();
  
    xcor+= xspeed;
    ycor+= yspeed; 
    
   if(ycor > height * 9 / 10){
     for(MapObject x : world){
       x.shift(0 , -yspeed);
     }
    }
    
    if(ycor < height / 10){
      for(MapObject x : world){
        x.shift(0 , -yspeed);
      }
    }
    
    if(xcor > width * 9 / 10){
      for(MapObject x : world){
        x.shift(-xspeed, 0);
      }
    }
    
    if(xcor < width / 10){
      for(MapObject x : world){
        x.shift(-xspeed , 0);
      }
    }
    
  }
  
  
  
  void display(){
    fill(200);
    ellipse(xcor,ycor,r,r);
    text(health,20,20);
  }
  
  
  void run(){
    update();
    display();
  }
  
  void takeDamage(MapObject obj){
    health--; 
    if(health == 0){
       world.remove(this); 
    }
  }
  
  void fire(float val){
    float theta = atan((ycor - mouseY)/(xcor - mouseX));
    float cx;
    float cy;
    if (xcor - mouseX > 0){
      cx = -val * cos(theta);
      cy = -val * sin(theta);
    }
    else{
      cx = val * cos(theta);
      cy = val * sin(theta);
    }
    Projectile proj = new Projectile(xcor + 5 * cx,ycor + 5 * cy,cx,cy,"White");
    world.add(proj);
    
  }
  
}
