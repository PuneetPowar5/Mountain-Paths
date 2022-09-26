/**
 * Given a 2D array of elevation data create a image of size rows x cols,
 * drawing a 1x1 rectangle (or point) for each value in the array whose color is set to
 * a scaled gray value (0-255). Note: to scale the values in the array to
 * 0-255 you must find the min and max values in the original data first.
 *
 * @param g a Graphics context to use
 * @param grid a 2D array of the data
 */
 public void drawMap( int[][] data ) {
   //Set the outline of the rectangle to nothing
   noStroke();
   //Get the maximum and minimum values from the previous step
   int min = findMin(data);
   int max = findMax(data);
   //The elevation difference is equal to the max subtracted by the min all divieded by 255 inorder to get the greyscale values
   int elevationDif = (max - min)/255;
   //Declare and variable colour
   int colour;
   
   //Loop through each row and column of the area
   for(int r = 0; r < data.length; r++){
     for(int c = 0; c < data[r].length; c++){
       
       //The colour is equal to the value at your row and column subtracted by your difference and divieded by your elevation difference
       colour = ((data[r][c] - min)/elevationDif);
       
       //Fill the window at that point with the calculated colour
       fill(colour);
       //Draw a point with that colour
       rect(c,r,1,1);
       
     }
   }
 }
