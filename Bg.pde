class Bg {
  private float goal;
  private int col;

  public Bg(float g, int c) {
    goal = g;
    col = c;
  }

  public void display() {
    stroke(col);
    strokeWeight(11);
    line(goal, 0, goal, height);
  }

  public float getPosition() {
    return goal;
  }
}
