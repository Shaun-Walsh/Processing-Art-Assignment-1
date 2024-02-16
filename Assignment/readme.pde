/*
Name : Shaun Walsh
Student Number: 20005831

Brief description of piece (1 or 2 sentences MAX):
===================================================
This program generates a gird with some simple art shapes; gridlines; a changing border colour based on mouse positions;
an interactive element where the user can draw on the canvas and clear it; generate a target; and place shapes at random x postions further filling the grid.


Adobe Color Palette Used:
=========================
- provide link to it here
https://color.adobe.com/neon-vaporwave-color-theme-43318ea9-5688-49a4-ba19-754fb28f287a
{
go to creative cloud (top right when logged in)
visit https://assets.adobe.com/libraries
click relevant library
check relevant palette in top left of its thumbnail
clck the little 'share' icon top right, and get a link
}

- color pink = #F21D92;
- color purple = #E031EB;
- color black = #060126;
- color blue = #030085;
- color teal = #1BF2B5;
- color WHITE: (255,255,255);

Instructions:
=============

In the sketch; if you move the mouse through the grid, the surrounding frame will change colour betweeen the specified colours depending on the position of mouseX 
               if you drag the mouse with either button held you can draw in pink over the sketch to interact with the sketch
               if you press the spacebar two squares and two circles will appear at random x postions in the blank space in the grid, allowing the user the abiltiy to further customize the sketch 
               if you scroll the mouse wheel a semi translucent targert will begin to appear in the middle of the diplay, this will only trigger if the mouse is either the left or right side of the the line grid
               to clear the user genereated additions and begin again press the lowercase c key on the keyboard
               finally if you right click anywhere in the screen it will create a png file of the user created artwork 
               
Known bugs/problems:
====================
Occassionally the spacebar draw will only trigger if the mouse has already been clicked in the sketch. I have not been able to find a reason for this.

Any sources referred to during the development of the assignment.

These were all used to understand how to create the roating target
https://www2.cs.sfu.ca/CourseCentral/166/oshklars/translation_rotation.html#:~:text=17.3.&text=Processing%20uses%20the%20rotate(rad,rad%20values%20rotates%20counter%2Dclockwise.

translate() https://processing.org/reference/translate_.html

rotate() https://processing.org/reference/rotate_.html

rectMode() https://processing.org/reference/rectMode_.html

not used directly but used to aid my understanding of random in processing
https://funprogramming.org/17-A-better-way-to-generate-random-colors.html

how to make the random x coordinate for the shapes
random() https://processing.org/reference/random_.html

used to help with key pressed functions
keyPressed() https://processing.org/reference/keyPressed_.html

used to understand how to use the mouse wheel in the project
mouseWheel() https://processing.org/reference/mouseWheel_.html


*/
