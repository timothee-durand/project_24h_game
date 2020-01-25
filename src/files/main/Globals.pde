
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

int phaseInGame = 2; 

boolean isMusiqueLaunched = false;

int timer = 30;

Animation buttonPressMenu;

int G_anim_menu = 0;
boolean animationButton = false;
