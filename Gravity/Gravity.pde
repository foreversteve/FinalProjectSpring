Player player; 
ArrayList<MapObject> world;
static float MenuNum;
PImage[] planetImages;
float[] radii;
PImage wallPaper,menuImage, friendP, foeP, explosion, ship, turret;
static boolean [] keys = new boolean[128];
 
void map1(){
  Planet testPlanet0 = new Planet(width/2 + 200, height/2 + 200 , 1);
  world.add(new Turret(10,1,"Orange",testPlanet0));
  world.add(testPlanet0);
  
  Planet testPlanet1 = new Planet(width/2 - 2000, height/2 + 3000 , 1);
  world.add(new Turret(10,1,"Orange",testPlanet1));
  world.add(testPlanet1);
  
  Planet testPlanet2 = new Planet(width/2 - 500, height/2 + 400 , 4);
  world.add(new Turret(10,1,"Orange",testPlanet2));
  world.add(testPlanet2);
  
  Planet testPlanet3 = new Planet(width/2 - 3000, height/2 - 3000 , 5);
  world.add(new Turret(10,1,"Orange",testPlanet3));
  world.add(testPlanet3);
  
  Planet testPlanet4 = new Planet(width/2 + 1000, height/2 + 7000 , 6);
  world.add(new Turret(10,1,"Orange",testPlanet4));
  world.add(testPlanet4);
  
  //Moon testMoon0 = new Moon(testPlanet);
  //world.add(testMoon0);
  
  //Moon testMoon1 = new Moon(width/2+500, height/2, 100, testPlanet);
  //world.add(testMoon1);
}
 

void loadImages(){
  planetImages = new PImage[9];
  radii = new float[9];
  
  planetImages[0] = loadImage("mercury.png");
  planetImages[0].resize(200,200);
  radii[0] = 150;
  
  
  planetImages[1] = loadImage("venus.png");
  planetImages[1].resize(250,250);
  radii[1] = 190;
  
  planetImages[2] = loadImage("earth.png");
  planetImages[2].resize(250,250);
  radii[2] = 190;
  
  planetImages[3] = loadImage("mars.png");
  planetImages[3].resize(200,200);
  radii[3] = 150;
  
  planetImages[4] = loadImage("jupiter.png");
  planetImages[4].resize(700,700);
  radii[4] = 525;
  
  planetImages[5] = loadImage("uranus.png");
  planetImages[5].resize(500,500);
  radii[5] = 375;
  
  planetImages[6] = loadImage("neptune.png");
  planetImages[6].resize(400,400);
  radii[6] = 345;
  
  planetImages[7] = loadImage("moon.png");
  planetImages[7].resize(200,200);
  radii[7] = 150;
  
  planetImages[8] = loadImage("sun.png");
  planetImages[8].resize(1000,1000);
  radii[8] = 750;
  
  
  explosion = loadImage("explosion.png");
  
  friendP = loadImage("plasma.png");
  friendP.resize(20,20);
  
  foeP = loadImage("fireball.png");
  foeP.resize(20,20);
  
  wallPaper = loadImage("WallPaper.jpg");
  menuImage = loadImage("Menu.jpg");
  
  ship = loadImage("ship.png");
  ship.resize(100,100);
  
  turret = loadImage("turett.png");
  turret.resize(200,200);
}
 
void setup(){
  fullScreen();
  background(0);
  MenuNum = 0;
  
  loadImages();
  
  player = new Player();
  world = new ArrayList<MapObject>();
  
  world.add(player);
  
  map1();
  
}
 
 
 
void draw(){
  if (MenuNum == 0){
    menu();
  }
  if (MenuNum == 2){
    background(0);
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
  image(menuImage,0,0);
  
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
