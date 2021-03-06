public class Player extends MapObject{
  boolean buffed;
  String type = "Player";
  public Player(){
    health = 100;
    
    xcor = width / 2;
    ycor = height / 2;
    
    xspeed = 0.0;
    yspeed = 0.0;
    
    r = 40.0;
    buffed = false;
  }
  
  public boolean moves(){
    return true; 
  }
   
  
  void userInput(){
    if (Gravity.keys['a']) //move left 
      xspeed -= 0.1;
    if (Gravity.keys['d']) //move right
      xspeed += 0.1;
    if (Gravity.keys['w']) //move up
      yspeed -= 0.1;
    if (Gravity.keys['s']) //move down
      yspeed += 0.1;
    
     //print(xspeed+" " + yspeed);
      
  }
  
  
  void update(){
    for(int i = 0; i < world.size(); i++){
       world.get(i).collide(world.get(i), this); 
    }
    
    userInput();
  
    xcor+= xspeed;
    ycor+= yspeed; 
    
   if(ycor > height / 2 + 200){
     for(MapObject x : world){
       x.shift(0 , -yspeed);
     }
    }
    
    if(ycor < height / 2 - 200){
      for(MapObject x : world){
        x.shift(0 , -yspeed);
      }
    }
    
    if(xcor > width / 2 + 200){
      for(MapObject x : world){
        x.shift(-xspeed, 0);
      }
    }
    
    if(xcor < width / 2 - 200){
      for(MapObject x : world){
        x.shift(-xspeed , 0);
      }
    }
    
  }
  
  
  
  void display(){
    strokeWeight(4);
    fill(((100 - health) / 100) * 255, (health / 100) * 255, 0); 
    rect(20,20,100,50);
    fill(0);
    text((int) health, 30, 60);
    image(ship, xcor - ship.width / 2, ycor - ship.height / 2);
  
}

boolean checkWin(){
  for(MapObject obj : world){
     if(obj.getType().equals("Turret") || obj.getType().equals("AI")){
        return false; 
     }
  }
  return true;
}
  
  void run(){
    if(checkWin()){
       MenuNum = 3; 
    }
    update();
    display();
  }
  
  void takeDamage(MapObject obj){
    health--; 
    if(health == 0){
       MenuNum = 2; 
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
    Projectile proj = new Projectile(xcor + 5 * cx,ycor + 5 * cy,cx,cy,"friend");
    world.add(proj);
  }
  
  public String getType(){
     return "Player";
   }
}
  
