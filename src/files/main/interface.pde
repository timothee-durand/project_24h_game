 //<>// //<>//



void mainGameLoop () {
  if ( isMusiqueLaunched == false) {
    //file.loop();
    isMusiqueLaunched = true;
  }
  putBackground(backgroundName);
  getGoodPerso();
  putPnjAtRight(pnjName);
  drawInterface();
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

  textLeading(30);
  textFont(font);
  textSize(0.035*displayHeight);
  text(textAge, posAgeX+0.15*displayWidth, posAgeY+0.09*displayHeight);

  //affichage message
  float widthMsg = 0.60*displayWidth ; 
  image(fondMsg, (displayWidth-widthMsg)/2, 0.78*displayHeight, widthMsg, (float(fondMsg.height)/float(fondMsg.width))*widthMsg);
  // textFont(font);
  textFont(font2); 
  fill(0);
  textSize(45);
  text(titleMsg, (displayWidth-( widthMsg -0.02*displayWidth))/2, 0.81*displayHeight, widthMsg -0.02*displayWidth, 0.20*displayHeight);


  fill(255);
  textSize(40);
  text(textMsg, (displayWidth-( widthMsg -0.02*displayWidth))/2, 0.85*displayHeight, widthMsg -0.02*displayWidth, 0.20*displayHeight);






  //affichage
}


void getGoodPerso() {

  float widthPerso = 0.14*displayWidth;

  if ( (G_player_age >= 0) && (G_player_age < 12)) {
    image(persoL1, 0.03*displayWidth, displayHeight - (float(persoL1.height)/float(persoL1.width))*widthPerso, widthPerso, (float(persoL1.height)/float(persoL1.width))*widthPerso );
  }

  if ( (G_player_age > 12) && (G_player_age < 20)) {
    image(persoL2, 0.03*displayWidth, displayHeight - (float(persoL2.height)/float(persoL2.width))*widthPerso, widthPerso, (float(persoL2.height)/float(persoL2.width))*widthPerso );
  }

  if ( (G_player_age > 20)) {
    image(persoL3, 0.03*displayWidth, displayHeight - (float(persoL3.height)/float(persoL3.width))*widthPerso, widthPerso, (float(persoL3.height)/float(persoL3.width))*widthPerso );
  }
}

void putPnjAtRight(String pnjName) {

  if (pnjName != "null") {

    String path ="/assets/Personnages/";

    pnj = loadImage(path + pnjName +  ".png");

    float widthPnj = 0.14*displayWidth;
    float heightPnj = (float(pnj.height)/float(pnj.width))*widthPnj;

    image(pnj, displayWidth-widthPnj, displayHeight - heightPnj, widthPnj, heightPnj);
  } else {
    println("Pas de PNJ");
  }
}

void putBackground(String backgroundName) {

  if (backgroundName == "nul") {
    backgroundName = "street";
  }

  background = loadImage(path+"/Décors/"+backgroundName+".png");


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
  if ( isMusiqueLaunched == false) {
    // endMusique.play();
    isMusiqueLaunched = true;
  }
  fill(255);
  //textFont(font);
  //textAlign(CENTER);
  //textSize(0.035*displayHeight);
  //text("The time to Child", 0, 0.40*displayHeight, displayWidth , 0.20*displayHeight);
  image(fondAccueil, 0, 0, displayWidth, displayHeight);

  image(startButtonArray[G_anim_menu], (displayWidth- startButtonArray[G_anim_menu].width*5)/2, 0.70*displayHeight, 96*5, 10*5 );    
  image(logo, (displayWidth - 0.30*displayWidth)/2, 0.10*displayHeight, 0.30*displayWidth, (float(logo.height)/float(logo.width))*(0.30*displayWidth));

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

  if ((mouseX>displayWidth*0.30) && (mouseX<displayWidth*0.70) && (mouseY>0.45*displayHeight) && (mouseY<0.55*displayHeight)) {
    //fill(150);
    //text("Jouer", 0, 0.50*displayHeight, displayWidth, 0.20*displayHeight);
    if (mousePressed == true) {
      phaseInGame = 1;
      //endMusique.stop();
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

void showEndPannel() {

  if ( isMusiqueLaunched == false) {
    //endMusique.play();
    isMusiqueLaunched = true;
    println(isMusiqueLaunched);
  }

  image(fondFin, 0, 0, displayWidth, displayHeight);

  fill(255);
  textFont(font);
  textAlign(CENTER);
  textSize(0.05*displayHeight);
  text("The End", 0, 0.40*displayHeight, displayWidth, 0.20*displayHeight);


  textFont(font2); 
  textSize(50);

  text("Rejouer", 0, 0.55*displayHeight, displayWidth, 0.20*displayHeight);

  text("Quitter", 0, 0.65*displayHeight, displayWidth, 0.20*displayHeight);

  if ((mouseX>displayWidth*0.30) && (mouseX<displayWidth*0.70) && (mouseY>0.50*displayHeight) && (mouseY<0.60*displayHeight)) {
    fill(150);
    text("Rejouer", 0, 0.55*displayHeight, displayWidth, 0.20*displayHeight);
    if (mousePressed == true) {
      phaseInGame = 3;
      isPlayCarton = false;
    }
  }

  if ((mouseX>displayWidth*0.30) && (mouseX<displayWidth*0.70) && (mouseY>0.61*displayHeight) && (mouseY<0.70*displayHeight)) {
    fill(150);
    text("Quitter", 0, 0.65*displayHeight, displayWidth, 0.20*displayHeight);
    if (mousePressed == true) {
      //endMusique.stop();
      exit();
    }
  }
}

void playCredits() {
  image(fondFin, 0, 0, displayWidth, displayHeight);

  fill(255);
  textFont(font);
  textAlign(CENTER);
  textSize(0.07*displayHeight);
  text("Credits", 0, 0.20*displayHeight, displayWidth, 0.20*displayHeight);

  textSize(0.03*displayHeight);
  text("Scenario", 0, 0.40*displayHeight, displayWidth, 0.20*displayHeight);
  text("Design", 0, 0.60*displayHeight, displayWidth, 0.20*displayHeight);
  text("Developpement", 0, 0.80*displayHeight, displayWidth, 0.20*displayHeight);

  textSize(0.2*displayHeight);
  textFont(font2); 
  text("Céleste DESBRUS, MMI1", 0, 0.50*displayHeight, displayWidth, 0.20*displayHeight);
  text("Garion TANGUY, MMI1 / Etienne JUBILADO, MMI1 / Tania ANDRE, MMI1", 0, 0.70*displayHeight, displayWidth, 0.20*displayHeight);
  text("Allan PINOT, MMI1 / Timothée DURAND, MMI1", 0, 0.90*displayHeight, displayWidth, 0.20*displayHeight);

  if ((keyPressed == true) || (mousePressed == true)) {
    if (credit_timer < 0) {
      changeCard("0");
      phaseInGame = 0;
      credit_timer = 30;
    } 
  }
  credit_timer--;
}

void playCarton () {

  image(backgroundCarton, 0, 0, displayWidth, displayHeight);

  image(parchemin, 0.05*displayWidth, 0.05*displayHeight, 0.46*displayWidth, (float(parchemin.height)/float(parchemin.width))*(0.46*displayWidth));

  //float widthChrono = 0.10*displayWidth;
  //float heightChrono = (float(chronometre_carton.height)/float(chronometre_carton.width))*(widthChrono);

  //image(chronometre_carton, displayWidth - widthChrono - 0.005 *displayWidth, displayHeight - heightChrono - 0.005 *displayWidth, widthChrono, heightChrono);

  String msgCarton = "José,\n\n votre vie est peut-être médiocre, votre bureau miteux et votre femme infidèle mais votre destinée ne s'arrête pas ici… \n\nVotre vie touche à sa fin mais peut-être pour vous se présentera bientôt l’occasion de commencer un nouveau chemin. \n\n Nous n’avons finalement qu’une chose à dire : bon voyage !\n\nSigné : Les Créateurs";

  textSize(70);
  textFont(font2);
  textAlign(LEFT);
  fill(255);
  text(msgCarton, 0.13*displayWidth, 0.4*displayHeight, 0.30*displayWidth, (float(parchemin.height)/float(parchemin.width))*(0.30*displayWidth));
  //fill(0);
  //text(str(carton_timer/1000), displayWidth - widthChrono + widthChrono/2, displayHeight - heightChrono + heightChrono/2 , 0.50*widthChrono, 0.50*heightChrono);




  if ((keyPressed == true) || (mousePressed == true)) {
    if (carton_timer < 0) {
      isPlayCarton = true;
      carton_timer = 30;
    }
  }

  carton_timer--;

  //println(carton_timer);
}

void playOtherMusic() {  
  if (ambiance_music_player.isPlaying() == true) {
    ambiance_music_player.pause();
    ambiance_music_player.rewind();
  }

  if ( other_music_player.isPlaying() == false ) {
    other_music_player.loop();
  }
}

void playAmbianceMusic() {  
  if (other_music_player.isPlaying() == true) {
    other_music_player.pause();
    other_music_player.rewind();
  }

  if ( ambiance_music_player.isPlaying() == false ) {
    ambiance_music_player.loop();
  }
}
