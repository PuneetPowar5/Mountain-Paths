/**
 * Find the minimum elevation-change route from West-to-East in the given
 * grid, from the given starting row, and draw it using the given graphics
 * context
 *
 * @param data - the 2D array of elevation values
 * @param row - the starting row for traversing to find the min path
 * @return total elevation of the route
 */

public int drawLowestElevPath( int[][] data, int row ) {
  //Set the outline of the rectangle to nothing
  noStroke();
  
  //Declare variables for all possible movement changes and movement
  int fwd;
  int fwdChange;
  int downFwd;
  int downFwdChange;
  int upFwd;
  int upFwdChange;
  //Declare variables to help find a minimum, the total elevation and the special cases
  int min;
  int totalElevation = 0;
  int choose = 0;
  
  //Go thourgh each column at the given row
  for (int c = 0; c < data[row].length - 1; c++) {
    
    //Draw a rectangle at the row and column
    rect(c, row, 1, 1);
    
    //Set the forward direction
    fwd = data[row][c + 1];
    
    //If the value of row is less than the length of the array then set the down forwards direction
    if (row < data.length - 1) {
      downFwd = data[row + 1][c + 1];
    } else {
      //Else set the downFwd value to the highest integer so it wont affect the algorithm when it is checking for the minimum change between all three direction
      downFwd = Integer.MAX_VALUE;
    }
    
    //If the row value is greater than the first, set the up forward direction
    if (row > 0) {
      upFwd = data[row - 1][c + 1];
    } else {
      //Else set the upFwd value to the highest integer so it wont affect the algorithm when it is checking for the minimum change between all three direction
      upFwd = Integer.MAX_VALUE;
    }
    
    //The change in elevation for the forward direction is eqaul to the absolute value of the number at a certain row and column subtracted by the value of the forward value
    fwdChange = Math.abs( data[row][c] - fwd);
    //The change in elevation for the down forward direction is equal to the absolute value of the number at a certain row and column subtract by the value of the down forward value
    downFwdChange = Math.abs( data[row][c] - downFwd);
    //The change in elevation for the up forward direction is equal to the absolute value of the number at a certain row and column subtract by the value of the up forward value
    upFwdChange = Math.abs( data[row][c] - upFwd);
    
    //The minimum value is equal to the smallest value between every different type direction change
    min = min(fwdChange, downFwdChange, upFwdChange);
    
    //If the minimum value is equal to the down forward change
    if (min == downFwdChange && min!= fwdChange && min != upFwdChange) {
      
      //Go down to the next row
      row++;
      
      //Add the down forward change value to the total elevation value
      totalElevation +=  downFwdChange;
    } 
    //If the minimum value is equal to the up forward change
    else if (min == upFwdChange && min != fwdChange && min != downFwdChange ) {
      
      //go up to the previous row
      row--;
      
      //Add the up forward change to the total elevation
      totalElevation += upFwdChange;
    } 
    //If the forward change is equal to either the up forward change or down forward change
    else if ((fwdChange == downFwdChange) || (fwdChange == upFwdChange)) {
      
      //Stay in the same row and add the forward change value to the total elevation
      totalElevation +=  fwdChange;
      
    } 
    //If the down forward change and the up forward change are equal
    else if (downFwdChange == upFwdChange) {
      
      //Randomly choose a number between 1 and 2
      choose = (int)(Math.random()*2);
      
      //If the number is 1
      if (choose == 1) {
        
        //Go down to the row below
        row++;
        
        //Add the down forward change to the total elevation
        totalElevation +=  downFwdChange;
        
        //Reset choose to 0
        choose = 0;
      } 
      //If the number is 2
      else if (choose == 2) {
        
        //Go up to the row above
        row--;
        
        //Add the up forward change to the total elevation
        totalElevation +=  upFwdChange;
        
        //Reset choose to 0 
        choose = 0;
      } 
      //Else choose is going to stay 0
      else {
        choose = 0;
      }
      
    } 
    
    else {
      
      //Stay in the row and add the forward change to the total elevation
      totalElevation +=  fwdChange;
      
    }
  }
  
  //Return the total elevation to the setup()
  return totalElevation;
}
