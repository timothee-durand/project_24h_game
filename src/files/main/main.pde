 //import processing.sound.*;
//SoundFile file;//musique principale
//SoundFile endMusique;
import javax.swing.JOptionPane;
import java.util.*;
import ddf.minim.*; //lib son

//pour le son
Minim minim;
AudioPlayer ambiance_music_player;
AudioPlayer other_music_player;

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
   
   
    // we pass this to Minim so that it can load files from the data directory
  minim = new Minim(this);
  
  
  try {
  
   persoL1 = loadImage(path+"Personnages/Héros/"+"child_heros.png");
   
   persoL2 = loadImage(path+"Personnages/Héros/"+"ado_heros.png");
   
   persoL3 = loadImage(path+"Personnages/Héros/"+"adulte_heros.png");
   
   fondMsg = loadImage(path+"Autres/"+"Tableau_discussion.png");
   
   fondAge = loadImage(path+"Autres/"+"Fond_Age.png");
   
   logo = loadImage(path + "Autres/" + "Logo.png");
   
   backgroundCarton = loadImage(path +"Décors/"+"bureau.png");
   parchemin= loadImage(path + "Autres/" +"parchemin.png");
   //chronometre_carton = loadImage(path + "Autres/" +"chrono.png");
   flecheTutoD = loadImage(path + "Autres/" +"flecheD.png");
   flecheTutoG = loadImage(path + "Autres/" +"flecheG.png");
   flecheTutoH = loadImage(path + "Autres/" +"flecheH.png");
   
   fondAccueil = loadImage(path +"Décors/"+ "fond_accueil.png");
   fondFin = loadImage(path +"Décors/"+ "fond_fin.png");
   
   font = createFont(path+"/fonts/"+"8-bit-pusab.ttf", 32);
   font2 = createFont(path+"/fonts/"+"manaspc.ttf", 32);
   fontCarton = createFont(path+"/fonts/"+"manaspc.ttf", 12);
   
  } catch  (Exception e) {
    JOptionPane.showMessageDialog(null, "Erreur", "Un fichier n'a pas pu être chargé !", JOptionPane.ERROR_MESSAGE);
    
}
try {
  
  ambiance_music_player = minim.loadFile(path + "audio/"+"musique_ambiance.mp3");
  other_music_player = minim.loadFile(path + "audio/"+"musique_fin.mp3");
  
   } catch  (Exception e) {
     
    JOptionPane.showMessageDialog(null,"Le jeu n'a pas réussi à charger le son ! Mais ne t'en fais pas maintenant tu peux quand même jouer :)", "Damn it !", JOptionPane.ERROR_MESSAGE);
    musicWork = false;
}
  // file = new SoundFile(this, "/assets/audio/musique_ambiance.mp3");
   //endMusique = new SoundFile(this, "/assets/audio/musique_fin.mp3");
    //<>//
  surface.setIcon(logo);
  frame.setTitle("Time to child");


   
   
   textMsg = "Un texte d'exmple de message de carte Un texte d'exmple de message de carte Un texte d'exmple de message de carte Un texte d'exmple de message de carte Un texte d'exmple de message de carte";
   println("Creation de la carte");
   carte = new card("0");
   println("carte loadé"); //<>//
   font = createFont(path+"/fonts/"+"8-bit-pusab.ttf", 32);
   font2 = createFont(path+"/fonts/"+"manaspc.ttf", 32);
   
   changeCard("0");
  
   loadMenuAnim();
   println("setup done");

}


void draw() {
  background(0);
    

    if(phaseInGame == 1) {
        
    if(isPlayCarton == false) {
        playCarton();
        playOtherMusic();
    } else {
    if(int(carte.checkChoice()) == -1) {
      playAmbianceMusic(); 
      mainGameLoop();
    
    } else if (carte.checkChoice().indexOf("end") == 0) {
      println("fin");
      
      phaseInGame=3;
       
    } else {
      changeCard(carte.checkChoice());
    }
    }
    } else if(phaseInGame == 2) {
      
      playOtherMusic();
      showEndPannel();
      
    } else if (phaseInGame == 0 ) {
      playOtherMusic();
      playIntroScene();
      
    } else if (phaseInGame == 3 ) {
      playOtherMusic();
      playCredits();   
    } 

// println("sortie de boucle");
    
}

//void keyPressed() {
//  switch (phaseInGame) {
//    case 0 :
//      phaseInGame = 1;
//      break;
//    case 1 : 
//      if(isPlayCarton == false) {
//         if (carton_timer < 0) {
//            isPlayCarton = true;
//            carton_timer = 30;
//          }  
//      }
//      break;
//      case 3 :
//        if (credit_timer < 0) {
//          changeCard("0");
//          phaseInGame = 0;
//          credit_timer = 30;
//        }
//      break;
//      default: 
//  }
  
//}
