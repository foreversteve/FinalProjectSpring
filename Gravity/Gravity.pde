Player player; 
ArrayList<MapObject> world;
static float MenuNum;
PImage[] planetImages;
float[] radii;
PImage wallPaper,menuImage,menuImage1, friendP, foeP, explosion, ship, turret, enemy;
static boolean [] keys = new boolean[128];



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
  
  wallPaper = loadImage("background.jpg");
  wallPaper.resize(width,height);
  
  menuImage = loadImage("WallPaper.jpg");
  menuImage.resize(width, height);
  
  menuImage1 = loadImage("Menu.jpg");
  
  ship = loadImage("ship.png");
  ship.resize(100,100);
  
  turret = loadImage("turett.png");
  turret.resize(50,50);
}
 


 
void map1(){
  
  Planet testPlanet0 = new Planet(width/2 + 200, height/2 + 200 , 1);
  world.add(new Turret(10,1,"Orange",testPlanet0));
  world.add(testPlanet0);
  /*
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
  
  Moon testMoon0 = new Moon(testPlanet0);
  world.add(testMoon0);
  
  Moon testMoon1 = new Moon(testPlanet2);
  world.add(testMoon1);
  */
  
  AI testAI = new AI(0,0);
  world.add(testAI);
}

void map2(){
  
}

void map3(){
  
}
 



void setup(){
  fullScreen();
  //size(1200,800);
  MenuNum = 0;
  
  loadImages();
  
  player = new Player();
  world = new ArrayList<MapObject>();
  
  world.add(player);
}
 
 
 
void draw(){
  if (MenuNum == 0){
    introMenu();
  }
  if (MenuNum == 1){
    background(wallPaper);
    crossHair();
    for(int i = 0; i < world.size(); i++){
       world.get(i).run(); 
    }     
  }
  if (MenuNum == 2){
    menu3();
  }
}  

void crossHair(){
   stroke(255);
   line(mouseX - 15, mouseY + 15, mouseX + 15, mouseY - 15);
   line(mouseX + 15, mouseY + 15, mouseX - 15, mouseY - 15);
   stroke(0);
}

void introMenu(){
  image(menuImage,0, 0);
  strokeWeight(4);
  textSize(100);
  text("Gravity", (width / 2) - 200, (height / 2) - 100);
  
  textSize(40);
  text("Map 1", (width / 2) - 100, (height / 2) + 50);
  text("Map 2", (width / 2) - 100, (height / 2) + 150);
  text("Map 3", (width / 2) - 100, (height / 2) + 250);
  
  fill(100,100,100);
  rect((width / 2) - 90, (height / 2) + 60, 100, 50);
  rect((width / 2) - 90, (height / 2) + 160, 100, 50);
  rect((width / 2) - 90, (height / 2) + 260, 100, 50);
  fill(255);
}


void menu3(){
  image(menuImage1,0,0);
  
  textSize(100);
  //print(width/2);
  text("Game Over", 600, 250);
  
  textSize(40);
  text("Start New Game", 700, 400);
  
  text("Quit to Title",740,550);
}


void mouseClicked(){
    if (MenuNum == 2){
      setup();
      MenuNum = 1;
    }
    else if (MenuNum == 0){
      if((mouseX > (width / 2) - 90) && (mouseY > (height / 2) + 60) && (mouseX < (width / 2) + 10) && (mouseY < (height / 2) + 110)){
       map1(); 
       MenuNum = 1;
      }
      if((mouseX > (width / 2) - 90) && (mouseY > (height / 2) + 160) && (mouseX < (width / 2) + 10) && (mouseY < (height / 2) + 210)){
       map2(); 
       MenuNum = 1;
      }
      if((mouseX > (width / 2) - 90) && (mouseY > (height / 2) + 260) && (mouseX < (width / 2) + 10) && (mouseY < (height / 2) + 310)){
       map2(); 
       MenuNum = 1;
      }
    }
    else if (MenuNum == 1){
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
