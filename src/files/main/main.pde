import processing.sound.*;
SoundFile file;//musique principale
SoundFile endMusique;



PImage persoL1;
PImage persoL2;
PImage persoL3; //<>//

PImage fondMsg;
PImage fondAge; //<>//

PImage logo;




 //<>//

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
   
   fondAge = loadImage(path+"Fond_Age.png");
   
   logo = loadImage(path + "logo.png");
   
   file = new SoundFile(this, "/assets/audio/musique_ambiance.mp3");
   endMusique = new SoundFile(this, "/assets/audio/musique_fin.mp3");
   
   buttonPressMenu = new Animation(path + "start.gif", 38);


   
   
   textMsg = "Un texte d'exmple de message de carte Un texte d'exmple de message de carte Un texte d'exmple de message de carte Un texte d'exmple de message de carte Un texte d'exmple de message de carte";
   println("Creation de la carte");
   carte = new card("0");
   println("carte loadé"); //<>//
   font = createFont("8-bit-pusab.ttf", 32);
   font2 = createFont("manaspc.ttf", 32);
   
   changeCard("0");
  file.loop();
   println("setup done");
   
}


void draw() {
  background(0);


    if(phaseInGame == 1) {
    if(int(carte.checkChoice()) == -1) {
      /*println(backgroundName);*/
      mainGameLoop();
    
    } else if (new String(carte.checkChoice()) == "null") {
      file.stop();
      isMusiqueLaunched = false;
      showEndPannel();
       
    }
    
    } else if(phaseInGame == 2) {
      file.stop();
      showEndPannel();
      
    } else if (phaseInGame == 0 ) {
      playIntroScene();
      
    }
// println("sortie de boucle");

    

    
     
}
  
void showEndPannel() {

    if( isMusiqueLaunched == false) {
      endMusique.play();
      isMusiqueLaunched = true;
      println(isMusiqueLaunched);
    }
    
      fill(255);
    textFont(font);
    textAlign(CENTER);
    textSize(0.035*displayHeight);
    text("The End", 0, 0.40*displayHeight, displayWidth , 0.20*displayHeight);
    
    
    textFont(font2); 
     textSize(20);

    text("Rejouer", 0, 0.50*displayHeight, displayWidth, 0.20*displayHeight);
    
    text("Quitter", 0, 0.60*displayHeight, displayWidth, 0.20*displayHeight);
  
  if((mouseX>displayWidth*0.30) && (mouseX<displayWidth*0.70) && (mouseY>0.45*displayHeight) && (mouseY<0.55*displayHeight)) {
    fill(150);
    text("Rejouer", 0, 0.50*displayHeight, displayWidth, 0.20*displayHeight);
    if(mousePressed == true) {
        phaseInGame = 1;
        endMusique.stop();
    }
  }
  
  if((mouseX>displayWidth*0.30) && (mouseX<displayWidth*0.70) && (mouseY>0.56*displayHeight) && (mouseY<0.65*displayHeight)) {
    fill(150);
    text("Quitter", 0, 0.60*displayHeight, displayWidth, 0.20*displayHeight);
    if(mousePressed == true) {
        endMusique.stop();
        exit(); 
        
    }
  }
}
  
void mainGameLoop () {
     if( isMusiqueLaunched == false) {
        file.loop();
        isMusiqueLaunched = true;

      }
      putBackground(backgroundName);
      getGoodPerso();
      putPnjAtRight(pnjName);
      drawInterface(); //<>// //<>//
      carte.draw();
}


  
  




        
        
void drawInterface() {
    //ajout des personnage sur les cotes
   // getGoodPerso();

 
 
 //Affichage de l'age

   float posAgeX = 0.70*displayWidth;
   float posAgeY = 0;
  

  image(fondAge, posAgeX, posAgeY, displayWidth - posAgeX, (float(fondMsg.height)/float(fondMsg.width))*(displayWidth - posAgeX));
  //textSize(32);
  fill(255);
  stroke(204, 102, 0);
  String textAge = "Age : " + G_player_age + "  ans";

  textFont(font);
  textSize(0.035*displayHeight);
  text(textAge, posAgeX+0.05*displayWidth, posAgeY+0.11*displayHeight);
 
 //affichage message
 float widthMsg = 0.60*displayWidth ; 
  image(fondMsg, (displayWidth-widthMsg)/2,  0.78*displayHeight, widthMsg, (float(fondMsg.height)/float(fondMsg.width))*widthMsg);
 textFont(font2); 
 textSize(20);
 text(textMsg, (displayWidth-( widthMsg -0.02*displayWidth))/2, 0.80*displayHeight, widthMsg -0.015*displayWidth, 0.20*displayHeight);
  

   
  
 
  
  //affichage 
}


void getGoodPerso() {

  float widthPerso = 0.14*displayWidth;

  if ( (G_player_age >= 0) && (G_player_age < 9)) {
    image(persoL1, 0.03*displayWidth, displayHeight - (float(persoL1.height)/float(persoL1.width))*widthPerso, widthPerso ,(float(persoL1.height)/float(persoL1.width))*widthPerso );  
 //<>//
  }
  
  if ( (G_player_age > 9) && (G_player_age < 20)) {
    image(persoL2,  0.03*displayWidth, displayHeight - (float(persoL2.height)/float(persoL2.width))*widthPerso, widthPerso ,(float(persoL2.height)/float(persoL2.width))*widthPerso );    
  }
  
  if ( (G_player_age > 20)) {
    image(persoL3,  0.03*displayWidth, displayHeight - (float(persoL3.height)/float(persoL3.width))*widthPerso, widthPerso ,(float(persoL3.height)/float(persoL3.width))*widthPerso );  
  }
  
}

void putPnjAtRight(String pnjName) {
  
  if(pnjName != "null") {

    String path ="/assets/ui/";
  
    pnj = loadImage(path + pnjName +  ".png");
    
    float widthPnj = 0.14*displayWidth;
    float heightPnj = (float(pnj.height)/float(pnj.width))*widthPnj;
    
    image(pnj, displayWidth-widthPnj, displayHeight - heightPnj,widthPnj, heightPnj); 
  
  } else {
    println("Pas de PNJ");
    
  }
  
}

void putBackground(String backgroundName) {
  
  if(backgroundName == "nul") {
    backgroundName = "street";
  }
  
  background = loadImage(path+backgroundName+".png");
  

  image(background, 0, 0, displayWidth, displayHeight);
  
}



void changeCard(String cardId) {

  carte = new card(cardId);

  carte = new card (cardId);

  backgroundName = carte.getBA_Name();

  pnjName = carte.getPNJ_Name();

  textMsg = carte.getDi_Text(); 
  titleMsg = carte.getDi_Title();
  G_player_age = int(carte.getAG_Age());
  timerForTransition = 30;
}

void playIntroScene() {
    if( isMusiqueLaunched == false) {
      endMusique.play();
      isMusiqueLaunched = true;
    }
        fill(255);
    //textFont(font);
    //textAlign(CENTER);
    //textSize(0.035*displayHeight);
    //text("The time to Child", 0, 0.40*displayHeight, displayWidth , 0.20*displayHeight);

    
    image(logo, (displayWidth - logo.width)/2, 0.10*displayHeight, 0.20*displayWidth, (float(logo.height)/float(logo.width))*(0.20*displayWidth));
    
    textFont(font2); 
    textSize(20);
    textAlign(CENTER);
  //  buttonPressMenu.display((displayWidth - buttonPressMenu.getWidth())/2,0.70*displayHeight);
  text("Jouer", 0, 0.50*displayHeight, displayWidth, 0.20*displayHeight);
   
    
   // text("Quitter", 0, 0.60*displayHeight, displayWidth, 0.20*displayHeight);
  
  if((mouseX>displayWidth*0.30) && (mouseX<displayWidth*0.70) && (mouseY>0.45*displayHeight) && (mouseY<0.55*displayHeight)) {
    fill(150);
    text("Jouer", 0, 0.50*displayHeight, displayWidth, 0.20*displayHeight);
    if(mousePressed == true) {
        phaseInGame = 1;
        endMusique.stop();
    }
  }
  
  //if((mouseX>displayWidth*0.30) && (mouseX<displayWidth*0.70) && (mouseY>0.56*displayHeight) && (mouseY<0.65*displayHeight)) {
  //  fill(150);
  //  text("Quitter", 0, 0.60*displayHeight, displayWidth, 0.20*displayHeight);
  //  if(mousePressed == true) {
  //      endMusique.stop();
  //      exit(); 
        
  //  }
  }
  
  
