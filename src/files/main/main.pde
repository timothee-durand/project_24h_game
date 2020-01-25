PImage persoL1;
PImage persoL2;
PImage persoL3;
PImage persoR;
PImage fondMsg;

<<<<<<< HEAD
int age;
String textMsg; //<>// //<>//
=======

String textMsg; //<>//
>>>>>>> ffe44a95181186ab389e24fed76dea5c75812acf
ArrayList <PImage>persos;
card UneCarteTest;

String path = "/assets/ui/";


void setup() {
   
   fullScreen();
   noSmooth();

   persoL1 = loadImage(path+"jose2.png");
   
   persoL2 = loadImage(path+"jose2.png");
   
   persoL3 = loadImage(path+"jose2.png");
   println("la");
   fondMsg = loadImage(path+"background_message.gif");
   
   persoR = loadImage(path+"persoR.gif");
   
   
   textMsg = "Un texte d'exmple de message de carte Un texte d'exmple de message de carte Un texte d'exmple de message de carte Un texte d'exmple de message de carte Un texte d'exmple de message de carte";
   UneCarteTest = new card("0");
   
   font = createFont("ARCADECLASSIC.TTF", 32);
   font2 = createFont("yoster.ttf", 32);
}


void draw() {
  background(0);
  putBackground("background_classe");
  drawInterface(); //<>// //<>//
  getGoodPerso();
  putPnjAtRight("0");
  UneCarteTest.draw();

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

  textFont(font);
  textSize(0.05*displayHeight);
  text(textAge, posAgeX+0.10*displayWidth, posAgeY+0.05*displayHeight);
 
 //affichage message
 float widthMsg = displayWidth - (persoR.width *2 + 0.05*displayWidth); 
  image(fondMsg, persoR.width+0.01*displayWidth,  0.78*displayHeight, widthMsg, (float(fondMsg.height)/float(fondMsg.width))*widthMsg);
 textFont(font2); 
 textSize(20);
 text(textMsg, persoR.width+0.02*displayWidth, 0.80*displayHeight, widthMsg -0.015*displayWidth, 0.20*displayHeight);
  

   
  
 
  
  //affichage 
}


void getGoodPerso() {

  float widthPerso = 0.14*displayWidth;

    image(persoL1, 0.03*displayWidth, displayHeight - (float(persoL1.height)/float(persoL1.width))*widthPerso, widthPerso ,(float(persoL1.height)/float(persoL1.width))*widthPerso );  

  }
  
    image(persoL2,  0.03*displayWidth, displayHeight - (float(persoL2.height)/float(persoL2.width))*widthPerso, widthPerso ,(float(persoL2.height)/float(persoL2.width))*widthPerso );    
  }
  
    image(persoL3,  0.03*displayWidth, displayHeight - (float(persoL3.height)/float(persoL3.width))*widthPerso, widthPerso ,(float(persoL3.height)/float(persoL3.width))*widthPerso );  
  }
  
}

void putPnjAtRight(String cardID) {
  String path ="/assets/cards/";
  PImage pnj = loadImage(path + cardID + "/img/" + "img.jpg");
  
  float widthPnj = 0.14*displayWidth;
  float heightPnj = (float(pnj.height)/float(pnj.width))*widthPnj;
  
  image(pnj, displayWidth-widthPnj, displayHeight - heightPnj,widthPnj, heightPnj); 
  
  
}

void putBackground(String nomBackground) {
  
  background = loadImage(path+nomBackground+".png");

  image(background, 0, 0, displayWidth, displayHeight);
}
