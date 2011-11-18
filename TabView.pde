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
    textSize(largeFontSize);
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
  /*boolean mousePressed(float px, float py) {
   
   if(py >= tabTop && py <= tabBottom){
   contentPressed(px,py);
   }
   return (py >= tabTop && py <= tabBottom);
   
   }*/
  boolean contentClicked(float lx, float ly)
  {
//    System.out.println(ly + " BUT "+tabTop + " AND " +tabBottom);  
   if(ly >y && ly < y+h){

      // Changing the view if a tab is clicked  
      for (int i = 0; i< 4; i++) {

    //   System.out.println(lx + " BUT "+ tabLeft[i]+ " AND "+ tabRight[i]);
        if (lx >= tabLeft[i] && lx <= tabRight[i]) {
          view = i + 1;
        }
      }
      switch(view) {
      case 1:  
        if (mainView.subviews.contains(graphView)) mainView.subviews.remove(graphView);
        searchView.myTextfield.hide();
        if (mainView.subviews.contains(searchView)) mainView.subviews.remove(searchView);
        searchView.dragged= "";
        searchView.draggedIndex = -1; 
        graphView.entryIndex = new ArrayList<String>();
        graphView.entryViewing = new ArrayList<String>(); 
        if (!mainView.subviews.contains(bubbleView))mainView.subviews.add(bubbleView); 
        if (mainView.subviews.contains(menuView)) mainView.subviews.remove(menuView);
        if (mainView.subviews.contains(genderScroll))mainView.subviews.remove(genderScroll);
        if (mainView.subviews.contains(regionScroll))mainView.subviews.remove(regionScroll);
        if (mainView.subviews.contains(ageScroll))mainView.subviews.remove(ageScroll);
      
        break;
      case 2:  
        searchView.myTextfield.show(); 
        if (!mainView.subviews.contains(searchView))mainView.subviews.add(searchView);
        if (!mainView.subviews.contains(graphView))mainView.subviews.add(graphView); 

        searchView.searchResults = new ArrayList<String>();
        for (int i = 0; i< bandNames.size();i++) {
          searchView.searchResults.add(""+i);
        }
        if (mainView.subviews.contains(bubbleView)) mainView.subviews.remove(bubbleView);
        if (!mainView.subviews.contains(genderScroll))mainView.subviews.add(genderScroll);
        if (!mainView.subviews.contains(regionScroll)) mainView.subviews.add(regionScroll);
        if (!mainView.subviews.contains(ageScroll))mainView.subviews.add(ageScroll);
    
        if (!mainView.subviews.contains(menuView))mainView.subviews.add(menuView);
        if (menuView.all.value) {
          int x2 = 70;
          int y2 = 0;
          startEntry = 0;
          endEntry = 8;
          
          for (int j = startEntry ; j <= endEntry;j++) {
            Entry e = new Entry((float)x2, (float)y2, (float)50, graphView.h, j);
            if (!graphView.subviews.contains(e))graphView.subviews.add(e);
            x2+=90;
          }
          
        }
        
       
        break;
      case 3:  
        if (mainView.subviews.contains(graphView)) mainView.subviews.remove(graphView);
        searchView.myTextfield.hide();
        if (mainView.subviews.contains(searchView)) mainView.subviews.remove(searchView);
        searchView.dragged= ""; 
        searchView.draggedIndex = -1; 
        graphView.entryIndex = new ArrayList<String>();
        graphView.entryViewing = new ArrayList<String>(); 
        if (mainView.subviews.contains(bubbleView)) mainView.subviews.remove(bubbleView); 
        if (mainView.subviews.contains(menuView)) mainView.subviews.remove(menuView);
        if (mainView.subviews.contains(genderScroll))mainView.subviews.remove(genderScroll);
        if (mainView.subviews.contains(regionScroll))mainView.subviews.remove(regionScroll);
        if (mainView.subviews.contains(ageScroll))mainView.subviews.remove(ageScroll);
     
        break;
      case 4:  
        if (mainView.subviews.contains(graphView)) mainView.subviews.remove(graphView);
        searchView.myTextfield.hide();
        if (mainView.subviews.contains(searchView)) mainView.subviews.remove(searchView);
        searchView.dragged= ""; 
        searchView.draggedIndex = -1; 
        graphView.entryIndex = new ArrayList<String>();
        graphView.entryViewing = new ArrayList<String>(); 
        if (mainView.subviews.contains(bubbleView)) mainView.subviews.remove(bubbleView); 
        if (mainView.subviews.contains(menuView)) mainView.subviews.remove(menuView);
        if (mainView.subviews.contains(genderScroll))mainView.subviews.remove(genderScroll);
        if (mainView.subviews.contains(regionScroll))mainView.subviews.remove(regionScroll);
        if (mainView.subviews.contains(ageScroll))mainView.subviews.remove(ageScroll);
    
        break;
      }
    

    return true;
  }
  return false;
  }
  
}

