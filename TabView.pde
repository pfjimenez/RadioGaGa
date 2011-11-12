// Can you see this?
class TabView extends View {


  public int view = 1; // this variable is used to know in which tap is selected. 
  public float[] tabLeft, tabRight;
  public float tabTop, tabBottom;
  public float tabPad = 20;
//public ArrayList<Track> searchResults;
  TabView(float x_, float y_, float w_, float h_)
  {
    super(x_, y_, w_, h_);
  }


  void drawContent()
  {
    fill(0);
    //    rect(0,0,w,h);
    rectMode(CORNERS);
    noStroke();
    textSize(20);
    textAlign(LEFT);
    
    if (tabLeft == null) {
      tabLeft = new float[6];
      tabRight = new float[6];
    }

    float runningX =this.x;
    tabTop =  this.y;
    tabBottom = this.y + 30;

    for (int i = 1; i < 5; i++) {
      String title = "";
      switch(i) {
      case 1: 
        title = "Bubbles";
        break;
      case 2: 
        title = "Graphs"; 
        break;
      case 3: 
        title = "Tables";
        break;
      case 4:
        title = "Tag Crowd";
      }

      tabLeft[i-1] = runningX;
      float titleWidth = textWidth(title);
      tabRight[i-1] = tabLeft[i-1] + tabPad + titleWidth+ tabPad;

      fill(i == view ? tabColor2: tabColor1);
      rect(tabLeft[i-1], tabTop, tabRight[i-1], tabBottom);

      fill(i == view ? textColor2: textColor1);
      text(title, runningX + tabPad, this.y + 20);

      runningX = tabRight[i-1];
    }
  //  rectMode(CORNER);
  }
  boolean mousePressed(float px, float py) {
 
    if(py >= tabTop && py <= tabBottom){
   contentPressed(px,py);
   }
    return (py >= tabTop && py <= tabBottom);
    
  }
  boolean contentClicked(float lx, float ly)
  {
  return true;
  }
boolean contentPressed(float lx, float ly){
    if (mouseY >= tabTop && mouseY <= tabBottom) {
      // Changing the view if a tab is clicked  
      for (int i = 0; i< 4; i++) {
        if (mouseX >= tabLeft[i] && mouseX <= tabRight[i]) {
          view = i + 1;
      }
      }
       switch(view){
  case 1:  if(mainView.subviews.contains(graphView)) mainView.subviews.remove(graphView);searchView.myTextfield.hide();if(mainView.subviews.contains(searchView)) mainView.subviews.remove(searchView);searchView.dragged= "";
  searchView.draggedIndex = -1; graphView.currentIndex = -1; graphView.currentlyViewing = ""; mainView.subviews.add(bubbleView); if(mainView.subviews.contains(menuView)) mainView.subviews.remove(menuView);
break;
  case 2: mainView.subviews.add(searchView);mainView.subviews.add(graphView); mainView.subviews.add(menuView);searchView.myTextfield.show(); 
  searchView.searchResults = new ArrayList<String>();
  for (int i = 0; i< bandNames.size();i++) {
    searchView.searchResults.add(""+i);
    }
    if(mainView.subviews.contains(bubbleView)) mainView.subviews.remove(bubbleView);
   
  break;
  case 3:  if(mainView.subviews.contains(graphView)) mainView.subviews.remove(graphView);searchView.myTextfield.hide();if(mainView.subviews.contains(searchView)) mainView.subviews.remove(searchView);
  searchView.dragged= ""; searchView.draggedIndex = -1; graphView.currentIndex = -1; graphView.currentlyViewing = "";
   if(mainView.subviews.contains(bubbleView)) mainView.subviews.remove(bubbleView); if(mainView.subviews.contains(menuView)) mainView.subviews.remove(menuView);
break;
  case 4:  if(mainView.subviews.contains(graphView)) mainView.subviews.remove(graphView);searchView.myTextfield.hide();if(mainView.subviews.contains(searchView)) mainView.subviews.remove(searchView);
  searchView.dragged= ""; searchView.draggedIndex = -1; graphView.currentIndex = -1; graphView.currentlyViewing = "";
   if(mainView.subviews.contains(bubbleView)) mainView.subviews.remove(bubbleView); if(mainView.subviews.contains(menuView)) mainView.subviews.remove(menuView);
break;
 
  }
    } 
    
    return true;
  
}
}

