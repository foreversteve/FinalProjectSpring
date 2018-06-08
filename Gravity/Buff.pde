class Buff extends MapObject{
  float xcor,ycor;
  String type = "Buff";
  float r = 10;
  
  public Buff(float a, float b){
    xcor = a;
    ycor = b;
  }
  public boolean moves(){
      return false; 
  }
  void takeDamage(MapObject obj){
    world.remove(this);
    player.buffed = true;
  }
  
  void display(){
    rect(xcor,ycor,10,10);
  }
  void run(){
    display();
    
    if (checkCollide(player,this)){
      collide(this,player);
      player.xspeed*=-1;
      player.yspeed*=-1;
    }
    
  }
}
