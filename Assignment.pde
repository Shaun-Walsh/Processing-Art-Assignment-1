//defining the colour pallete
int pink = #F21D92;
int purple = #E031EB;
int black = #060126;
int blue = #030085;
int teal = #1BF2B5;
int boxSize = 80;

//setting the display and size
void setup()  {
  surface.setLocation(0,0);
  size(1280,720);
  background(teal);
  
  
}

//setting the draw method
void draw()  {
 //drawing the line grid 
  drawGrid();
//drawing the repeated shape  
  for ( int row = 0; row <720; row +=160)  {
    for (int count = 0; count <1280; count +=80) {
     drawShapeOne(count+20, row+20, 40,60);
    }
  }
//printing student name and number to the screen
  mousePressed();
//drawing the external frame  
  frame();
//method with return type
  mouseProduct();
  
  
 
}

//setting the drawGrid method
void drawGrid()  {
   for ( int i = boxSize; i <=width; i+=boxSize) {
    line (i,0,i,height);
    line (0,i,width,i); 
   }
}

//save screenshot and method
void mouseClicked()  {
 if (mouseButton == RIGHT)  {
  screenShot();
 }
}
void screenShot()  {
save("img/shaunwalsh.png");
}

//print name and student number to screen
void mousePressed() {
  if (mouseButton == LEFT) {
   
    textSize(80);
    fill (255); 
    text("SHAUN WALSH",0,80);
    textSize(80);
    fill (255); 
    text("20005831",960,720); 
    } 
}

//doing some art
void drawShapeOne(int xC, int yC, int rectSize, int ellSize)  {
  noStroke();
  fill(pink);
  ellipse(xC+20,yC+20,ellSize,ellSize);
  fill(purple);
  rect(xC, yC, rectSize, rectSize);
  fill(black);
  triangle(xC, yC+20, xC+20, yC+40,xC+40,yC+20);
  fill(blue);
  triangle(xC,yC+20,xC+20,yC,xC+40,yC+20);
 
}

//changing background colours depending on mouse location
void mouseBackground()   {
  if (mouseX < 320)
  fill (pink);
  rect(0,0,width/4, height);
}

//drawing a frame around the outer border
void frame() {
  int i = 0;
  int j = 0;
  int frameXA = 0;
  int frameYA= 0;
  int frameXB= 0;
  int frameYB= 0;
  while (i < 2)  {
    fill(black);
    rect(frameXA,frameYA,1280,80);
    frameYA += 640;
    i++;
  while (j < 2)  {
    fill(black);
    rect (frameXB, frameYB, 80,720);
    frameXB +=1200;
    j++;
  }
  }
}
//method with return type
void mouseProduct()
{
   float a = mouseX;
   float b = mouseY;
   textSize(40);
   fill(pink);
   text ("The product of " + a + " and " + b + " is " + product (a,b), 550,40);
}
   float product (float num1, float num2)  {
     return num1 * num2 ;
   }
  


  
