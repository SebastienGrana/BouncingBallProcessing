class Balls { //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//

  private Integer x;
  private Integer y;   
  private Integer xSpeed;
  private Integer ySpeed;
  private Float xAccel;
  private Float yAccel;
  private Color ballColor;
  private Integer radius;
  private Integer diametre;


  public Balls(Integer x, Integer y, Integer xSpeed, Integer ySpeed, Float xAccel, Float yAccel, Integer diametre) {
    this.x = x;
    this.y = y;
    this.xSpeed = xSpeed;
    this.ySpeed = ySpeed;
    this.xAccel = xAccel;
    this.yAccel = yAccel;
    changeRmdColor();
    Float f = Math.abs((diametre/2)*0.85);
    this.radius = f.intValue(); 
    //this.radius = diametre/2; 
    this.diametre = diametre;
  }

  public void setX(Integer x) {
    this.x = x;
  }
  public void setY(Integer y) {
    this.y = y;
  }
  public void setXSpeed(Integer xSpeed) {
    this.xSpeed = xSpeed;
  }
  public void setYSpeed(Integer ySpeed) {
    this.ySpeed = ySpeed;
  }
  public void setXAccel(Float xAccel) {
    this.xAccel = xAccel;
  }
  public void setYAccel(Float yAccel) {
    this.yAccel = yAccel;
  }
  public void setRadius(Integer radius) {
    this.radius = radius;
  }
  public void setDiametre(Integer diametre) {
    this.diametre = diametre;
  }
  public void setBallColor(Color ballColor) {
    this.ballColor = ballColor;
  }
  public Integer getX() {
    return x;
  }
  public Integer getY() {
    return y;
  }
  public Integer getXSpeed() {
    return xSpeed;
  }
  public Integer getYSpeed() {
    return ySpeed;
  }
  public Float getXAccel() {
    return xAccel;
  }
  public Float getYAccel() {
    return yAccel;
  }
  public Integer getRadius() {
    return radius;
  }
  public Integer getDiametre() {
    return diametre;
  }
  public Color getBallColor() {
    return ballColor;
  }

  public void move() {
    Float xSpeedCalc;
    Float ySpeedCalc;
    xSpeedCalc = xSpeed + xAccel;
    ySpeedCalc = ySpeed + yAccel;
    xSpeed = xSpeedCalc.intValue();
    ySpeed = ySpeedCalc.intValue();
    this.x = this.x + xSpeed;
    this.y = this.y + ySpeed;

    changeDirection();
    detectIfOOB();
    drawCircle();
  }

  public Boolean detecColid(Balls ball) {
    Integer ballRadius = ball.getRadius();
    Integer addRadius =  (radius + ballRadius)/2;
    Boolean valToReturn = false;

    if (
      Math.abs(x - ball.getX()) < addRadius &&
      Math.abs(y - ball.getY()) < addRadius
      ) {
      changeRandomDirection();
      ball.changeRandomDirection();
      valToReturn = true;
    }
    return valToReturn;
  }

  public void changeDirection() {

    if (this.x ==  radius) {
      this.xSpeed = this.xSpeed * -1;
      changeRmdColor();
    }
    if (this.y ==  radius) {
      this.ySpeed = this.ySpeed * -1;
      changeRmdColor();
    }
    if (this.x == height - radius) {
      this.xSpeed = this.xSpeed * -1;
      changeRmdColor();
    }
    if (this.y == width - radius) {
      this.ySpeed = this.ySpeed * -1;
      changeRmdColor();
    }
  }

  public void changeRandomDirection() {
    int xMinus = Math.random() > 0.5 ? 1 : -1;
    int yMinus = Math.random() > 0.5 ? 1 : -1;

    this.xAccel = xAccel * xMinus;
    this.yAccel = yAccel * yMinus;
  }

  public void drawCircle() {

    fill(ballColor.getR(), ballColor.getG(), ballColor.getB());
    ellipse(x, y, radius, radius);
  }

  public void changeRmdColor() {
    this.ballColor = new Color(Math.random() * 150, Math.random() * 150, Math.random() * 150);
  }

  public void detectIfOOB() {
    if (this.x < 0) {
      x = radius;
      this.xSpeed = this.xSpeed * -1;
    }
    if (this.y < 0) {
      y = radius;
      this.ySpeed = this.ySpeed * -1;
    }
    if (this.x > height) {
      x = height - radius;
      this.xSpeed = this.xSpeed * -1;
    }
    if (this.y > width) {
      y = width - radius;
      this.ySpeed = this.ySpeed * -1;
    }
  }
  
  
}
