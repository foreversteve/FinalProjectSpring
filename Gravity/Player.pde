public class Player extends MapObject{
  
  public Player(){
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
    xspeed += .001 * (mouseX - xcor);
    yspeed += .001 * (mouseY - ycor);
  }
  
  
  void update(){
    userInput();
    
    for(MapObject obj : world){
    //   obj.collide(obj, this); 
    }
    
    xcor+= xspeed;
    ycor+= yspeed; 
    
   if(ycor > height * 9 / 10){
     for(MapObject x : world){
       x.shift(0 , -yspeed);
     }
     ycor -= yspeed;
    }
    
    if(ycor < height / 10){
      for(MapObject x : world){
        x.shift(0 , -yspeed);
      }
      ycor -= yspeed;
    }
    
    if(xcor > width * 9 / 10){
      for(MapObject x : world){
        x.shift(-xspeed, 0);
      }
     xcor -= xspeed;
    }
    
    if(xcor < width / 10){
      for(MapObject x : world){
        x.shift(-xspeed , 0);
      }
     xcor -= xspeed;
    }
    
  }
  
  
  /*
  void checkPlanet(){
    for (Planet x : planets){
        if (pow(xcor - x.xcor,2)+ pow(ycor-x.ycor,2) < pow(x.r/2+r/2,2)) {
       
        float theta = atan((ycor - x.ycor)/(xcor - x.xcor));
        if (xcor != x.xcor){
          if (xcor - x.xcor < 0){
            if (ycor - x.ycor < 0){
              xcor -= xspeed*cos(theta);
              ycor -= yspeed*sin(theta);
            }
            else{
              xcor -= xspeed*cos(theta);
              ycor += yspeed*sin(theta);
            }
          }
          else{
            if (ycor - x.ycor < 0){
              xcor -= xspeed*cos(theta);
              ycor += yspeed*sin(theta);
            }
            else{
              xcor -= xspeed*cos(theta);
              ycor -= yspeed*sin(theta);
            }
          }
        }
        xspeed *= -0.3;
        yspeed *= -0.3;
      }
    }
  }  
  
  */
  void display(){
    
    fill(200);
    ellipse(xcor,ycor,r,r);
    
    
  }
  
  
  void run(){
    update();
    display();
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
    Projectile proj = new Projectile(xcor,ycor,cx,cy,"White");
    world.add(proj);
    
  }
  
}
