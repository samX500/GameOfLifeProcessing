class Grid {
  private int row;
  private int column;
  private boolean[] grid;

  Grid(int row, int column) {
    this.row = row;
    this.column = column;
    grid = init_grid(row, column);
  }

  private boolean[] init_grid(int row, int column) {
    boolean[] grid = new boolean[row*column];
    for (int i = 0; i < row; i++) {
      for (int j = 0; j < column; j++) {
        grid[row * i  + j] = false;
      }
    }

    return grid;
  }

  public void addElement(int posX, int posY, boolean status) {
    grid[row * posX + posY] = status;
  }

  public boolean isAlive(int posX, int posY) {
    return grid[row * posX + posY];
  }

  public void incrementGameOfLife() {

    int[] neighbours = new int[grid.length];
    for (int i = 0; i < row; i++) {
      for (int j = 0; j < column; j++) {
        neighbours[i * row + j] = getNeighbours(i, j);
      }
    }

    for (int i = 0; i < row; i++) {
      for (int j = 0; j < column; j++) {
        int neighbour = neighbours[i*row+j];
        if (isAlive(i, j)) {
          if (neighbour < 2) {
            addElement(i, j, false);
          } else if (neighbour > 3) {
            addElement(i, j, false);
          }
        } else {
          if (neighbour == 3) {
            addElement(i, j, true);
          }
        }
      }
    }
  }

  public int getNeighbours(int posX, int posY) {
    int neighbours = 0;

    if (isInbounds(posX - 1, posY) && isAlive(posX - 1, posY)) {
      neighbours++;
    }
    if (isInbounds(posX - 1, posY + 1) && isAlive(posX - 1, posY + 1)) {
      neighbours++;
    }
    if (isInbounds(posX, posY + 1) && isAlive(posX, posY + 1)) {
      neighbours++;
    }
    if (isInbounds(posX + 1, posY + 1) && isAlive(posX + 1, posY + 1)) {
      neighbours++;
    }
    if (isInbounds(posX + 1, posY) && isAlive(posX + 1, posY)) {
      neighbours++;
    }
    if (isInbounds(posX + 1, posY - 1) && isAlive(posX + 1, posY -1)) {
      neighbours++;
    }
    if (isInbounds(posX, posY - 1) && isAlive(posX, posY - 1)) {
      neighbours++;
    }
    if (isInbounds(posX - 1, posY - 1) && isAlive(posX - 1, posY - 1)) {
      neighbours++;
    }

    return neighbours;
  }

  private boolean isInbounds(int posX, int posY) {
    return posX >= 0 && posX < row && posY >=0 && posY < column;
  }
}
