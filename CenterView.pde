// This class is used to draw the Center View for Graph View
class CenterView extends View {
  public String currentlyViewing = "";
  public int currentIndex = -1;
  public int lastDrag = -555;
  CenterView(float x_, float y_, float w_, float h_)
  {
    super(x_, y_, w_, h_);
  }


  void drawContent()
  {
    strokeWeight(2);
    stroke(tabColor2);
    fill(255);
    rect(10, 10, w, h);
    fill(tabColor2);
    text(currentlyViewing,w/2,h/2);
    /* if(viewTabs.view == 2 && allChecked){
     int x2 = 70;
     int y2 = 0;
     for(int i = 0 ; i < 5;i++){
     Entry e = new Entry((float)x2,(float)y2,(float)50,h,i);
     this.subviews.add(e);
     x2+=100;
     } 
     }
     */
    /* if (currentIndex != -1) {
     
     fill(textColor1);
     text(currentlyViewing, x+(w/2), y+(h/2));
     }
     */
  }
  boolean mousePressed(float px, float py) 
  {
    return false;
  }
  boolean contentClicked(float lx, float ly)
  {
    return false;
  }
  boolean contentPressed(float lx, float ly) {
    return false;
  }
  boolean mouseReleased(int posX, int posY) {

    if (posX >= x && posX <= x+w && posY >= y && posY <= y+h) {
      if (searchView.draggedIndex != -1) {

        currentlyViewing = searchView.dragged;
        //System.out.println("Currently Viewing "+ currentlyViewing);
        currentIndex = searchView.draggedIndex;
        searchView.draggedIndex = -1;
        searchView.dragged = "";
     
      return true; 
    }else{
    if(lastDrag != -555){
    lastDrag = -555;
  return true;  
  }
    }
    }
    
    return false;
  
}
//boolean mouseClicked(float lx, float ly)
  boolean contentDragged(float lx, float ly) {
  //  System.out.println("LaLaLa Dragging LX = "lx+" BUT X"+x);
//  if()
    if(searchView.draggedIndex == -1){
    if (lastDrag == -555) {
      lastDrag = (int)lx;
    }
    
    else {
      
    // System.out.println("Diff = "+(lx)+" AND Condition: "+((lx - lastDrag)%50==0));
    }
 return true;  
}
   return false;

  }

    
  
}

