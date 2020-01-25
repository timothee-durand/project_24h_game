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
      println("checkhoice :" + carte.checkChoice());
    if(int(carte.checkChoice()) == -1) {
      /*println(backgroundName);*/
      mainGameLoop();
    
    } else if (new String(carte.checkChoice()) == "null") {
      println("fin");
      file.stop();
      isMusiqueLaunched = false;
      showEndPannel();
       
    } else {
      changeCard(carte.checkChoice());
      
    }
    
    } else if(phaseInGame == 2) {
      file.stop();
      showEndPannel();
      
    } else if (phaseInGame == 0 ) {
      playIntroScene();
      
    }
// println("sortie de boucle");

    

    
     
}
  

  
 //<>// //<>//
  
