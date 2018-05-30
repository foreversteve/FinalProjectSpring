abstract class MapObject{
 public float xcor, ycor, r, xspeed, yspeed;
 
 //public void shift();

 public void move(float xinc, float yinc){
   xcor += xinc;
   ycor += yinc;
 }
 
 abstract void display();
 
 public void collide(MapObject obj1, MapObject obj2){
    if(pow(obj1.xcor - obj2.xcor, 2) + pow(obj1.ycor - obj2.ycor, 2) <= pow(obj1.r + obj2.r, 2)){
      float m = (obj1.ycor - obj2.ycor) / (obj1.xcor - obj2.xcor);
      m = -1 / m;
      float m1 = obj1.yspeed / obj1.xspeed;
      m1 = -1 / m1;
      float m2 = obj2.yspeed / obj2.xspeed;
      
    }
 }
}
