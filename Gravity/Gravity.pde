Player player; 
//Map map;
ArrayList<Planet> planets;
ArrayList<Projectile> projectiles;
ArrayList<Turret> turrets;
ArrayList<MapObject> world;
void checkbounds(){
    
}
 
void setup(){
  //fullScreen();
  size(1200,900);
  background(0);
  
  player = new Player();
  world = new ArrayList<MapObject>();
  
  world.add(player);
  
  world.add(new Planet(width/2 + 200,height/2 + 200 ,200));
  //planets.add(new Planet(width/3*2,height/2,200));
  world.add(new Turret(width/2-25 + 200 ,height/2-105 + 200,10,1,"Orange",(Planet) world.get(1)));
  //planets.get(0).generateParticle(15,18);
  /*
  try{
  
    for(Turret x : turrets){
      world.add(x); 
    }
    
    for(Planet x : planets){
      System.out.println(planets.size());
      System.out.println(x.xcor);
      world.add(x); 
   
    }
    
    
  
    for(Projectile x : projectiles){
      world.add(x); 
    }
  }catch(NullPointerException e){}
  */
  
}
 
void draw(){
  background(0);
  
 
  for(int i = 0; i < world.size(); i++){
     world.get(i).run(); 
  }
  
  /*
  player.run();

  for (Turret a: turrets){
    a.run();
  }
  
  for (int i = 0; i < projectiles.size(); i++){
    //if (projectiles.get(i).dead){
   //   projectiles.remove(i);
   // }
   // else{
      projectiles.get(i).run();
    //}
  }
  
  
  
  
  //print(projectiles.size());
  
  for (Planet x : planets){
    x.run();
    //x.collide(x, player);
    for (Projectile a : projectiles){
      //x.update(a);
     // x.collide(x, planets.get(0));
     //x.collide(x,a);
    }
    
    x.generateParticle(15,18);
    
  }
  
  
  
  */
  
  
    stroke(255);
    line(mouseX-15,mouseY+15,mouseX+15,mouseY-15);
    line(mouseX+15,mouseY+15,mouseX-15,mouseY-15);
    stroke(0);
  
}

  
void keyPressed(){
  try{
    player.keys[key] = true;
  }
  catch(ArrayIndexOutOfBoundsException e){
    
  }
}
 
void keyReleased(){
  try{
    player.keys[key] = false;
  }
  catch(ArrayIndexOutOfBoundsException e){
    
  }
}

void mouseClicked(){
    player.fire(7.0);
}
