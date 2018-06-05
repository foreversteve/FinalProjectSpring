class Moon extends MapObject{
   float g;
   float direction;
   float distance;
   
   Planet star;
   
   String type;
   
   public boolean moves(){
      return false; 
   }
   
   
   
   public Moon(float x, float y,float radius,Planet center){
     xcor = x;
     ycor = y;
     r = radius;
     g = 0.05*r/200;
     
     // Initialize Particle
     
     direction = 1.0;
     
     // Initialize Speeds
     
     star = center;
   }
   
   
   void display(){
     fill(0,224,224);
     ellipse(xcor,ycor,r,r);
   }
   
   void run(){
     display();
     update();
     generateParticle(15,12);
     for(int i = 0; i < world.size(); i++){
        if(world.get(i).moves()){  
            update(world.get(i));
        }
     }
   }
   
   void update(){
     float dxcor = 300 * cos(radians(frameCount));
     float dycor = 300 * sin(radians(frameCount));
     
     this.xcor = star.xcor + dxcor;
     this.ycor = star.ycor + dycor;;
   }
   
   void update(MapObject user){
    
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
     for(float i = 0.0; i <= 360.0; i+=360.0/number){
        float dx = (distance + radius + 2 ) * cos(radians(i));
        float dy = (distance + radius + 2 ) * sin(radians(i));
        ellipse(xcor+dx, ycor + dy, radius, radius);
     }
     distance += 2.5*direction;
     
   }
   
   void takeDamage(MapObject obj){
     
   }
 }
