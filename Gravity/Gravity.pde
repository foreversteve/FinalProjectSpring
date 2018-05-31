Player player; 
//Map map;
ArrayList<Planet> planets;
ArrayList<Projectile> projectiles;
ArrayList<Turret> turrets;
ArrayList<MapObject> world;
void checkbounds(){
    
}
 
void setup(){
  size(1300,1100);
  background(0);
  
  player = new Player();
  projectiles = new ArrayList<Projectile>();
  planets = new ArrayList<Planet>();
  turrets= new ArrayList<Turret>();
  world = new ArrayList<MapObject>();
  planets.add(new Planet(width/2,height/2,200));
  //planets.add(new Planet(width/3*2,height/2,200));
  turrets.add(new Turret(width/2-25,height/2-105,10,1,"Orange",planets.get(0)));
  planets.get(0).generateParticle(15,18);
  try{
  
    for(Planet x : planets){
      System.out.println(planets.size());
      System.out.println(x.xcor);
      world.add(x); 
   
    }
    
    for(Turret x : turrets){
      world.add(x); 
    }
  
    for(Projectile x : projectiles){
      world.add(x); 
    }
  }catch(NullPointerException e){}
  
 }
 
void draw(){
  background(0);
  player.run(world);
  //scroll();
  for (Turret a: turrets){
    a.run(player);
  }
  for (int i = 0; i < projectiles.size(); i++){
    if (projectiles.get(i).dead){
      projectiles.remove(i);
    }
    else{
      projectiles.get(i).run();
    }
  }
  //print(projectiles.size());
  
  for (Planet x : planets){
    x.run();
    //x.collide(x, player);
    for (Projectile a : projectiles){
      x.update(a);
     // x.collide(x, planets.get(0));
    }
    x.generateParticle(15,18);
    stroke(255);
    line(mouseX-15,mouseY+15,mouseX+15,mouseY-15);
    line(mouseX+15,mouseY+15,mouseX-15,mouseY-15);
    stroke(0);
  }
  //System.out.println(player.xcor);
  
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
