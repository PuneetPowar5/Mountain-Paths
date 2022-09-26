/**
 * MINIMUM VALUE
 *
 * @param data a 2D array from which you want to find the minimum value
 * @return the minimum value in the given 2D Array
 */
public static int findMin( int[][] data ) {
  
  //Declare a variable min and set it to the highest possible integer value
  int min = Integer.MAX_VALUE;
  
  //Loop through the arrays rows and columns
  for(int r = 0; r < data.length; r++){
    for(int c = 0; c < data[r].length; c++){
      //If the number at a certain row and column is less than the min
      if(data[r][c] < min){
        
        //Set min equal to the number in that certain row and column
        min = data[r][c];
      }
    }
  }
  
  //Return the final value of min to the setup()
  return min;
  
}

/**
 * MAXIMUM VALUE
 *
 * @param data a 2D array from which you want to find the minimum value
 * @return the minimum value in the given 2D Array
 */
public static int findMax( int[][] data ) {
  
  //Declare a variable max and set it to the lowest possible integer value
  int max = Integer.MIN_VALUE;
  
  //Loop through each row and column of the array
  for(int r = 0; r < data.length; r++){
    for(int c = 0; c < data[r].length; c++){
      //If the number at the certain row and column is greater than the max
      if(data[r][c] > max){
        //Set the max to the number at that row and column
        max = data[r][c];
      }
    }
  }
  
  //Return the max to the setup()
  return max;
  
}
