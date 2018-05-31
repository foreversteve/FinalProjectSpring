/*
public class GravityEnabled{
  float xcor;
  float ycor;
  float xspeed;
  float yspeed;
  
  public void changeXspeed(float a){
    xspeed += a;
  }
  public void changeYspeed(float b){
    yspeed += b;
  }
}

*/


void drawShapeAtAngle(float x, float y, float angle){
   pushMatrix();
     translate(x,y);
     rotate(angle);
     rect(0,0,100,100);
   popMatrix();
  
}
