
String G_player_Name;
int G_player_age = 7;

PFont font;
PFont font2;
PFont fontCarton;
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

//PImage chronometre_carton;
PImage flecheTutoD;
PImage flecheTutoG;

int phaseInGame = 0; 

boolean playTuto = true;
int animTuto = 0;
int valAnimTuto = 0;

int credit_timer = 30;
int carton_timer = 30;

Animation buttonPressMenu;

int G_anim_menu = 0;
boolean animationButton = false;

boolean isPlayCarton = false;

PImage backgroundCarton;
PImage parchemin;
