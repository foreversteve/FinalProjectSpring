class Projectile extends MapObject{
  final String name = "Projectile";
  String colour;

  
  public Projectile(float x, float y, float xv, float yv, String c){
    xcor = x;
    ycor = y;
  
    xspeed = xv;
    yspeed = yv;
    
    colour = c;
    r = 10;
    dead = false;
  }
  
  void checkWalls(){
    if (xcor < r/2 || xcor > width - r/2 || ycor < r/2 ||ycor > height - r/2) {
      dead = true;
    }
  }
  
  void checkPlanet(){
    for (Planet x : planets){
        if (pow(xcor - x.xcor,2)+ pow(ycor-x.ycor,2) < pow(x.r/2+r/2,2)) {
           dead = true;
        }
    }
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
    checkWalls();
    checkPlanet();
  }
}
