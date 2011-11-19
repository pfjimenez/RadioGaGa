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
  public int numBoxes = 16;
  public int endResult = numBoxes;

  public int stringSelected = -1;
  public ArrayList<String> searchResults;
  public  String dragged = "";
  public int draggedIndex = -1;

  int boxStart = 30;

  SearchView(float x_, float y_, float w_, float h_)
  {
    super(x_, y_, w_, h_);
    // Searchbox Setting up
    controlP5.setColorBackground(0);
    strokeWeight(2);
    controlP5.setColorActive(tabColor2);

    myTextfield = controlP5.addTextfield("", int(x), int(y), int(w), 30);
    myTextfield.valueLabel().setFont(ControlP5.grixel);
    myTextfield.setFocus(false);
    searchResults = new ArrayList<String>();
    for (int i = 0; i< bandNames.size(); i++) {
      searchResults.add(""+i);
    }
    endResult = numBoxes;
    //System.out.println(searchResults.size());
  }

  SearchView(float x_, float y_, float w_, float h_, int numBoxes_)
  {
    super(x_, y_, w_, h_);
    numBoxes = numBoxes_;
    endResult = numBoxes;
    // Searchbox Setting up
    controlP5.setColorBackground(0);
    strokeWeight(2);
    controlP5.setColorActive(tabColor2);

    myTextfield = controlP5.addTextfield("", int(x), int(y), int(w), 30);
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
    rectMode(CORNER);
    strokeWeight(1);
    stroke(tabColor2);
    fill(draggableContentBoxColor);
    textAlign(CENTER);
    rect(0, 0, w, h); 
    textFont(fbold);
    textSize(22);
    int y2 = boxStart;
    for (int i = startResult; i< searchResults.size() && i<= endResult; i++) {
      fill(draggableContentBoxColor, 100);
      rect(0, y2, w, 30 );
      fill(menuColor1);
      //   fill(textColor1);
      //textFont(fbold);
      textSize(12);
      String t = bandNames.get(Integer.parseInt(searchResults.get(i)));

      if (t.length()>25)
        t = t.substring(0, 26)+"...";
      //  System.out.println(t);
      text(t, w/2, y2+20);
      y2 = y2 + 30;
    } 
    textAlign(LEFT, TOP);
    textSize(largeFontSize);
    if (endResult < searchResults.size()-1) {
      fill(tabColor2);  
      image(nextArrow, w - 100, h - 30);
      text("Next", w - 100 + 40, h - 2*normalFontSize);
    }
    if (startResult > 0) {
      fill(tabColor2); 
      image(prevArrow, 10, h - 30);
      text("Previous", 40, h -  2*normalFontSize);
    }

    textFont(f2);
  }

  boolean contentClicked(float lx, float ly)
  {

    if ((lx >= w - 100 && lx <= w - 100 + textWidth("Next") && ly >= h - 2*normalFontSize && ly <= h) || 
      (lx >= w - 100 + textWidth("Next") + 10 && lx <= w - 100 + textWidth("Next") + 10 + 30 && ly >= h - 30 && ly <= h)) { // Click on Next 
      startResult = constrain(startResult+numBoxes, 0, searchResults.size()-1);
      endResult = constrain(endResult+numBoxes, numBoxes, searchResults.size()-1);
    } 

    if ((lx >= 10 && lx <= 30 + 10 && ly >= h -  2*normalFontSize && ly <= h) ||
      (lx >= 40 && lx <= 40 + textWidth("Previous") && ly >= h - 30 && ly <= h)) {
      startResult = constrain(startResult-numBoxes, 0, searchResults.size()-1);
      endResult = constrain(endResult-numBoxes, numBoxes, searchResults.size()-1);
    }

    return true;
  }

boolean keypressed() {
    startResult = 0;
   endResult = numBoxes;
    
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

  boolean contentPressed(float lx, float ly)
  {
    if (lx >= 0 && lx <= w  && ly >= boxStart  && ly <= boxStart +((numBoxes+2)*boxStart) && dragged.equals("")) {
      stringSelected = ((int)ly + boxStart)/30;
      stringSelected = stringSelected-2+startResult;
      System.out.println(stringSelected);
    }
    return true;
  }

  boolean contentDragged(float lx, float ly) {
    handleMouse( lx, ly);
    return true;
  }

  void handleMouse(float lx, float ly) {
    System.out.println(lx +" "+ly );
    if (dragged.equals("") && stringSelected != -1) {  
      draggingContent = true;
      if (stringSelected <= endResult && stringSelected >= startResult && stringSelected <searchResults.size()) {
        dragged = bandNames.get(Integer.parseInt(searchResults.get(stringSelected)));
        draggedIndex = stringSelected;
      }
    }
  }
}

