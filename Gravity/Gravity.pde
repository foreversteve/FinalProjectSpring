Player player; 
ArrayList<MapObject> world;
static float MenuNum;
PImage img,img1,img2;
static boolean [] keys = new boolean[128];
 
void setup(){
  fullScreen();
  //size(1200,900);
  background(0);
  MenuNum = 0;
  
  img = loadImage("venus-transparent.png");
  img1 = loadImage("WallPaper.jpg");
  img2 = loadImage("Menu.jpg");
  
  player = new Player();
  world = new ArrayList<MapObject>();
  
  world.add(player);
  Planet testPlanet = new Planet(width/2 + 200,height/2 + 200 ,200);
  //world.add(new Turret(width/2-25 + 200 ,height/2-105 + 200,10,1,"Orange",testPlanet));
  world.add(testPlanet);
  
  Moon testMoon0 = new Moon(width/2-100,height/2,100,testPlanet);
  world.add(testMoon0);
  
  Moon testMoon1 = new Moon(width/2+500, height/2, 100, testPlanet);
  world.add(testMoon1);
}
 
void draw(){
  if (MenuNum == 0){
    menu();
  }
  if (MenuNum == 2){
    background(0);
    //image(img,0,0);
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
  image(img1,0,0);
  
  textSize(100);
  //print(width/2);
  text("Gravity", 690, 250);
  
  textSize(40);
  text("Start Game", 750, 400);
  
  text("Quit",810,550);
}

void mouseClicked(){
    if (MenuNum == 0){
      MenuNum = 2;
    }
    else{
      player.fire(7.0);
    }
}
void keyPressed(){
  try{
    Gravity.keys[key] = true;
  }
  catch(ArrayIndexOutOfBoundsException e){
    
  }
  }
 
  void keyReleased(){
    try{
      Gravity.keys[key] = false;
    }
     catch(ArrayIndexOutOfBoundsException e){
    
    }
  }
