 Player player;
 ArrayList<Planet> planets;
 boolean [] keys = new boolean[128];
 class Planet{
   float xcor,ycor;
   float g;
   float r;
   
   public Planet(float x, float y){
     xcor = x;
     ycor = y;
     r = 100;
     g = 0.05;
   }
   public Planet(){
     xcor = width/2;
     ycor = height/2;
     r = 100;
     g = 0.05;
   }
   void display(){
     fill(0,224,224);
     ellipse(xcor,ycor,r,r);
   }
   void run(Player player){
     display();
     updatePlayer(player);
   }
   void updatePlayer(Player user){
     float theta = atan((ycor - user.ycor)/(xcor - user.xcor));
     if (xcor - user.xcor > 0){
       user.xspeed += g * cos(theta);
       user.yspeed += g * sin(theta);
     }
     else{
       user.xspeed -= g * cos(theta);
       user.yspeed -= g * sin(theta);
     }
   }
   
   void generateMoon(float radius){
     fill(255,153,51);
     for (float i = 0.0; i <= 360.0; i+=40.0){
        float dx = (r + radius + 2 ) * cos(radians(i));
        float dy = (r + radius + 2 ) * sin(radians(i));
        ellipse(xcor+dx, ycor + dy, radius, radius);
     }
   
   
 }
 class Player{
  float xcor,ycor;
  float xspeed,yspeed;
  float r;
  public Player(){
    xcor = 200;
    ycor = 200;
    
    xspeed = 0.0;
    yspeed = 0.0;
    
    r = 40.0;
  }
  void update(){
    if (keys['a']) //move left 
      xspeed -= 0.1;
    if (keys['d']) //move right
      xspeed += 0.1;
    if (keys['w']) //move up
      yspeed -= 0.1;
    if (keys['s']) //move down
      yspeed += 0.1;
     checkWalls();
  }
  void checkWalls(){
    if (xcor < r) {
      xspeed *= -0.5;
      xcor = r;//prevents 2 true in a row
    }
    if (xcor > width - r) {
      xspeed *= -0.5;
      xcor = width - r;//prevents 2 true in a row
    }
    if (ycor < r) {
      yspeed *= -0.5;
      ycor = r;//prevents 2 true in a row
    }
    if (ycor > height - r) {
      yspeed *= -0.5;
      ycor = height - r;//prevents 2 true in a row
    }
  }
  void display(){
    xcor+= xspeed;
    ycor+= yspeed;
    fill(200);
    ellipse(xcor,ycor,r,r);
  }
  void run(){
    update();
    display();
  }
}

void setup(){
  size(1200,800);
  background(0);
  player = new Player();
  planets = new ArrayList<Planet>();
  planets.add(new Planet(width/2,height/2));
  //planets.add(new Planet(600,400));
  
}

void draw(){
  background(0);
  player.run();
  for (Planet x : planets){
    x.run(player);
  }
  
}

void keyPressed(){
  try{
    keys[key] = true;
  }
  catch(ArrayIndexOutOfBoundsException e){
    
  }
}
 
void keyReleased(){
  try{
    keys[key] = false;
  }
  catch(ArrayIndexOutOfBoundsException e){
    
  }
}
