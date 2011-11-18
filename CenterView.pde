// This class is used to draw the Center View for Graph View
class CenterView extends View {
  public ArrayList<String> entryViewing = new ArrayList<String>();
  public ArrayList<String> entryIndex = new ArrayList<String>();
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
    rect(10, 0, w, h);
    fill(tabColor2);
  //  text(currentlyViewing,w/2,h/2);
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
     strokeWeight(0.5);
     stroke(#CFCFCF);
     line(50,h-30,50,10);
       fill(0);
       textSize(10);
       
if(!gendersChecked && ! ageChecked && !regionChecked){
     for(int i = 0; i < 315;i+=50){
       float y3 = map(i*100000,0,maxAll,h-30,10);
       text(i,30,y3);
     }}
     if(gendersChecked){
       for(int i = 0; i < maxGender;i+=5000){
       float y3 = map(i,0,maxGender,h-30,5);
       text(i,30,y3);
     }
     }
     if(regionChecked){
       for(int i = 0; i < maxRegion;i+=5000){
       float y3 = map(i,0,maxRegion,h-30,5);
       text(i,30,y3);
       }
     }
     if(ageChecked){
            for(int i = 0; i < maxAge;i+=5000){
       float y3 = map(i,0,maxAge,h-30,5);
       text(i,30,y3);
       }
     
     }
     textSize(10);
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
/*
  boolean mouseReleased(int posX, int posY) {

    if (posX >= x && posX <= x+w && posY >= y && posY <= y+h) {
      if (searchView.draggedIndex != -1 && allChecked) {

        entryViewing.add(searchView.dragged);
        //System.out.println("Currently Viewing "+ currentlyViewing);
        entryIndex.add(""+searchView.draggedIndex);
        searchView.draggedIndex = -1;
        searchView.dragged = "";
     
      return true; 
    }else{
      
    if(searchView.draggedIndex != -1 && customizeChecked){
       searchView.draggedIndex = -1;
        searchView.dragged = "";
     
    }else{  
    if(lastDrag != -555){
    lastDrag = -555;
  return true;  
  }
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
*/
}

