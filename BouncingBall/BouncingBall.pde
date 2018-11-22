public ArrayList<Balls> balls = new ArrayList(); //<>// //<>// //<>// //<>// //<>// //<>// //<>//
public ArrayList<Balls> bigBalls = new ArrayList();
Integer count = 0;
Integer baseSpeed = 1;
Integer nbBall = 0;
Integer offset = 60;

void setup() { 

  size(500, 500);
  Balls bigBall= new Balls(height/2, width/2, 0, 0, 0.0, 0.0, 150);
  for (int i = 0; i < nbBall; i++) {
    balls.add(createRandomBalls());
  }
  bigBalls.add(bigBall);
}

void draw() {

  background(150); 
  for (Balls ball : balls) {

    ball.move();

    for (Balls bigBall : bigBalls) {
      if (ball.detecColid(bigBall)) {
        bigBall.setBallColor(new Color(0, 150, 0));
      }
    }

    for (Balls ball2 : balls) {
      if (!ball.equals(ball2)) {
        if (ball.detecColid(ball2)) {
          ball.changeRmdColor();
          ball2.changeRmdColor();
        }
      }
    }
  } 

  for (Balls bigBall : bigBalls) {
    bigBall.move();
    bigBall.setBallColor(new Color(50, 0, 255));
  }

  if (mousePressed && mouseButton == LEFT) {
    //dragBall(balls);
    dragBall(bigBalls);
  }
}

//public void mousePressed() {}

public void mouseReleased() { 
  if (mouseButton == LEFT) {
      balls.add(createRandomBalls(mouseX, mouseY));
      
    
  }
  // test si le click est sur un balle
  // set X,Y, pour suivre la souris


  if (mouseButton == RIGHT) {
    if (balls.size() > 0) {
        balls.remove(balls.size()-1);
      }
  }

  if (mouseButton == CENTER) {
    balls.clear();
    bigBalls.clear();
    //--//
  }
}

void keyReleased() {
  if (key == 'r') {
    bigBalls.add(new Balls(mouseX, mouseY, 0, 0, 0.0, 0.0, 150));
  } 

  if (key == 'f') {
    if (bigBalls.size() > 0) {
      bigBalls.remove(bigBalls.size()-1);
    }
  }
  if (key == 'e') {
   balls.add(createRandomBalls(mouseX, mouseY));
   } 
   /*
   if (key == 'd') {    
   if (balls.size() > 0) {
   balls.remove(balls.size()-1);
   }
   }*/
}

void keyPressed() {
  /*
  if (key == 'e') {
   balls.add(createRandomBalls(mouseX, mouseY));
   } 
   if (key == 'd') {    
   if (balls.size() > 0) {
   balls.remove(balls.size()-1);
   }
   }
   */
}
public Balls createRandomBalls() {   
  Double rmdX = Math.random() * height;
  Double rmdY = Math.random() * width;
  int rmdSpeed1 = Math.random() > 0.5 ? baseSpeed : -baseSpeed;
  int rmdSpeed2 = Math.random() > 0.5 ? baseSpeed : -baseSpeed;

  Balls ball = new Balls(rmdX.intValue(), rmdY.intValue(), rmdSpeed1, rmdSpeed2, 1.2, 1.2, 40);
  // Balls ball = new Balls(height/2, width/2, 1, 1, 40);
  ball.changeRandomDirection();
  return ball;
}


public Balls createRandomBalls(Integer x, Integer y) {   
  int rmdSpeed1 = Math.random() > 0.5 ? baseSpeed : -baseSpeed;
  int rmdSpeed2 = Math.random() > 0.5 ? baseSpeed : -baseSpeed;

  Balls ball = new Balls(x, y, rmdSpeed1, rmdSpeed2, 1.2, 1.2, 40);
  // Balls ball = new Balls(height/2, width/2, 1, 1, 40);
  ball.changeRandomDirection();
  return ball;
}

public void dragBall(ArrayList<Balls> balls) {
  for (Balls ball : balls) {
    Integer plusX = ball.getX() + ball.getRadius();
    Integer minusX = ball.getX() - ball.getRadius();

    Integer plusY = ball.getY() + ball.getRadius();
    Integer minusY = ball.getY() - ball.getRadius();
    if (
      (mouseX > minusX && mouseX < plusX) &&
      (mouseY > plusY && mouseY < minusY)
      ) {
      background(0); 
      ball.setBallColor(new Color(0, 0, 0));
      ball.setX(mouseX);
      ball.setY(mouseY);
    }
  }
}
