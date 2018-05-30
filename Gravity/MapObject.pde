abstract class MapObject{
 public float xcor, ycor, r, xspeed, yspeed;
 
 //public void shift();

 public void move(float xinc, float yinc){
   xcor += xinc;
   ycor += yinc;
 }
 
 abstract void display();
 
 public void collide(MapObject obj1, MapObject obj2){
    if(pow(obj1.xcor - obj2.xcor, 2) + pow(obj1.ycor - obj2.ycor, 2) <= pow(obj1.r/2 + obj2.r/2, 2)){
      float m = (obj1.ycor - obj2.ycor) / (obj1.xcor - obj2.xcor);
      m = atan(-1 / m);
      
      //float m1 = atan(obj1.yspeed / obj1.xspeed);
      float m2 = atan(obj2.yspeed / obj2.xspeed);
      //System.out.println(m1 + " " + m2);
      //float mag1 = obj1.yspeed / (sin(atan(m1)));
      float mag2 = obj1.yspeed / (sin(atan(m2)));
      //m1 = PI - (2* (PI - (m1 + m)) + m1);
      m2 = PI - (2* (PI - (m2 + m)) + m2);
      
      
      //obj1.yspeed = mag1 * sin(m1);
      //obj1.xspeed = mag1 * cos(m1);
      
      obj2.yspeed = mag2 * sin(m2);
      obj2.xspeed = mag2 * cos(m2);
    }
 }
}
