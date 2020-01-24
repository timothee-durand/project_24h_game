PImage persoL;
PImage persoR;
PImage fondMsg;
int age;
String textMsg;



void setup() {
   fullScreen();
   String path = "../../assets/ui/";
   persoL = loadImage(path+"persoL.gif");
   persoR = loadImage(path+"persoR.gif");
   fondMsg = loadImage(path+"fond_msg.png");
   
  age = 0;
  
}


void draw() {
  background(0);
  //ajout des personnage sur les cotes
  image(persoL, 0, displayHeight - persoL.height);
  image(persoR, displayWidth-persoR.width, displayHeight - persoR.height);
 
 
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
  println(textAge);
  
  textSize(0.05*displayHeight);
  text(textAge, posAgeX+0.10*displayWidth, posAgeY+0.05*displayHeight);
  
  //affichage du message
  //image(fondMsg, persoL.width, displayHeight - 0.40*displayHeight); //<>// //<>//
  
}
