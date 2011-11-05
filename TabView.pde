

class TabView extends View {

  
   public int view = 1; // this variable is used to know in which tap is selected. 
 public float[] tabLeft, tabRight;
 public float tabTop, tabBottom;
 public float tabPad = 20;

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
      title = "Graph";
      break;
    case 2: 
      title = "Table"; 
      break;
    case 3: 
      title = "Tag Crowd";
      break;
    case 4:
      title = "Bubble";
    }

    tabLeft[i-1] = runningX;
    float titleWidth = textWidth(title);
    tabRight[i-1] = tabLeft[i-1] + tabPad + titleWidth+ tabPad;

    fill(i == view ? 255: #BA55D3);
    rect(tabLeft[i-1], tabTop, tabRight[i-1], tabBottom);

    fill(i == view ? #BA55D3: #68228B);
    text(title, runningX + tabPad, this.y + 20);

    runningX = tabRight[i-1];
  }

  }
  
  boolean contentClicked(float lx, float ly)
  {

    return true;
  }
  
}
