class Player {
  private float x;
  private float y;
  private float playerControl;
  private float speedY;
  private int score = 0;
  private float h = 50;
  private float w = 10;
  PFont raleway;
  public Player(float px, float py) {
    x = px;
    y = py;
    speedY = 5;
  }
  public void display() {
    rectMode(CENTER);
    rect(x, y, w, h, 1);
    //raleway = createFont("Raleway-Regular.ttf", 50);
    //textFont(raleway);
    textSize(42);
    fill(0);
    text(score, x-13, 115);
  }

  public void move(Player p) {

    if (p.playerControl == 'w' || p.playerControl == 'i') {
      if (y-12 <= 0+(p.h/2)) {
        speedY = 0;
        y = y + speedY;
      } else {
        speedY = 3.5;
        y = y - speedY;
      }
    } else if (p.playerControl == 's' || p.playerControl == 'k') {
      if (y+(p.h/2) > height-12) {
        speedY = 0;
        y = y + speedY;
      } else {
        speedY = 3.5;
        y = y + speedY;
      }
    } else if (p.playerControl == 'a' || p.playerControl == 'l') {
      speedY = 0;
      y = y + speedY;
    }
  }


  public void increaseScore() {
    score = score + 1;
  }
  public void control(char k) {
    playerControl = k;
  }

  public void reset() {
    y = height/2;
    speedY = 0;
    y = y + speedY;
  }

  public float getPositionY() {
    float yp = y;
    return yp;
  }
}
