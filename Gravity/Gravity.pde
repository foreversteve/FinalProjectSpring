 Player player;
 ArrayList<Planet> planets;
 boolean [] keys = new boolean[128];
 
 class Player implements GravityEnabled{
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
    
     //print(xspeed+" " + yspeed);
      
    checkWalls();
    checkPlanet();
    
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
  size(1300,1100);
  background(0);
  player = new Player();
  planets = new ArrayList<Planet>();
  planets.add(new Planet(width/2,height/2,200));
  //planets.add(new Planet(width/3*2,height/2,200));
  planets.get(0).generateParticle(15,18);
  
}

void draw(){
  background(0);
  player.run();
  for (Planet x : planets){
    x.run(player);
    x.generateParticle(15,18);
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
