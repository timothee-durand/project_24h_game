
void loadSprite()
{
  CardSpritesheet = loadImage("assets/entity/flipH.png");
  
  int sizeX = 6;
  int sizeY = 4;
  
  int frameX = CardSpritesheet.width/sizeX;
  int frameY = CardSpritesheet.height/sizeY;
  
  for( int i = 0; i < CardSpriteArray.length; i++ )
  { 
    int x = i%sizeX*frameX;
    int y = i/sizeY*frameY;
    CardSpriteArray[i] = CardSpritesheet.get(x, y, frameX, frameY);
  }
  
  
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
