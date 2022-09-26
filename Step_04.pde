/**
 * Search a single column of a 2D array and return the index of the row that
 * contains the smallest value
 *
 * @param grid a 2D array
 * @col the column in the 2D array to process
 * @return the index of smallest value from grid at the given col
 */
public static int indexOfMinInCol(int[][] data, int col) {
  
  //Declare a value min and set it to the highest possible integer value
  int min = Integer.MAX_VALUE;
  //Declare a variable row and initialize it at 0
  int row = 0;
  
  //go through each row at the first coloumn
  for(int r = 0; r < data.length; r++){
    //If the first value at that row is less than the min
    if(data[r][col] < min){
      //Set min to that value at that row
      min = data[r][col];
      //Keep track of the row at which this lowest value is found
      row = r;
    }
  }
  
  //Return row to the setup()
  return row;
  
}
