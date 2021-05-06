Ball ball;
Player player1;
Player player2;
Bg p1goal;
Bg p2goal;
PImage image;
boolean roundOver;

void setup() {
  image = loadImage("background.png");
  size(1280, 720);
  ball = new Ball();
  player1 = new Player(50, 300); 
  player2 = new Player(1230, 300);
  p1goal = new Bg(5, #9400D3);
  p2goal = new Bg(1274, #9400D3);
  roundOver = false;
  println("Player 1 Controls: 'W'= UP 'S'= DOWN 'A'= STOP");
  println("Player 2 Controls: 'I'= UP 'K'= DOWN 'L'= STOP");
}

void draw() {
  background(image);
  ball.display();
  stroke(255, 0 ,0);
  fill(255,0,0);
  player1.display();
  player1.move(player1);
  stroke(0,0,255);
  fill(0,0, 255);
  player2.display();
  player2.move(player2);
  
  p1goal.display();
  p2goal.display();
  
  ball.checkPlayerCollision(player1);
  ball.checkPlayerCollision(player2);
  
  if (!roundOver) {
    if (ball.getPositionX() <= p1goal.getPosition()+(ball.h/2)) {
      roundOver = true;
      player2.increaseScore();
      println("Press R to restart");
    } else if (ball.getPositionX() >= p2goal.getPosition()) {
      roundOver = true;
      player1.increaseScore();
      println("Press R to restart");
    } else {
      ball.move();
    }
  }

  if (roundOver) {
    fill(0);
    text("Press R to restart", 25, 680);
  }
}

void keyPressed() {
  if (key == 'w' || key == 's' || key == 'a') {
    player1.control(key);
  } else if (key == 'r') {
    ball.reset(); 
    player1.reset();
    player2.reset();
    roundOver = false;
  }else if (key == 'i' || key == 'k' || key == 'l'){
    player2.control(key);
  }
}
