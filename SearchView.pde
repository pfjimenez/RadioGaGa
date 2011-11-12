// This class is used to draw the Center View for Graph View
class SearchView extends View {

  // Code used for the Search Box
  // Control P5 Variables
  // Code used for search box
  public boolean searchActivated = false;
  public String textValue = "";
  public Textfield myTextfield;
  public String searching = "";
  public int startResult = 0;
  public int endResult = 16;
  public ArrayList<String> searchResults;
  public  String dragged = "";
  public int draggedIndex = -1;
  
  SearchView(float x_, float y_, float w_, float h_)
  {
    super(x_, y_, w_, h_);
    // Searchbox Setting up
    controlP5.setColorBackground(0);
    strokeWeight(2);
    controlP5.setColorActive(tabColor2);
    
    myTextfield = controlP5.addTextfield("", 
    (int)x_, (int)y_, 250, 30);
    myTextfield.valueLabel().setFont(ControlP5.grixel);
    myTextfield.setFocus(false);
    searchResults = new ArrayList<String>();
    for (int i = 0; i< bandNames.size(); i++) {
      searchResults.add(""+i);
    }
//System.out.println(searchResults.size());
  }
  

  void drawContent()
  {
    if(!mainView.subviews.contains(searchView))
    return;
  //rectMode(CORNERS);
  fill(draggableContentBoxColor);
textAlign(CENTER);
  rect(0, 40, 275, 600); 
  textFont(fbold);
  textSize(22);
  int y2 = 40;
 for (int i = startResult; i< searchResults.size() && i<= endResult; i++) {
      strokeWeight(1);
      stroke(tabColor2);
      fill(draggableContentBoxColor, 100);
      rect(0, y2, 275, y2+30 );
      fill(menuColor1);
   //   fill(textColor1);
      //textFont(fbold);
      textSize(12);
      String t = bandNames.get(Integer.parseInt(searchResults.get(i)));
      
      if (t.length()>25)
        t = t.substring(0, 26)+"...";
      //  System.out.println(t);
      text(t, 130, y2+20);
      y2 = y2 + 30;
      
    } 
    if(endResult < searchResults.size()-1){
    fill(tabColor2);  
    image(nextArrow, 230, h - 45);
    textSize(20);
    text("Next",200, h - 15);
    }
    if(startResult > 0){
    fill(tabColor2); 
   textSize(20); 
    image(prevArrow, 5, h - 45);
  text("Previous",90, h - 15);
      
  }
    
  textFont(f2);
   }
  boolean mousePressed(float px, float py) 
  {
    // 920,20,175,600
    if(px >= 1169 && px <= 1186 && py >= 581 && py <= 610 && endResult<searchResults.size()-1){
      
      if(endResult + 1 < searchResults.size()){
      startResult = endResult+1;
      endResult = endResult+ 17;
      if(endResult >= searchResults.size())
      endResult = searchResults.size()-1;
      }
      
    return true;
      }
      else{
      if(px >= 931 && px <= 958 && py >= 581 && py <= 610 && startResult>0){
      
      if(startResult-1 > 0){
      endResult = startResult-1;
      startResult = startResult - 17;
      if(startResult < 0)
      startResult = 0;
      }
      
    return true;
      } 
      }
      return false;
  }
  boolean contentClicked(float lx, float ly)
  {
    return false;
  }
  boolean contentPressed(float lx, float ly) {
    return false;
  }
  boolean keypressed() {
    
    if (myTextfield.isFocus()) {
       if (key != CODED && key == '\b' && searching.length()>0) {
      searching = searching.substring(0, searching.length()-1);
      if (searching.length()==1 && searching.equals(""))
        searching = "";
    }
    else {
      char c = (char)key;
      if ((c >= 'a' && c <= 'z') || (c >= 65 && c <= 90) || (c >= '0' && c <= '9') || (c == ' ') || (c == '-') || (c == '.'))
        searching = searching+ key;
      else
        if (c == 10)
          searching = "";
    }
  
      searchResults = new ArrayList<String>();
     // System.out.pr
      for (int i = 0; i<bandNames.size(); i++) {
        String tolower = bandNames.get(i).toLowerCase();
    
        if (tolower.contains(searching.toLowerCase())) {

          // System.out.println(tolower+" BUT "+searching.toLowerCase());
          searchResults.add(""+i);
        //  System.out.println(searchResults.size());
      //    System.out.println(track.getName());
        }
      }
    }

    return myTextfield.isFocus();
  }

boolean mouseDragged(float lx, float ly){
  // rect(0, 40, 275, 600); 
 //System.out.println("Dragging");
return handleMouse( lx, ly);
}
boolean handleMouse(float lx, float ly){
if(lx >= x && lx <= x+w && ly >= y+30  && ly <= y+h && dragged.equals("")){
  int stringSelected = (int)ly - 40;
      stringSelected = stringSelected/30;
      stringSelected = stringSelected-1+startResult;
  if(stringSelected <= endResult && stringSelected >= startResult && stringSelected <searchResults.size()){
  dragged = bandNames.get(Integer.parseInt(searchResults.get(stringSelected)));
  draggedIndex = stringSelected;
  }
  return true;

}else{
return false;
}

}

}

