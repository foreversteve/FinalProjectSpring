class Planet extends MapObject{
   //float xcor,ycor;
   float g;
   //float r;
   
   float direction;
   float distance;
   public Planet(float x, float y,float radius){
     xcor = x;
     ycor = y;
     r = radius;
     g = 0.05;
     // Initialize Particle
     direction = 1.0;
     distance = radius;
   }
   public Planet(){
     xcor = width/2;
     ycor = height/2;
     r = 100;
     g = 0.05;
     // Initialize Particle
     direction = 1.0;
     distance = r;
   }
   
   void display(){
     fill(0,224,224);
     ellipse(xcor,ycor,r,r);
   }
   public void move(){};
   public void shift(){};
   
   void run(Player player){
     display();
     
     update(player);
   }
   
   void run(){
    display(); 
   }
   
   void update(Player user){
     
     float theta = atan((ycor - user.ycor)/(xcor - user.xcor));
     g = 15 / pow(pow(xcor - user.xcor,2)+ pow(ycor-user.ycor,2),0.5);
     if (xcor - user.xcor > 0){
       user.xspeed += g * cos(theta);
       user.yspeed += g * sin(theta);
     }
     else{
       user.xspeed -= g * cos(theta);
       user.yspeed -= g * sin(theta);
     }
     
   }
   
   
   
   void update(Projectile user){
     float theta = atan((ycor - user.ycor)/(xcor - user.xcor));
     g = 15 / pow(pow(xcor - user.xcor,2)+ pow(ycor-user.ycor,2),0.5);
     if (xcor - user.xcor > 0){
       user.xspeed += g * cos(theta);
       user.yspeed += g * sin(theta);
     }
     else{
       user.xspeed -= g * cos(theta);
       user.yspeed -= g * sin(theta);
     }
   }
   
   
   
   void generateParticle(float radius,float number){
     
     if (distance > r + 5 * radius){
       direction = -1;
     }
     if (distance < r/2 + 2){
       direction = 1;
     }
     fill(224,224,224);
     for (float i = 0.0; i <= 360.0; i+=360.0/number){
        float dx = (distance + radius + 2 ) * cos(radians(i));
        float dy = (distance + radius + 2 ) * sin(radians(i));
        ellipse(xcor+dx, ycor + dy, radius, radius);
     }
     distance += 2.5*direction;
     
   }
   
   
 }
