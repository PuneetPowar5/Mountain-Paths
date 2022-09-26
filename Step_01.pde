import java.util.*;
/**
 * This method reads a 2D data set from the specified file. The Graphics'
 * industry standard is width by height (width x height), while programmers
 * use rows x cols / (height x width).
 *
 * @param fileName the name of the file
 * @return a 2D array (rows x cols) of the data from the file read
 */
public static int[][] readData( String fileName ) {
  
  //Set an array data that is empty
  int[][] data;
  
  //initialize the row and columns at 0
  int row = 0;
  int col = 0;
  
  //Make two variables to take in the file and a counter to make an infinite loop
  String words;
  int counter = 0;
  
  try {
    
    //Read from the text file
    Scanner fileInput = new Scanner(new File(fileName));
    
    //while file has data to read from
    while(fileInput.hasNextLine()){
      
      //Set the data equal to the varaible words
      words = fileInput.nextLine();
      
      //count how many rows there based on the amount of times the while loop loops through the file
      row++;
      
      //Set the columns equal to the amount of numbers in data given to words
      col = new StringTokenizer(words, " ").countTokens();
      
      
    }
    
    //Set the size of data to the number of rows and number of columns
    data = new int[row][col];
    fileInput.close();
    
    //Read from the file again
    fileInput = new Scanner(new File(fileName));
    
    //While the file has data to offer
    while(fileInput.hasNextLine()){
      
      //while the counter doesn;t equal to the number rows
      while(counter != row){
        
      //Set the data in the file to words
      words = fileInput.nextLine();
      
      //Cut the if words at the spaces
      StringTokenizer st = new StringTokenizer(words, " ");
      
      //loop through each column
      for(int c = 0; c < data[counter].length; c++){
        //Convert the string to an int in every column
        data[counter][c] = Integer.parseInt(st.nextToken());
      }
      //Go to the next row
      counter++;
      }
      
    }
    
  }
  catch (Exception e ) {
    println( "STEP 01 - Exception" );
    e.printStackTrace();
    data = null;
  }
  
  //Return the array to the setup()
  return data;
}
