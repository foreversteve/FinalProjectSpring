Player player; 
ArrayList<MapObject> world;
static float MenuNum;
PImage img;
 
void setup(){
  fullScreen();
  //size(1200,900);
  background(0);
  MenuNum = 0;
  img = loadImage("background.jpg");
  
  player = new Player();
  world = new ArrayList<MapObject>();
  
  world.add(player);
  Planet testPlanet = new Planet(width/2 + 200,height/2 + 200 ,200);
  world.add(new Turret(width/2-25 + 200 ,height/2-105 + 200,10,1,"Orange",testPlanet));
  world.add(testPlanet);
}
 
void draw(){
  if (MenuNum == 0){
    menu();
  }
  if (MenuNum == 2){
    background(0);
    menu();
    crossHair();
    for(int i = 0; i < world.size(); i++){
       world.get(i).run(); 
    } 
  }
}  

void crossHair(){
   stroke(255);
   line(mouseX - 15, mouseY + 15, mouseX + 15, mouseY - 15);
   line(mouseX + 15, mouseY + 15, mouseX - 15, mouseY - 15);
   stroke(0);
}

void menu(){
  image(img,0,0);
}

void mouseClicked(){
    if (MenuNum == 0){
      MenuNum = 2;
    }
    else{
      player.fire(7.0);
    }
}
