PImage persoL1;
PImage persoL2;
PImage persoL3;

PImage fondMsg;

<<<<<<< HEAD
=======
PImage pnj;

 //<>//
>>>>>>> 05ade70ef08beb14c568367345a8a529a0b6f777
int timerForTransition;

String textMsg; 
String titleMsg;

ArrayList <PImage>persos;
card carte;
String backgroundName;
String pnjName;

String path = "/assets/ui/";


void setup() {
   
   fullScreen();
   noSmooth();

   persoL1 = loadImage(path+"jose2.png");
   
   persoL2 = loadImage(path+"jose2.png");
   
   persoL3 = loadImage(path+"jose2.png");
   
   fondMsg = loadImage(path+"background_message.gif");
   

   
   
   textMsg = "Un texte d'exmple de message de carte Un texte d'exmple de message de carte Un texte d'exmple de message de carte Un texte d'exmple de message de carte Un texte d'exmple de message de carte";
   println("Creation de la carte");
   carte = new card("0");
   println("carte loadé");
   font = createFont("ARCADECLASSIC.TTF", 32);
   font2 = createFont("yoster.ttf", 32);
   
   changeCard("0");
   
   println("setup done");
   
}


void draw() {
  background(0);
<<<<<<< HEAD
  //  playIntroScene();
//  if (timerForTransition == 0){
  println(carte.checkChoice());
    if(carte.checkChoice() == -1) {
      /*println(backgroundName);*/
      putBackground(backgroundName);
      getGoodPerso();
      putPnjAtRight(pnjName);
      drawInterface(); //<>// //<>//
      carte.draw();
    } 
 println("sortie de boucle");
  //changeCard(str(carte.checkChoice()));
   //}
  //else {
  // timerForTransition--; 
  //}
=======
////  playIntroScene();
//if (timerForTransition == 0){
//  while(carte.checkChoice() ==-1) {
//  putBackground(backgroundName);
// // drawInterface(); //<>// //<>//
//  //getGoodPerso();
//  //putPnjAtRight(pnjName);
//  //carte.draw();
//  } 
  
  
//  changeCard(str(carte.checkChoice()));
//} else {
// timerForTransition--; 
  
//}
    
>>>>>>> 05ade70ef08beb14c568367345a8a529a0b6f777
    
     
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
  String textAge = "Age " + G_player_age + "  ans";

  textFont(font);
  textSize(0.05*displayHeight);
  text(textAge, posAgeX+0.10*displayWidth, posAgeY+0.05*displayHeight);
 
 //affichage message
 float widthMsg = displayWidth - (pnj.width *2 + 0.05*displayWidth); 
  image(fondMsg, pnj.width+0.01*displayWidth,  0.78*displayHeight, widthMsg, (float(fondMsg.height)/float(fondMsg.width))*widthMsg);
 textFont(font2); 
 textSize(20);
 text(textMsg, pnj.width+0.02*displayWidth, 0.80*displayHeight, widthMsg -0.015*displayWidth, 0.20*displayHeight);
  

   
  
 
  
  //affichage 
}


void getGoodPerso() {

  float widthPerso = 0.14*displayWidth;

  if ( (G_player_age >= 0) && (G_player_age < 9)) {
    image(persoL1, 0.03*displayWidth, displayHeight - (float(persoL1.height)/float(persoL1.width))*widthPerso, widthPerso ,(float(persoL1.height)/float(persoL1.width))*widthPerso );  

  }
  
  if ( (G_player_age > 9) && (G_player_age < 20)) {
    image(persoL2,  0.03*displayWidth, displayHeight - (float(persoL2.height)/float(persoL2.width))*widthPerso, widthPerso ,(float(persoL2.height)/float(persoL2.width))*widthPerso );    
  }
  
  if ( (G_player_age > 20)) {
    image(persoL3,  0.03*displayWidth, displayHeight - (float(persoL3.height)/float(persoL3.width))*widthPerso, widthPerso ,(float(persoL3.height)/float(persoL3.width))*widthPerso );  
  }
  
}

void putPnjAtRight(String pnjName) {
<<<<<<< HEAD
  String path ="/assets/ui/";
=======
  String path ="/assets/cards/";
>>>>>>> 05ade70ef08beb14c568367345a8a529a0b6f777
  pnj = loadImage(path + pnjName +  ".png");
  
  float widthPnj = 0.14*displayWidth;
  float heightPnj = (float(pnj.height)/float(pnj.width))*widthPnj;
  
  image(pnj, displayWidth-widthPnj, displayHeight - heightPnj,widthPnj, heightPnj); 
  
  
}

void putBackground(String backgroundName) {
  println(path+backgroundName+".png");
  background = loadImage(path+backgroundName+".png");
  

  image(background, 0, 0, displayWidth, displayHeight);
  
}

void changeCard(String cardId) {
<<<<<<< HEAD
  carte = new card(cardId);
=======
  carte = new card (cardId);
>>>>>>> 05ade70ef08beb14c568367345a8a529a0b6f777
  backgroundName = carte.getBA_Name();
  println("backgroundname" + backgroundName);
  pnjName = carte.getPNJ_Name();
  println("pnjName" + pnjName);
  textMsg = carte.getDi_Text(); 
  println("textMsg" + textMsg);
  titleMsg = carte.getDi_Title();
  println("titleMsg " + titleMsg );
  G_player_age = int(carte.getAG_Age());
  timerForTransition = 30;
}

//void playIntroScene() {
// putBackground();
  
  
//}
