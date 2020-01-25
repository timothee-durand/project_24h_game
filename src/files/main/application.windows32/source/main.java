import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.sound.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class main extends PApplet {


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


public void setup() {
   
   
   

  
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


public void draw() {
  background(0);
    

    if(phaseInGame == 1) {
    //  println("checkhoice :" + carte.checkChoice());
     if(isPlayCarton == false) {
        playCarton();
        
        
    } else {
    if(PApplet.parseInt(carte.checkChoice()) == -1) {
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

String G_player_Name;
int G_player_age = 7;

PFont font;
PFont font2;
PImage background;

PImage CardSpritesheet;
PImage VCardSpritesheet;
PImage startButtonSpritesheet;
PImage[] CardSpriteArray = new PImage[6*4];
PImage[] VCardSpriteArray = new PImage[7*5];
PImage[] startButtonArray = new PImage[20];


PImage pnj;
PImage fondAccueil;
PImage fondFin;

int phaseInGame = 0; 

boolean isMusiqueLaunched = false;

int timer = 30;

Animation buttonPressMenu;

int G_anim_menu = 0;
boolean animationButton = false;

boolean isPlayCarton = false;

PImage backgroundCarton;
PImage parchemin;

public void loadSprite()
{
  CardSpritesheet = loadImage("assets/entity/flipH.png");
  VCardSpritesheet = loadImage("assets/entity/flipV.png");
  
  int sizeX = 6;
  int sizeY = 4;
  
  int frameX = CardSpritesheet.width/sizeX;
  int frameY = CardSpritesheet.height/sizeY;
  
  
  //horizontal
  
  short counter = 0;
  for( int k = 0; k < sizeY; k++ )
  { 
    for( int i = 0; i < sizeX; i++ )
    { 
      CardSpriteArray[counter] = CardSpritesheet.get(i*frameX, k*frameY, frameX, frameY);
      counter++;
    }
  }
  
  //vertical
  
  sizeX = 7;
  sizeY = 5;
  
  frameX = VCardSpritesheet.width/sizeX;
  frameY = VCardSpritesheet.height/sizeY;
  
  counter = 0;
  for( int k = 0; k < sizeY; k++ )
  { 
    for( int i = 0; i < sizeX; i++ )
    { 
      VCardSpriteArray[counter] = VCardSpritesheet.get(i*frameX, k*frameY, frameX, frameY);
      counter++;
    }
  }
  
  //
  
  
  /*PImage spritesheet = loadImage("http://www.nordenfelt-thegame.com/blog/wp-content/uploads/2011/11/explosion_transparent.png");
  int DIM = 5;
  PImage[] sprites = new PImage[DIM*DIM];
 
  void setup() {
    size(300, 300);
    imageMode(CENTER);
    int W = spritesheet.width/DIM;
    int H = spritesheet.height/DIM;
    for (int i=0; i<sprites.length; i++) {
      int x = i%DIM*W;
      int y = i/DIM*H;
      sprites[i] = spritesheet.get(x, y, W, H);
    }
   }
 
  void draw() {
    int f255 = frameCount%255;
    background(f255, 255-f255, 0);
    image(sprites[frameCount%sprites.length], mouseX, mouseY);
  }*/
}

public void loadMenuAnim()
{
  
  startButtonSpritesheet = loadImage("assets/Autres/Start.png");

  int sizeY = 20;
  
  int frameX = startButtonSpritesheet.width;
  int frameY = startButtonSpritesheet.height/sizeY;
  
  
  //horizontal
  
  short counter = 0;
  for( int k = 0; k < sizeY; k++ )
  {   
      println(" entree bpicle");
      startButtonArray[counter] = startButtonSpritesheet.get( /*startButtonArray[0].width*/0, k*frameY, frameX, frameY);
      counter++;
  }
  
}

public void AnimateMenu()
{
  while( phaseInGame == 0 ){
    /**/
    G_anim_menu++;
    
    if( G_anim_menu == 20 )
      G_anim_menu = 0;
    /*println(G_anim_menu);*/
    delay(200);
  }
}

public class card{
  
  //attributs
  
  String m_Di_Title;
  String m_Di_Text;
  String m_BA_Name; //background
  String m_AG_Age; //age perso
  String m_PNJ_Name = "null"; //nom pnj
  
  String m_Ef_effect;
  
  String[] m_C1 = { "null", "null", "null" };
  String[] m_C2 = { "null", "null", "null" };
  String[] m_C3 = { "null", "null", "null" };
  String[] m_C4 = { "null", "null", "null" };
  
  PImage m_img;
  
  PVector m_pos = new PVector( 0, 0 );
  
  boolean m_BuffActivateDragging = false;
  PVector m_BuffposMouse = new PVector( 0, 0 );
  
  String m_Id = "";
  float  m_dragLimit = 0.5f;
  short m_BuffReturnedAnswer = -1;
  String m_ReturnedAnswer = "-1";
  
  int HAnim = 0;
  int VAnim = 0;
  
  //constructeur
  
  card( String ID )
  {
    m_Id = ID;
    this.load( ID );
    loadSprite();
  }
  
  //methodes
  
  public void load( String ID )
  {
    /*m_img = loadImage("assets/cards/"+ID+"/img/img.jpg");*/
    
    try{
    String[] lines = loadStrings("assets/cards/"+ID+"/index.txt");
    
    int nbObjet = 0;
    println("Fichier de projet trouvé : " + lines.length + " lignes");
    
    for (int i = 0 ; i < lines.length; i++) {
      
    /*println("ligne \""+lines[i]+"\"");*/
    String simpleRead = ""; //ligne buffer
    
    if(lines[i].contains("[") )
    {
      simpleRead = (lines[i].substring(lines[i].indexOf("[")+1, lines[i].indexOf("]"))); //valeure sauvegardée pour une variable enregistrée sous une forme .nom[valeure]
      
      /*simpleRead.substring( 1, simpleRead.length()-2 );*/
     
    }
    
    if( lines[i].contains("DI[") )
    {
      m_Di_Title = simpleRead.substring(1, simpleRead.indexOf(" |"));
      m_Di_Text = simpleRead.substring(simpleRead.indexOf("|")+2, simpleRead.length()-1);
      
      println("m_Di_Title : "+m_Di_Title);
      println("m_Di_Text : "+m_Di_Text);
    }
    
    if( lines[i].contains("EF[") )
    {
      m_Ef_effect = simpleRead.substring(1, simpleRead.length()-1);
      println("m_Ef_effect : "+m_Ef_effect);
    }
    
    if( lines[i].contains("BA[") )
    {
      m_BA_Name = simpleRead.substring(1, simpleRead.length()-1);
      println("m_BA_Name : "+m_BA_Name);
    }
    
    if( lines[i].contains("PNJ[") )
    {
      m_PNJ_Name = simpleRead.substring(1, simpleRead.length()-1);
      println("m_PNJ_Name : "+m_PNJ_Name);
    }
    
    if( lines[i].contains("AG[") ) //age
    {
      m_AG_Age = simpleRead.substring(1, simpleRead.length()-1);
      println("m_AG_Age : "+m_AG_Age);
    };
    
    if( lines[i].contains("C1[") )
    {
      m_C1[0] = simpleRead.substring(1, simpleRead.indexOf(" |"));
      m_C1[1] = simpleRead.substring(simpleRead.indexOf("|")+2, simpleRead.indexOf(" /"));
      m_C1[2] = simpleRead.substring(simpleRead.indexOf("/")+2, simpleRead.length()-1);
      
      println("m_C1[0] : "+m_C1[0]);
      println("m_C1[1] : "+m_C1[1]);
      println("m_C1[2] : "+m_C1[2]);
    }
    
    if( lines[i].contains("C2[") )
    {
      m_C2[0] = simpleRead.substring(1, simpleRead.indexOf(" |"));
      m_C2[1] = simpleRead.substring(simpleRead.indexOf("|")+2, simpleRead.indexOf(" /"));
      m_C2[2] = simpleRead.substring(simpleRead.indexOf("/")+2, simpleRead.length()-1);
      
      println("m_C2[0] : "+m_C2[0]);
      println("m_C2[1] : "+m_C2[1]);
      println("m_C2[2] : "+m_C2[2]);
    }
    
    if( lines[i].contains("C3[") )
    {
      m_C3[0] = simpleRead.substring(1, simpleRead.indexOf(" |"));
      m_C3[1] = simpleRead.substring(simpleRead.indexOf("|")+2, simpleRead.indexOf(" /"));
      m_C3[2] = simpleRead.substring(simpleRead.indexOf("/")+2, simpleRead.length()-1);
      
      println("m_C3[0] : "+m_C3[0]);
      println("m_C3[1] : "+m_C3[1]);
      println("m_C3[2] : "+m_C3[2]);
    }
    
    if( lines[i].contains("C4[") )
    {
      m_C4[0] = simpleRead.substring(1, simpleRead.indexOf(" |"));
      m_C4[1] = simpleRead.substring(simpleRead.indexOf("|")+2, simpleRead.indexOf(" /"));
      m_C4[2] = simpleRead.substring(simpleRead.indexOf("/")+2, simpleRead.length()-1);
      
      println("m_C4[0] : "+m_C4[0]);
      println("m_C4[1] : "+m_C4[1]);
      println("m_C4[2] : "+m_C4[2]);
    }
    
  }
  println("Fin du chargement");
  }
  catch( java.lang.RuntimeException e )
  {
    println("Le fichier de projet a rencontré un problème ou est introuvable.");
  }
  }
  
  public void draw()
  {
    if( m_pos.x != 0 )
      image(CardSpriteArray[HAnim], displayWidth/2-300/2+m_pos.x, displayHeight/2-((PApplet.parseFloat(CardSpriteArray[0].height)/PApplet.parseFloat(CardSpriteArray[0].width))*300)/2+m_pos.y, 300, (PApplet.parseFloat(CardSpriteArray[0].height)/PApplet.parseFloat(CardSpriteArray[0].width))*300);
    if( m_pos.y != 0 )
      image(VCardSpriteArray[VAnim], displayWidth/2-300/2+m_pos.x, displayHeight/2-((PApplet.parseFloat(VCardSpriteArray[0].height)/PApplet.parseFloat(VCardSpriteArray[0].width))*300)/2+m_pos.y, 300, (PApplet.parseFloat(VCardSpriteArray[0].height)/PApplet.parseFloat(VCardSpriteArray[0].width))*300);
    if( m_pos.y == 0 && m_pos.x == 0 )
      image(CardSpriteArray[HAnim], displayWidth/2-300/2+m_pos.x, displayHeight/2-((PApplet.parseFloat(CardSpriteArray[0].height)/PApplet.parseFloat(CardSpriteArray[0].width))*300)/2+m_pos.y, 300, (PApplet.parseFloat(CardSpriteArray[0].height)/PApplet.parseFloat(CardSpriteArray[0].width))*300);
    
    push();
    textLeading(30);
    fill( 0, 0, 0, 0 );
    if( m_pos.x <= -displayWidth/2/2 || m_pos.y <= -displayHeight/2/2 || m_pos.x >= displayWidth/2/2-1|| m_pos.y >= displayHeight/2/2-1 )
    {
      fill( 0, 0, 0, 250 );
    }
    textAlign(CENTER);
    if( m_pos.x <= -displayWidth/2/2 )
      text(m_C1[0], displayWidth/2-300/2+m_pos.x+50, displayHeight/2-((PApplet.parseFloat(CardSpriteArray[0].height)/PApplet.parseFloat(CardSpriteArray[0].width))*300)/2+m_pos.y, 200, (PApplet.parseFloat(CardSpriteArray[0].height)/PApplet.parseFloat(CardSpriteArray[0].width))*300);
    if( m_pos.x >= displayWidth/2/2-1 )
      text(m_C2[0], displayWidth/2-300/2+m_pos.x+50, displayHeight/2-((PApplet.parseFloat(CardSpriteArray[0].height)/PApplet.parseFloat(CardSpriteArray[0].width))*300)/2+m_pos.y, 200, (PApplet.parseFloat(CardSpriteArray[0].height)/PApplet.parseFloat(CardSpriteArray[0].width))*300);
    if( m_pos.y <= -displayHeight/2/2 )
    {
      image(VCardSpriteArray[31], displayWidth/2-300/2+m_pos.x, displayHeight/2-((PApplet.parseFloat(VCardSpriteArray[0].height)/PApplet.parseFloat(VCardSpriteArray[0].width))*300)/2+m_pos.y, 300, (PApplet.parseFloat(VCardSpriteArray[0].height)/PApplet.parseFloat(VCardSpriteArray[0].width))*300);
      text(m_C3[0], displayWidth/2-300/2+m_pos.x+50, displayHeight/2-((PApplet.parseFloat(CardSpriteArray[0].height)/PApplet.parseFloat(CardSpriteArray[0].width))*300)/2+m_pos.y, 200, (PApplet.parseFloat(CardSpriteArray[0].height)/PApplet.parseFloat(CardSpriteArray[0].width))*300);
    }
    if(m_pos.y >= displayHeight/2/2-1 )
    {
      image(VCardSpriteArray[31], displayWidth/2-300/2+m_pos.x, displayHeight/2-((PApplet.parseFloat(VCardSpriteArray[0].height)/PApplet.parseFloat(VCardSpriteArray[0].width))*300)/2+m_pos.y, 300, (PApplet.parseFloat(VCardSpriteArray[0].height)/PApplet.parseFloat(VCardSpriteArray[0].width))*300);
      text(m_C4[0], displayWidth/2-300/2+m_pos.x+50, displayHeight/2-((PApplet.parseFloat(CardSpriteArray[0].height)/PApplet.parseFloat(CardSpriteArray[0].width))*300)/2+m_pos.y, 200, (PApplet.parseFloat(CardSpriteArray[0].height)/PApplet.parseFloat(CardSpriteArray[0].width))*300);
    }
    
    textAlign(LEFT);
    
    if( m_pos.x <= -displayWidth/2/2 )
      text(m_C1[1], displayWidth/2-300/2+m_pos.x+50, displayHeight/2-((PApplet.parseFloat(CardSpriteArray[0].height)/PApplet.parseFloat(CardSpriteArray[0].width))*300)/2+m_pos.y+150, 200, (PApplet.parseFloat(CardSpriteArray[0].height)/PApplet.parseFloat(CardSpriteArray[0].width))*300);
    if( m_pos.x >= displayWidth/2/2-1 )
      text(m_C2[1], displayWidth/2-300/2+m_pos.x+50, displayHeight/2-((PApplet.parseFloat(CardSpriteArray[0].height)/PApplet.parseFloat(CardSpriteArray[0].width))*300)/2+m_pos.y+150, 200, (PApplet.parseFloat(CardSpriteArray[0].height)/PApplet.parseFloat(CardSpriteArray[0].width))*300);
    if( m_pos.y <= -displayHeight/2/2 )
    {
      text(m_C3[1], displayWidth/2-300/2+m_pos.x+50, displayHeight/2-((PApplet.parseFloat(CardSpriteArray[0].height)/PApplet.parseFloat(CardSpriteArray[0].width))*300)/2+m_pos.y+150, 200, (PApplet.parseFloat(CardSpriteArray[0].height)/PApplet.parseFloat(CardSpriteArray[0].width))*300);
    }
    if(m_pos.y >= displayHeight/2/2-1 )
    {
      text(m_C4[1], displayWidth/2-300/2+m_pos.x+50, displayHeight/2-((PApplet.parseFloat(CardSpriteArray[0].height)/PApplet.parseFloat(CardSpriteArray[0].width))*300)/2+m_pos.y+150, 200, (PApplet.parseFloat(CardSpriteArray[0].height)/PApplet.parseFloat(CardSpriteArray[0].width))*300);
    }
    
    pop();
    /*m_C1[1];*/
    /*String[] m_C2 = { "null", "null", "null" };
    String[] m_C3 = { "null", "null", "null" };
    String[] m_C4 = { "null", "null", "null" };*/
    
    choose();
  }
  
  public String checkChoice()
  {
    return m_ReturnedAnswer;
  }
  
  public void choose()
  {
    if( mousePressed && (mouseButton == LEFT) )
    {
      if( !m_BuffActivateDragging )
      {
        m_BuffposMouse.x = mouseX;
        m_BuffposMouse.y = mouseY;
        m_BuffActivateDragging = true;
      }
       
      if( m_pos.x == 0 && m_pos.y == 0 )
      {
        m_pos.x = mouseX-m_BuffposMouse.x;
        if( m_pos.x == 0 )
          m_pos.y = mouseY-m_BuffposMouse.y;
      }
      
     else if( m_pos.x > 0 && m_pos.y == 0  && m_C2[1].indexOf("null") != 0  ||  m_pos.x < 0 && m_pos.y == 0 && m_C1[1].indexOf("null") != 0  ) //droite / gauche
     {
        m_pos.x = (mouseX-displayWidth/2)*m_dragLimit;
        HAnim = ( abs( floor (mouseX-displayWidth/2)/((displayWidth/2)/20) ));
        
        if( m_pos.x >= displayWidth/2/2-1 )
        {
          println("Droite C2");
          m_BuffReturnedAnswer = 1;
        }
        else if(  m_pos.x <= -displayWidth/2/2 )
        {
          println("Gauche C1");
          m_BuffReturnedAnswer = 0;
        }
        else
        {
          m_BuffReturnedAnswer = -1;
        }
     }
     else if( m_pos.y > 0 && m_pos.x == 0 && m_C4[1].indexOf("null") != 0 || m_pos.y < 0  && m_pos.x == 0  && m_C3[1].indexOf("null") != 0  ) //haut / bas
     {
        m_pos.y = (mouseY-displayHeight/2)*m_dragLimit;
        VAnim = ( abs( ceil ( mouseY-displayHeight/2)/((displayHeight/2)/31) ));
        
        if( m_pos.y >= displayHeight/2/2-1 )
        {
          println("Bas C4");
          m_BuffReturnedAnswer = 3;
        }
        else if(  m_pos.y <= -displayHeight/2/2  )
        {
          println("Haut C3");
          m_BuffReturnedAnswer = 2;
        }
        else
        {
          m_BuffReturnedAnswer = -1;
        }
     }
      
      
    }
    else if( m_BuffReturnedAnswer == -1 )
    {
      m_pos.x = 0;
      m_pos.y = 0;
      m_BuffActivateDragging = false;
      HAnim = 0;
      VAnim = 0;
    }
    else
    {
      println("m_BuffReturnedAnswer : "+ m_BuffReturnedAnswer);
      m_ReturnedAnswer = this.getChoiceID( m_BuffReturnedAnswer );
      println("m_ReturnedAnswer : "+ m_ReturnedAnswer);
      m_pos.x = 0;
      m_pos.y = 0;
      m_BuffActivateDragging = false;
    }
  }
  
  //get methodes
  
  public String getDi_Title()
  {
    return m_Di_Title;
  }
  public String getDi_Text()
  {
    return m_Di_Text;
  }
  
  public String getEf_effect()
  {
    return m_Ef_effect;
  }
  
  public String getChoiceTitle( short nb_Choice )
  {
    if( nb_Choice == 0 )
    {
      return m_C1[0];
    }
    else if( nb_Choice == 1 )
    {
      return m_C2[0];
    }
    else if( nb_Choice == 2 )
    {
      return m_C3[0];
    }
    else if( nb_Choice == 3 )
    {
      return m_C4[0];
    }
    else
    {
      return null;
    }
  }
  
  public String getChoiceTexte( short nb_Choice )
  {
    if( nb_Choice == 0 )
    {
      return m_C1[1];
    }
    else if( nb_Choice == 1 )
    {
      return m_C2[1];
    }
    else if( nb_Choice == 2 )
    {
      return m_C3[1];
    }
    else if( nb_Choice == 3 )
    {
      return m_C4[1];
    }
    else
    {
      return null;
    }
  }
  
  public String getChoiceID( short nb_Choice )
  {
    println("getChoiceID start");
    if( nb_Choice == 0 )
    {
      return m_C1[2];
    }
    else if( nb_Choice == 1 )
    {
      println("getChoiceID end1 : "+m_C2[2]);
      return m_C2[2];
    }
    else if( nb_Choice == 2 )
    {
      return m_C3[2];
    }
    else if( nb_Choice == 3 )
    {
      return m_C4[2];
    }
    else
    {
      return null;
    }
  }
  
  public String getID()
  {
      return m_Id;
  }
  
  public String getBA_Name()
  {
      return m_BA_Name;
  }
  
  public String getAG_Age()
  {
      return m_AG_Age;
  }
  
  public String getPNJ_Name()
  {
    return m_PNJ_Name;
  }
  
  
}




public void mainGameLoop () {
  if ( isMusiqueLaunched == false) {
    file.loop();
    isMusiqueLaunched = true;
  }
  putBackground(backgroundName);
  getGoodPerso();
  putPnjAtRight(pnjName);
  drawInterface(); //<>//
  carte.draw(); //<>//
}


public void drawInterface() {
  //ajout des personnage sur les cotes
  // getGoodPerso();



  //Affichage de l'age

  float posAgeX = 0.70f*displayWidth;
  float posAgeY = 0;


  image(fondAge, posAgeX, posAgeY, displayWidth - posAgeX, (PApplet.parseFloat(fondMsg.height)/PApplet.parseFloat(fondMsg.width))*(displayWidth - posAgeX));
  //textSize(32);
  fill(255);
  stroke(204, 102, 0);
  String textAge = "Age : " + G_player_age + "  ans";

  textLeading(30);
  textFont(font);
  textSize(0.035f*displayHeight);
  text(textAge, posAgeX+0.15f*displayWidth, posAgeY+0.09f*displayHeight);

  //affichage message
  float widthMsg = 0.60f*displayWidth ; 
  image(fondMsg, (displayWidth-widthMsg)/2, 0.78f*displayHeight, widthMsg, (PApplet.parseFloat(fondMsg.height)/PApplet.parseFloat(fondMsg.width))*widthMsg);
  // textFont(font);
  textFont(font2); 
  fill(0);
  textSize(45);
  text(titleMsg, (displayWidth-( widthMsg -0.02f*displayWidth))/2, 0.81f*displayHeight, widthMsg -0.02f*displayWidth, 0.20f*displayHeight);


  fill(255);
  textSize(40);
  text(textMsg, (displayWidth-( widthMsg -0.02f*displayWidth))/2, 0.85f*displayHeight, widthMsg -0.02f*displayWidth, 0.20f*displayHeight);






  //affichage
}


public void getGoodPerso() {

  float widthPerso = 0.14f*displayWidth;

  if ( (G_player_age >= 0) && (G_player_age < 12)) {
    image(persoL1, 0.03f*displayWidth, displayHeight - (PApplet.parseFloat(persoL1.height)/PApplet.parseFloat(persoL1.width))*widthPerso, widthPerso, (PApplet.parseFloat(persoL1.height)/PApplet.parseFloat(persoL1.width))*widthPerso );
  }

  if ( (G_player_age > 12) && (G_player_age < 20)) {
    image(persoL2, 0.03f*displayWidth, displayHeight - (PApplet.parseFloat(persoL2.height)/PApplet.parseFloat(persoL2.width))*widthPerso, widthPerso, (PApplet.parseFloat(persoL2.height)/PApplet.parseFloat(persoL2.width))*widthPerso );
  }

  if ( (G_player_age > 20)) {
    image(persoL3, 0.03f*displayWidth, displayHeight - (PApplet.parseFloat(persoL3.height)/PApplet.parseFloat(persoL3.width))*widthPerso, widthPerso, (PApplet.parseFloat(persoL3.height)/PApplet.parseFloat(persoL3.width))*widthPerso );
  }
}

public void putPnjAtRight(String pnjName) {

  if (pnjName != "null") {

    String path ="/assets/Personnages/";

    pnj = loadImage(path + pnjName +  ".png");

    float widthPnj = 0.14f*displayWidth;
    float heightPnj = (PApplet.parseFloat(pnj.height)/PApplet.parseFloat(pnj.width))*widthPnj;

    image(pnj, displayWidth-widthPnj, displayHeight - heightPnj, widthPnj, heightPnj);
  } else {
    println("Pas de PNJ");
  }
}

public void putBackground(String backgroundName) {

  if (backgroundName == "nul") {
    backgroundName = "street";
  }

  background = loadImage(path+"/Décors/"+backgroundName+".png");


  image(background, 0, 0, displayWidth, displayHeight);
}



public void changeCard(String cardId) {

  carte = new card(cardId);

  carte = new card (cardId);

  backgroundName = carte.getBA_Name();

  pnjName = carte.getPNJ_Name();

  textMsg = carte.getDi_Text(); 
  titleMsg = carte.getDi_Title();
  G_player_age = PApplet.parseInt(carte.getAG_Age());
  timerForTransition = 30;
}

public void playIntroScene() {
  if ( isMusiqueLaunched == false) {
    endMusique.play();
    isMusiqueLaunched = true;
  }
  fill(255);
  //textFont(font);
  //textAlign(CENTER);
  //textSize(0.035*displayHeight);
  //text("The time to Child", 0, 0.40*displayHeight, displayWidth , 0.20*displayHeight);
  image(fondAccueil, 0, 0, displayWidth, displayHeight);

  image(startButtonArray[G_anim_menu], (displayWidth- startButtonArray[G_anim_menu].width*5)/2, 0.70f*displayHeight, 96*5, 10*5 );    
  image(logo, (displayWidth - 0.30f*displayWidth)/2, 0.10f*displayHeight, 0.30f*displayWidth, (PApplet.parseFloat(logo.height)/PApplet.parseFloat(logo.width))*(0.30f*displayWidth));

  textFont(font2); 
  textSize(20);
  textAlign(CENTER);
  //  buttonPressMenu.display((displayWidth - buttonPressMenu.getWidth())/2,0.70*displayHeight);
  //text("Jouer", 0, 0.50*displayHeight, displayWidth, 0.20*displayHeight);

  if ( !animationButton )
  {
    thread("AnimateMenu");
    animationButton = true;
  }


  // text("Quitter", 0, 0.60*displayHeight, displayWidth, 0.20*displayHeight);

  if ((mouseX>displayWidth*0.30f) && (mouseX<displayWidth*0.70f) && (mouseY>0.45f*displayHeight) && (mouseY<0.55f*displayHeight)) {
    //fill(150);
    //text("Jouer", 0, 0.50*displayHeight, displayWidth, 0.20*displayHeight);
    if (mousePressed == true) {
      phaseInGame = 1;
      endMusique.stop();
    }
  }

  if ((keyPressed == true) || (mousePressed == true)) {
    phaseInGame = 1;
  } 

  //if((mouseX>displayWidth*0.30) && (mouseX<displayWidth*0.70) && (mouseY>0.56*displayHeight) && (mouseY<0.65*displayHeight)) {
  //  fill(150);
  //  text("Quitter", 0, 0.60*displayHeight, displayWidth, 0.20*displayHeight);
  //  if(mousePressed == true) {
  //      endMusique.stop();
  //      exit(); 

  //  }
}

public void showEndPannel() {

  if ( isMusiqueLaunched == false) {
    endMusique.play();
    isMusiqueLaunched = true;
    println(isMusiqueLaunched);
  }

  image(fondFin, 0, 0, displayWidth, displayHeight);

  fill(255);
  textFont(font);
  textAlign(CENTER);
  textSize(0.05f*displayHeight);
  text("The End", 0, 0.40f*displayHeight, displayWidth, 0.20f*displayHeight);


  textFont(font2); 
  textSize(50);

  text("Rejouer", 0, 0.55f*displayHeight, displayWidth, 0.20f*displayHeight);

  text("Quitter", 0, 0.65f*displayHeight, displayWidth, 0.20f*displayHeight);

  if ((mouseX>displayWidth*0.30f) && (mouseX<displayWidth*0.70f) && (mouseY>0.50f*displayHeight) && (mouseY<0.60f*displayHeight)) {
    fill(150);
    text("Rejouer", 0, 0.55f*displayHeight, displayWidth, 0.20f*displayHeight);
    if (mousePressed == true) {
      phaseInGame = 3;
      isPlayCarton = false;
    }
  }

  if ((mouseX>displayWidth*0.30f) && (mouseX<displayWidth*0.70f) && (mouseY>0.61f*displayHeight) && (mouseY<0.70f*displayHeight)) {
    fill(150);
    text("Quitter", 0, 0.65f*displayHeight, displayWidth, 0.20f*displayHeight);
    if (mousePressed == true) {
      endMusique.stop();
      exit();
    }
  }
}

public void playCredits() {
  image(fondFin, 0, 0, displayWidth, displayHeight);

  fill(255);
  textFont(font);
  textAlign(CENTER);
  textSize(0.07f*displayHeight);
  text("Credits", 0, 0.20f*displayHeight, displayWidth, 0.20f*displayHeight);

  textSize(0.03f*displayHeight);
  text("Scenario", 0, 0.40f*displayHeight, displayWidth, 0.20f*displayHeight);
  text("Design", 0, 0.60f*displayHeight, displayWidth, 0.20f*displayHeight);
  text("Developpement", 0, 0.80f*displayHeight, displayWidth, 0.20f*displayHeight);

  textSize(0.2f*displayHeight);
  textFont(font2); 
  text("Céleste DESBRUS, MMI1", 0, 0.50f*displayHeight, displayWidth, 0.20f*displayHeight);
  text("Garion TANGUY, MMI1 / Etienne JUBILADO, MMI1 / Tania ANDRE, MMI1", 0, 0.70f*displayHeight, displayWidth, 0.20f*displayHeight);
  text("Allan PINOT, MMI1 / Timothée DURAND, MMI1", 0, 0.90f*displayHeight, displayWidth, 0.20f*displayHeight);

  if ((keyPressed == true) || (mousePressed == true)) {
    if (timer == 0) {
      phaseInGame = 0;
      endMusique.stop();
    } else {
      timer--;
    }
  }
}

public void playCarton () {

  
  println("carton");

  image(backgroundCarton, 0, 0, displayWidth, displayHeight);

  image(parchemin, 0.05f*displayWidth, 0.05f*displayHeight, 0.46f*displayWidth, (PApplet.parseFloat(parchemin.height)/PApplet.parseFloat(parchemin.width))*(0.46f*displayWidth));

  String msgCarton = "José, votre vie est peut-être médiocre, votre bureau miteux et votre femme infidèle mais votre destinée ne s'arrête pas ici… Votre vie touche à sa fin mais peut-être pour vous se présentera bientôt l’occasion de commencer un nouveau chemin.Nous n’avons finalement qu’une chose à dire : bon voyage !";

  textSize(70);
  textFont(font2);
    text(msgCarton, 0.13f*displayWidth, 0.4f*displayHeight, 0.30f*displayWidth, (PApplet.parseFloat(parchemin.height)/PApplet.parseFloat(parchemin.width))*(0.30f*displayWidth));
   
    
    
  
  if ((keyPressed == true) || (mousePressed == true)) {
    if (timer == 0) {
        isPlayCarton = true;
        timer = 30;
    } else {
     timer--; 
    }
    
  } 
}
// Class for animating a sequence of GIFs

class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 4) + ".gif";
      images[i] = loadImage(filename);
    }
  }

  public void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }
  
  public int getWidth() {
    return images[0].width;
  }
}
  public void settings() {  fullScreen();  noSmooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "main" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
