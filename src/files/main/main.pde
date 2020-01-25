PImage persoL1;
PImage persoL2;
PImage persoL3;
PImage persoR;
PImage fondMsg;
int age;
String textMsg;
ArrayList <PImage>persos; //<>//



void setup() {
   
   //fullScreen();
   fullScreen(P2D);
   smooth(0);
   String path = "/assets/ui/";


   persoL1 = loadImage(path+"jose2.png");
   
   persoL2 = loadImage(path+"jose2.png");
   
   persoL3 = loadImage(path+"jose2.png");
   println("la");
   fondMsg = loadImage(path+"fond_msg.png");
   
   persoR = loadImage(path+"persoR.gif");
   
   
   textMsg = "Un texte d'exmple de message de carte Un texte d'exmple de message de carte Un texte d'exmple de message de carte Un texte d'exmple de message de carte Un texte d'exmple de message de carte";
    age = 0;
  
}


void draw() {
  background(0);
  
  drawInterface();
  getGoodPerso();
  putPnjAtRight("0");

  
 //<>// //<>//
}



        
        
void drawInterface() {
    //ajout des personnage sur les cotes
   // getGoodPerso();

 
 
 //Affichage de l'age
   noStroke();
   fill(150);
   float posAgeX = 0.60*displayWidth;
   float posAgeY = 0;
  
   rect(posAgeX, posAgeY, displayWidth - posAgeX, 0.10*displayHeight);
   textSize(32);
  fill(255);
  stroke(204, 102, 0);
  String textAge = "Age : " + age + " ans";

  
  textSize(0.05*displayHeight);
  text(textAge, posAgeX+0.10*displayWidth, posAgeY+0.05*displayHeight);
 
 //affichage message
 textSize(20);
 text(textMsg, persoR.width+0.02*displayWidth, 0.60*displayHeight, displayWidth - (persoR.width *2 + 0.02*displayWidth), 0.20*displayHeight);
  
  
  //affichage 
}


void getGoodPerso() {

  if ( (age >= 0) && (age < 9)) {
      println("heelo");
    image(persoL1, 0, displayHeight - 0.45*displayHeight, 0.20*displayWidth,0.45*displayHeight );  

  }
  
  if ( (age > 9) && (age < 20)) {
    image(persoL2, 0, displayHeight - persoL2.height);  
  }
  
  if ( (age > 20)) {
    image(persoL3, 0, displayHeight - persoL3.height);
  }
  
}

void putPnjAtRight(String cardID) {
  String path ="/assets/cards/";
  PImage pnj = loadImage(path + cardID + "/img/" + "img.jpg");
  
  float width = 0.20*displayWidth;
  float height = 0.45*displayHeight;
  
  image(pnj, displayWidth-width, displayHeight - height,width, height); 
  
}
