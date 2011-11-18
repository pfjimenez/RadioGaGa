void loadData(){
  
    // Setting up the static data that we have and are gonna use except when live data is needed
  String[] rowsin = loadStrings("sortParsedOutput.txt"); 
  int rowsinno = rowsin.length;
  for (int i = 0; i< rowsinno; i++) {
    String []tokens = rowsin[i].split("\t");
    bandNames.add(tokens[0]);
   
    listeners.add(tokens[1]);
    males.add(tokens[2]);
    females.add(tokens[3]);
    String[] tokens2 = tokens[4].split(" ");
    String[] tokens3 = tokens[5].split(" ");
    ages.add(tokens2);
    locations.add(tokens3);
    
    minListeners = min(minListeners,int(tokens[1]));
    maxListeners = max(maxListeners,int(tokens[1]));
  }
  
}
  

