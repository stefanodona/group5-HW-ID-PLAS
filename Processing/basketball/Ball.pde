class Ball {
  float a0=200, b0=a0/2, a, b;
  float x, y, z, xH, zH, yV, zV;
  float angleH = 0, angleIncrement=0.7;
  int numLines;
  float time, delay=1, t=0;
  myLine elipse, vert, hor;

  Ball() {
  }

  void initBall(int numLines) {
    elipse = new myLine(0, 0, 0, numLines, randomness);
    vert = new myLine(0, 0, 0, numLines, randomness);
    hor = new myLine(0, 0, 0, numLines, randomness);
    this.numLines = numLines;
  }

  void drawBall(float ampValue) {
    pushMatrix();
    translate(width/2, height/2, 0);
    //spotLight(255, 255, 255,
    //  0, 0, -(a0+b0+300),
    //  0, 0, 1,
    //  PI/2, 1);
    rotateY(radians(angleH));
    //setA(a0+5*sin(c));
    //a = a0;
    //b = b0;
    setA(a0+50*ampValue);
    elipse.changeRadius(a+b);
    hor.changeRadius(a+b);
    vert.changeRadius(a+b);

    //BASKET LINE
    x = a*cos(radians(t)) + b*cos(3*radians(t));
    y = a*sin(radians(t)) - b*sin(3*radians(t));
    z = 2*sqrt(a*b)*sin(2*radians(t));

    // VERTICAL LINE
    zV = (a+b)*cos(radians(t));
    yV = (a+b)*sin(radians(t));

    // HORIZONTAL LINE
    xH = (a+b)*cos(radians(t));
    zH = (a+b)*sin(radians(t));

    if ((millis()-time) > delay) {
      elipse.update(x, y, z);
      vert.update(0, yV, zV);
      hor.update(xH, 0, zH);
      time = millis();
    }
    noStroke();
    //fill(127+127*ampValue, 255);
    fill(0);
    sphere(a+b-8);

    elipse.drawLine();
    rotateZ(radians(45));
    vert.drawLine();
    hor.drawLine();

    angleH += angleIncrement;
    t = millis()/10;
    c+=0.1;
    popMatrix();
  }

  void setA(float aA) {
    a = aA;
    b= a/1.5;
  }

  void setSpeed(int speed) {
    if (speed==0) angleIncrement = 0.7;
    if (speed==1) angleIncrement = 1.4;
    if (speed==2) angleIncrement = 2.1;
    if (speed==3) angleIncrement = 2.8;
  }
}