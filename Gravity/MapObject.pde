abstract class MapObject{
 public float xcor, ycor, r, xspeed, yspeed;
 public boolean dead;
 String name;
 public void move(float xinc, float yinc){
   xcor += xinc;
   ycor += yinc;
 }
 
 //abstract boolean die();
 
 abstract void display();
 
 abstract void update(Player user);
 
 
 public void collide(MapObject obj1, MapObject obj2,float t){
    if (checkCollide(obj1,obj2) && t < 2){
      float theta0= atan (-1 / ((obj1.ycor - obj2.ycor) / (obj1.xcor - obj2.xcor)));
      float theta1 = atan (obj1.yspeed / obj1.xspeed);
      float theta = radians(180) - theta0 - theta1;
      
      theta += radians(180)-theta0;
      
      float mag = obj1.xspeed;
      obj1.xspeed = mag * cos(theta);
      obj1.yspeed = mag * sin(theta);
      
      t+=1;
      if (! obj2.name.equals("Planet")){
        collide(obj2,obj1,t);
      }
    }
      
 }
 
 public boolean checkCollide(MapObject obj1, MapObject obj2){
    return pow(obj1.r+obj2.r,2) > pow(obj1.xcor-obj2.xcor,2) + pow (obj1.ycor-obj2.ycor,2);
 }
 
}
