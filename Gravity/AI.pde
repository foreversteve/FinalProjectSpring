public class AI extends MapObject{
  boolean buffed;
  float fs =1;
  float pspeed,frame;
  String type = "AI";
  public AI(float x,float y){
    health = 100;
    
    xcor = x;
    ycor = y;
    
    xspeed = 0.0;
    yspeed = 0.0;
    
    r = 40.0;
    buffed = false;
    
    pspeed = 10;
    frame = 0;
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
      String temp = world.get(i).getType();
      if (temp.equals("Planet") ){
       world.get(i).collide(world.get(i), this); 
      }
    }
    //userInput();
    
    
    if (frame > 1000){
       frame =0;
    }
     float dxcor = 200 * cos(radians(frame));
     float dycor = 200 * sin(radians(frame));
     
     this.xcor = player.xcor + dxcor;
     this.ycor = player.ycor + dycor;
     frame+=2;
    
  }
  
  
  
  void display(){
    fill(200);
    ellipse(xcor,ycor,r,r);
    //text(health,30,30);
    //image(ship, xcor - ship.width / 2, ycor - ship.height / 2);
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
        Projectile proj = new Projectile(xcor,ycor - 10,cx,cy,"foe");
        world.add(proj);
      }
    }
    fs+=1;
    
  }
  public String getType(){
     return "AI";
   }
}
