class Ball {
  private float x;
  private float y;
  private float speedX;
  private float speedY;
  private float h;

  public Ball() {
    reset();
    h = 15;
  }

  public void display() {
    stroke(#f542c8);
    fill(#f542c8);
    circle(x, y, h);
  }

  public void move() {
    x = x + speedX;
    x = constrain(x, 0 +(h/2), width-(h/2));
    if (x + (h/2) >= width || x <= 0+(h/2)) {
      
    }
    y = y + speedY;
    y = constrain(y, 0+(h/2), height-(h/2));
    if (y+(h/2) >= height || y <= 0+(h/2)) {
      speedY = speedY*-1;
    }
  }

  public void reset() {
    x = width/2;
    y = height/2;
    speedX = random(-3, 3);
    if (abs(speedX) < 2) {
      if (speedX < 0) {
        speedX = -3;
      }
      if (abs(speedX) < 1) {
        speedX = 2.5;
      }
      speedY = random(-3, 3);
      if (abs(speedY) < 2) {
        if (speedY < 0) {
          speedY = -3;
        }
      }
      if (abs(speedY) < 1){
        speedX = 2.5;
      }
    }
  }

  public float getPositionX() {
    return x + 5;
  }

  public float getPositionY() {
    return y;
  }

  public void bounce() {
    speedX= speedX * -1.25;
  }

  void checkPlayerCollision(Player p) {
    if ( y - 10/2 < p.y + p.h/2 && y+10/2 > p.y-p.h/2 && x - 10/2 < p.x + p.w/2) {
      if (x+5 > p.x) {
        bounce();
      }
    }
  }
}
