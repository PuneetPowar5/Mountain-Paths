/**
 * Generate all west-to-east paths, find the one with the lowest total
 * elevation change, and return the index of the row that path starts on.
 *
 * @param grid - the 2D array of elevation values
 * @return the index of the row where the lowest elevation-change path
 * starts.
 */
public int indexOfLowestElevPath( int[][] data ) {
  
  //Set the starting point of the lowest elevation path to 0
  int start = 0;
  //Set the change to 0
  int change = 0;
  //The variable minimum is equal to the final elevation change from the previous step
  int min = drawLowestElevPath( data, 0 );
  
  //Itterate through each row of the array
  for(int r = 0; r < data.length - 1; r++){
    
    //Set change equal to the elevation change at the row that you are itterating through
    change = drawLowestElevPath( data, r );
    
    //If the change is less than the min
    if(change < min){
      
      //Set the min equal to the change
      min = change;
      
      //The start of the lowest elevation point is equal to that row
      start = r;
      
    }
  }
  
  //Return the start of the lowest elevation point to the setup()
  return start;
  
}
