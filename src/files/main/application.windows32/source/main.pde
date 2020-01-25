import processing.sound.*;
SoundFile file;//musique principale
SoundFile endMusique;



PImage persoL1;
PImage persoL2;
PImage persoL3; //<>// //<>//

PImage fondMsg;
PImage fondAge; //<>// //<>//

PImage logo;




 //<>// //<>//

int timerForTransition;

String textMsg; 
String titleMsg;


ArrayList <PImage>persos;
card carte;
String backgroundName;
String pnjName;

String path = "/assets/";


void setup() {
   
   fullScreen();
   noSmooth();

  
   persoL1 = loadImage(path+"/Personnages/Héros/"+"child_heros.png");
   
   persoL2 = loadImage(path+"/Personnages/Héros/"+"ado_heros.png");
   
   persoL3 = loadImage(path+"/Personnages/Héros/"+"adulte_heros.png");
   
   fondMsg = loadImage(path+"/Autres/"+"Tableau_discussion.png");
   
   fondAge = loadImage(path+"/Autres/"+"Fond_Age.png");
   
   logo = loadImage(path + "/Autres/" + "Logo.png");
   
   backgroundCarton = loadImage(path +"/Décors/"+"bureau.png");
   parchemin= loadImage(path + "/Autres/" +"parchemin.png");
   
   
   fondAccueil = loadImage(path +"/Décors/"+ "fond_accueil.png");
   fondFin = loadImage(path +"/Décors/"+ "fond_fin.png");
   
   file = new SoundFile(this, "/assets/audio/musique_ambiance.mp3");
   endMusique = new SoundFile(this, "/assets/audio/musique_fin.mp3");
    //<>//



   
   
   textMsg = "Un texte d'exmple de message de carte Un texte d'exmple de message de carte Un texte d'exmple de message de carte Un texte d'exmple de message de carte Un texte d'exmple de message de carte";
   println("Creation de la carte");
   carte = new card("0");
   println("carte loadé"); //<>//
   font = createFont(path+"/fonts/"+"8-bit-pusab.ttf", 32);
   font2 = createFont(path+"/fonts/"+"manaspc.ttf", 32);
   
   changeCard("0");
   file.loop();
  
   loadMenuAnim();
   println("setup done");
   
   println("is coraton :"+isPlayCarton);
}


void draw() {
  background(0);
    

    if(phaseInGame == 1) {
    //  println("checkhoice :" + carte.checkChoice());
     if(isPlayCarton == false) {
        playCarton();
        
        
    } else {
    if(int(carte.checkChoice()) == -1) {
      /*println(backgroundName);*/
      endMusique.stop();
      

      mainGameLoop();
    
    } else if (carte.checkChoice().indexOf("end") != -1) {
      println("fin");
      file.stop();
      isMusiqueLaunched = false;
      showEndPannel();
       
    } else {
      changeCard(carte.checkChoice());
      
    }
    }
    } else if(phaseInGame == 2) {
      file.stop();
      showEndPannel();
      
    } else if (phaseInGame == 0 ) {
      playIntroScene();
      
    } else if (phaseInGame == 3 ) {
      playCredits();
      
    } 

// println("sortie de boucle");
    
}
