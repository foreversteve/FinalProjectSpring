abstract class MapObject{
 public float xcor, ycor, r, xspeed, yspeed, health;
 public String type;

 public void shift(float xinc, float yinc){
   xcor += xinc;
   ycor += yinc;
 }
 
 abstract void takeDamage(MapObject obj);
 
 abstract boolean moves();
 
 abstract void display();
 
 abstract void run();
 

 
 public void collide(MapObject obj1, MapObject obj2){
   if(obj1 != obj2 && checkCollide(obj1,obj2)){
  
     obj1.takeDamage(obj2);
     obj2.takeDamage(obj1);
     
     if(obj1.moves()){
         collideHelper(obj1,obj2);
     }
   
     if(obj2.moves()){
        collideHelper(obj2, obj1); 
     }
   }  
 
 }
 
 public void collideHelper(MapObject obj1, MapObject obj2){
      
      obj1.xspeed *= -0.3;
      obj1.yspeed *= -0.3;
      
      /*
      float theta0= atan (-1 / ((obj1.ycor - obj2.ycor) / (obj1.xcor - obj2.xcor)));
      float theta1 = atan (obj1.yspeed / obj1.xspeed);
      float theta = radians(180) - theta0 - theta1;
      
      theta += radians(180)-theta0;
      
      float mag = obj1.xspeed;
      obj1.xspeed = mag * cos(theta);
      obj1.yspeed = mag * sin(theta);
      */
      
      
 }
 
 public boolean checkCollide(MapObject obj1, MapObject obj2){
    return pow(obj1.r/2 + obj2.r/2 ,2) > pow(obj1.xcor-obj2.xcor,2) + pow (obj1.ycor-obj2.ycor,2);
 }
 
 public String getType(){
   return this.type;
 }
 
}
