//defining the colour pallete and variables
color pink = #F21D92;
color purple = #E031EB;
color black = #060126;
color blue = #030085;
color teal = #1BF2B5;
int boxSize = 80;
float angle;

//setting the display and size
void setup() {
  surface.setLocation(0, 0);
  size(1280, 720);
  background(teal);
  angle = 0;
}

//setting the draw method
void draw() {
  
  //using the mouse to change the grid background
  mouseBackground();
  
  //drawing the line grid
  drawGrid();
  
  //drawing the repeated shape
  for ( int row = 0; row < 720; row += 160) {
    for (int count = 0; count < 1280; count += 80) {
      drawShapeOne(count+20, row+20, 40, 60);
    }
  }

  //drawing the external frame
  frame();

  //add student number to screen
  stringName();
  
  //add student number to screen
  stringNumber();
  
  //method with return type
  mouseProduct();

  //method prodcuing ghost target
  spinningRect();
}

//method for changing changing background colours depending on mouse location use a nest if/else if, else statement
void mouseBackground() {
  noStroke();
  if ((mouseX >80 && mouseX<360) && (mouseY >boxSize && mouseY <640)) {
    fill(pink);
    rect(boxSize, boxSize, boxSize*3.5, boxSize*8);
  } else if ((mouseX >=360 && mouseX <680)  && (mouseY >boxSize && mouseY <640)) {
    fill(purple);
    rect(boxSize*4.5, boxSize, boxSize*3.5, boxSize*8);
  } else if ((mouseX >=680 && mouseX <920)  && (mouseY >boxSize && mouseY <640)) {
    fill(black);
    rect(boxSize*8, boxSize, boxSize*3.5, boxSize*8);
  } else if ((mouseX >=920 && mouseX <1160)  && (mouseY >boxSize && mouseY <640)) {
    fill(blue);
    rect(boxSize*11.5, boxSize, boxSize*3.5, boxSize*8);
  } else {
    fill(teal);
    rect(boxSize, boxSize, boxSize*14, boxSize*8);
  }
}

//method for drawing a line grid with a for loop
void drawGrid() {
  stroke(2);
  for (int i = boxSize; i <= width; i += boxSize) {
    line (i, 0, i, height);
    line (0, i, width, i);
  }
}

//method to save a screenshot and save it in its own img folder using a mouse method
void mouseClicked() {
  if (mouseButton == RIGHT) {
    screenShot();
  }
}

void screenShot() {
  save("img/shaunwalsh.png");
}



//drawing a shape for the grid
void drawShapeOne(int xCoord, int yCoord, int rectSize, int ellSize) {
  noStroke();
  fill(pink);
  ellipse(xCoord+20, yCoord+20, ellSize, ellSize);
  fill(purple);
  rect(xCoord, yCoord, rectSize, rectSize);
  fill(black);
  triangle(xCoord, yCoord+20, xCoord+20, yCoord+40, xCoord+40, yCoord+20);
  fill(blue);
  triangle(xCoord, yCoord+20, xCoord+20, yCoord, xCoord+40, yCoord+20);
}


// method for drawing a frame around the outer border using a while loop
void frame() {
  int i = 0;
  int j = 0;
  int frameXCoordA = 0;
  int frameYCoordA= 0;
  int frameXCoordB= 0;
  int frameYCoordB= 0;
  while (i < 2) {
    fill(black);
    rect(frameXCoordA, frameYCoordA, 1280, 80);
    frameYCoordA += 640;
    i++;
    while (j < 2) {
      fill(black);
      rect (frameXCoordB, frameYCoordB, 80, 720);
      frameXCoordB +=1200;
      j++;
    }
  }
}

//method with return type showing the x and y coordinates of the mouse on the screeen and multiplying them together 
void mouseProduct()
{
  float a = mouseX;
  float b = mouseY;
  textSize(35);
  textAlign(RIGHT);
  fill(pink);
  text ("The product of " + a + " and " + b + " is " + product (a, b), 1280, 40);
}

float product (float num1, float num2) {
  return num1 * num2 ;
}

//method for drawing a ghost target in the back when the mouse is in a particularly position on the screen and the left button is pushed using an if statement and mouse method
void spinningRect() {
  if ((mouseButton == LEFT && (mouseX<320 || mouseX >720))) {
    translate(640, 360);
    rotate(radians(angle));
    fill(teal, 10);
    rectMode(CENTER);
    rect(0, 0, boxSize, boxSize);
    rectMode(CORNER);
    rect(80, 80, boxSize, boxSize);
    angle += 1;
  }
}

//method for adding student name to the screen
void stringName()  {
  String message = "shaun walsh";
  fill(255, 255, 255);
  textAlign (LEFT);
  textSize(40);
  text(message.toUpperCase(), 80, 40);
  
}

//method for adding student number to the screen
void stringNumber()  {
  String message = "2005831";
  fill(255, 255, 255);
  textAlign (LEFT);
  textSize(40);
  text(message, 80, 700);
  
}

/*//randomising colours
 void randomColourNumber()  {
 int colourNumber = int (random (0,5));
 if (colourNumber == 0) {
 
 }*/
