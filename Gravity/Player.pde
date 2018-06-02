public class Player extends MapObject{
  final String name = "Player";
  boolean [] keys = new boolean[128];
  
  public Player(){
    xcor = 200;
    ycor = 200;
    
    xspeed = 0.0;
    yspeed = 0.0;
    
    r = 40.0;
  }
  
  
  void update(Player user){
    if (keys['a']) //move left 
      xspeed -= 0.1;
    if (keys['d']) //move right
      xspeed += 0.1;
    if (keys['w']) //move up
      yspeed -= 0.1;
    if (keys['s']) //move down
      yspeed += 0.1;
     //print(xspeed+" " + yspeed); 
    //checkWalls();
    checkPlanet();
  }
  
  
  void update(ArrayList<MapObject> map){
    //fix this later, it will prevent the plater for taking damage whene its on the wall
    xcor+= xspeed;
    ycor+= yspeed; 
   if(ycor > height * 9 / 10){
   for(MapObject x : world){
     x.move(0 , -yspeed);
   }
   ycor -= yspeed;
  }
  if(ycor < height / 10){
   for(MapObject x : world){
      x.move(0 , -yspeed);
   }
    ycor -= yspeed;
  }if(xcor > width * 9 / 10){
   for(MapObject x : world){
      x.move(-xspeed, 0);
   }
   xcor -= xspeed;
  }if(xcor < width / 10){
   for(MapObject x : world){
      x.move(-xspeed , 0);
   }
   xcor -= xspeed;
  }
  
  if((ycor < height * 9 / 10) && (ycor > height / 10) && (xcor < width * 9 / 10) && (xcor > width / 10)){
    for(MapObject obj : map){
       obj.update(this); 
    }  
    update(this);
  }
  }
  
  void checkWalls(){
    if (xcor < r/2) {
      xspeed *= -0.5;
      xcor = r/2;//prevents 2 true in a row
    }
    if (xcor > width - r/2) {
      xspeed *= -0.5;
      xcor = width - r/2;//prevents 2 true in a row
    }
    if (ycor < r/2) {
      yspeed *= -0.5;
      ycor = r/2;//prevents 2 true in a row
    }
    if (ycor > height - r/2) {
      yspeed *= -0.5;
      ycor = height - r/2;//prevents 2 true in a row
    }
  }
  
  void die(){
    
  }
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
  void display(){
    
    fill(200);
    ellipse(xcor,ycor,r,r);
    
    
  }
  
  
  void run(ArrayList<MapObject> map){
    update(map);
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
    projectiles.add(new Projectile(xcor,ycor,cx,cy,"White"));
  }
  
}
