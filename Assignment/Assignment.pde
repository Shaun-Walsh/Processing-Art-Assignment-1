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
  mouseBackground();
  //drawing the line grid
   drawGrid();
  //drawing the repeated shape
  for ( int row = 0; row < 720; row += 160) {
    for (int count = 0; count < 1280; count += 80) {
      drawShapeOne(count+20, row+20, 40, 60);
    }
  }
  
  //printing student name and number to the screen
  mousePressed();
  
  //drawing the external frame
  frame();
  //method with return type
  mouseProduct();
  spinningRect();
}

//changing background colours depending on mouse location
void mouseBackground() {
  noStroke();
  if ((mouseX >80 && mouseX<360) && (mouseY >boxSize && mouseY <640)){
    fill(pink);
    rect(boxSize, boxSize, boxSize*3.5, boxSize*8); 
  }
  else if ((mouseX >=360 && mouseX <680)  && (mouseY >boxSize && mouseY <640)) {
   fill(purple);
   rect(boxSize*4.5, boxSize, boxSize*3.5, boxSize*8); 
  }
   else if ((mouseX >=680 && mouseX <920)  && (mouseY >boxSize && mouseY <640)) {
   fill(black);
   rect(boxSize*8, boxSize, boxSize*3.5, boxSize*8); 
  }
  else if ((mouseX >=920 && mouseX <1160)  && (mouseY >boxSize && mouseY <640)) {
   fill(blue);
   rect(boxSize*11.5, boxSize, boxSize*3.5, boxSize*8); 
  }
 else {
 fill(teal);
 rect(boxSize, boxSize, boxSize*14, boxSize*8); 
 }
}

//setting the drawGrid method
void drawGrid() {
  stroke(2);
  for (int i = boxSize; i <= width; i += boxSize) {
    line (i, 0, i, height);
    line (0, i, width, i);
  }
}

//save screenshot and method
void mouseClicked() {
  if (mouseButton == RIGHT) {
    screenShot();
  }
}

void screenShot() {
  save("img/shaunwalsh.png");
}

/*//print name and student number to screen
void mousePressed() {
 /* if (mouseButton == LEFT) {
    textSize(80);
    fill (255);
    text("SHAUN WALSH", 0, 80);
    textSize(80);
    fill (255);
    text("20005831", 960, 720);
  }
}*/

//doing some art
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


//drawing a frame around the outer border
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

//method with return type
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

//drawing a ghost target
void spinningRect() {
  if ((mouseButton == LEFT && (mouseX<320 || mouseX >720))) {
    translate(640, 360);
    rotate(radians(angle));
    fill(teal,10);
    rectMode(CENTER);
    rect(0,0, boxSize, boxSize);
    rectMode(CORNER);
    rect(80,80, boxSize, boxSize);
    angle += 1;
   
  } 
}

/*//randomising colours
void randomColourNumber()  {
  int colourNumber = int (random (0,5));
  if (colourNumber == 0) {
    
}*/
  
  
