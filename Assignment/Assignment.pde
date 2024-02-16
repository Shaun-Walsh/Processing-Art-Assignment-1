/*
* Student Name: Shaun Walsh
 * Student Number: 20005831
 * Description: This program generates a gird with some simple art shapes; gridlines; a changing border colour based on mouse positions;
 an interactive element where the user can draw on the canvas and clear it; generate a target; and place shapes at random x postions further filling the grid.
 */

//Defining the colour pallete
color pink = #F21D92;
color purple = #E031EB;
color black = #060126;
color blue = #030085;
color teal = #1BF2B5;
//Defining the boxSize variable
int boxSize = 80;
//Defining the rotation of the target variable
float angle;
//Flag to check if the spacebar has been pressed
boolean drawShapes = false;
//Flag to check if the c key has been pressed
boolean cleared = false;

//Setting the display location and size
void setup() {
  surface.setLocation(0, 0);
  size(1280, 720);
  //Setting the inital value for angle variable
  angle = 0;
  //Setting the background colour
  background(teal);
}

//setting the draw method
void draw() {
  //Calling a method to clear the display back to intial presentation
  if (keyPressed && key == 'c') {
    clearCanvas();
  }

  //Drawing the line grid
  drawGrid();

  //Drawing the repeated shape on the grid using a for loop
  for ( int row = 0; row < 720; row += 160) {
    for (int count = 0; count < 1280; count += 80) {
      drawShapeOne(count+20, row+20, 40, 60);
    }
  }

  //Calling a method that places 4 predefined shapes at random x coordinates on the grid using the space key
  if (keyPressed && key == ' ') {
    randomShapes(80);
  }

  //Calling a method to change the frame colour using the mouse position
  mouseColourFrame();

  //Calling a method to add the student name to the screen
  stringName();

  //Calling a method add student number to screen
  stringNumber();

  //Calling a method to show how to erase drawings on the screen
  stringCleared();

  //Calling a method to dispaly the product of the mouseX and mouseY coordinates
  mouseProduct();
}

//Method for changing changing the colour of the frame based on the X position of the mouse using a nested if/else if/else statement
void mouseColourFrame() {
  noStroke();
  if ((mouseX >80 && mouseX<360) && (mouseY >boxSize && mouseY <640)) {
    fill(pink);
    frame();
  } else if ((mouseX >=360 && mouseX <680)  && (mouseY >boxSize && mouseY <640)) {
    fill(purple);
    frame();
  } else if ((mouseX >=680 && mouseX <920)  && (mouseY >boxSize && mouseY <640)) {
    fill(black);
    frame();
  } else if ((mouseX >=920 && mouseX <1160)  && (mouseY >boxSize && mouseY <640)) {
    fill(blue);
    frame();
  } else {
    fill(teal);
    frame();
  }
}

//Method for drawing a line grid using a for loop
void drawGrid() {
  stroke(5);
  for (int i = boxSize; i <= width; i += boxSize) {
    line (i, 0, i, height);
    line (0, i, width, i);
  }
}

//Method to save a screenshot it in its own img folder using a mouse method. If the mouse is clicked and it is the right button, this calls the screenShot method below
void mouseClicked() {
  if (mouseButton == RIGHT) {
    screenShot();
  }
}

//This is the screenShot method that saves the actual image
void screenShot() {
  save("img/shaunwalsh.png");
}

//Method to a basic overlayed art pattern using 3 processing methods and the colours used in the palette, method takes input from where it was called
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

// Method for drawing a frame around the outer border using a while loop
void frame() {
  int i = 0;
  int j = 0;
  int frameXCoordA = 0;
  int frameYCoordA= 0;
  int frameXCoordB= 0;
  int frameYCoordB= 0;
  while (i < 2) {

    rect(frameXCoordA, frameYCoordA, 1280, 80);
    frameYCoordA += 641;
    i++;
    while (j < 2) {

      rect (frameXCoordB, frameYCoordB, 80, 720);
      frameXCoordB +=1201;
      j++;
    }
  }
}

//Method with return type showing the x and y coordinates of the mouse on the screeen and multiplying them together
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

//Method call for the spinningRect method using the mouse wheel
void mouseWheel() {
  spinningRect();
}

//method for drawing a slightly translucent target when the mousewheel is scrolled is in a particular position on the screen using an if statement. The target gets less translucent the longer the mousewheel is scrolled
void spinningRect() {
  if (mouseX<340 || mouseX >920) {
    translate(640, 360);
    rotate(radians(angle));
    fill(black, 10);
    rectMode(CENTER);
    rect(0, 0, boxSize, boxSize);
    rectMode(CORNER);
    rect(80, 80, boxSize, boxSize);
    angle += 1;
  }
}

//Method for adding student name to the screen using a string and toUpperCase call
void stringName() {
  String message = "shaun walsh";
  fill(255, 255, 255);
  textAlign (LEFT);
  textSize(40);
  text(message.toUpperCase(), 80, 40);
}

//Method for adding student number to the screen using a string
void stringNumber() {
  String message = "20005831";
  fill(255, 255, 255);
  textAlign (LEFT);
  textSize(40);
  text(message, 80, 700);
}

//Method for adding an instruction to the user on how to reset the screen
void stringCleared() {
  String message = "press c to reset";
  fill(pink);
  textAlign (RIGHT);
  textSize(40);
  text(message.toUpperCase(), 1240, 700);
}

//Method allowing the state of the boolean variables declared at the start to be changed
void keyPressed() {
  // If spacebar is pressed, change the drawShapes variable
  if (key == ' ') {
    drawShapes = !drawShapes;
  }
  // If c key is pressed, change the cleared variable
  if (key == 'c') {
    cleared = !cleared;
  }
}

//Method for producing squares and circles at random X coordinates and fixed Y coordinate
void randomShapes(int fixedYCoord) {
  int randomXSquare = int(random(80, 1200));
  int randomXCircle = int(random(120, 1170));
  int randomXCircle2 = int(random(120, 1170));
  int randomXSquare2 = int(random(80, 1200));

  fill(pink);
  rect(randomXSquare, fixedYCoord, boxSize, boxSize);
  fill(purple);
  ellipse(randomXCircle, fixedYCoord+200, boxSize, boxSize);
  fill(black);
  ellipse(randomXCircle2, fixedYCoord+360, boxSize, boxSize);
  fill(blue);
  rect(randomXSquare2, fixedYCoord+480, boxSize, boxSize);
}

//Method allowing the mouse being dragged to call the freeArt method
void mouseDragged() {
  freeArt();
}

//Method for drawing and ellipse at the mouseX and mouseY coordinates
void freeArt() {
  ellipse(mouseX, mouseY, boxSize/2, boxSize/2);
}

//Method for undoing user created additions to the canvas
void clearCanvas() {
  if (key == 'c')
    background(teal);
}
