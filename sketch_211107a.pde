int tileSize = 10;
int dimX = 1000;
int dimY = 1000;
Grid grid = new Grid(dimX/tileSize, dimY/tileSize);
boolean fastForward = false;


void settings() {
  size(dimX, dimY);
}

void setup() {
  background(#FFA2EE);
}

void draw() {
  if(keyPressed){
    fastForward = !fastForward;
  }
  
  if(fastForward){
    grid.incrementGameOfLife();
  }
  
  for (int i = 0; i <= dimX; i+= tileSize) {
    line(0, i, dimX, i);
  }
  for (int i = 0; i <= dimY; i+= tileSize) {
    line(i, 0, i, dimY);
  }

  for (int i = 0; i < dimX/tileSize; i++) {
    for (int j = 0; j < dimY/tileSize; j++) {
      if (grid.isAlive(i, j)) {
        fill(#98F4FF);
        rect(i*tileSize, j*tileSize, tileSize, tileSize);
      } else
      {
        fill(#FFA2EE);
        rect(i*tileSize, j*tileSize, tileSize, tileSize);
      }
    }
  }
}

int roundToNearest(int toRound, int rounding) {
  return toRound - toRound % rounding;
}

void mousePressed() {
  int posX =roundToNearest(mouseX, tileSize);
  int posY = roundToNearest(mouseY, tileSize);
  
  int gridPosX = posX/tileSize;
  int gridPosY = posY/tileSize;
  
  if (mouseButton == LEFT) {
    grid.addElement(gridPosX, gridPosY, !grid.isAlive(gridPosX, gridPosY));
  } else if (mouseButton == RIGHT) {
    grid.incrementGameOfLife();
  } else if (mouseButton == CENTER) {
    println(gridPosX,gridPosY,grid.getNeighbours(gridPosX, gridPosY));
  }
}
