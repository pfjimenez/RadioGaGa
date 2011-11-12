// This class is used to draw the Center View for Graph View
class CenterView extends View {
  public String currentlyViewing = "";
  public int currentIndex = -1;
  
  CenterView(float x_, float y_, float w_, float h_)
  {
    super(x_, y_, w_, h_);
  }


  void drawContent()
  {
    strokeWeight(2);
    stroke(tabColor2);
    fill(255);
    rect(x,y,w,h);
    if(currentIndex != -1){
    
      fill(textColor1);
      text(currentlyViewing, x+(w/2) , y+(h/2));
    }
  }
  boolean mousePressed(float px, float py) 
  {
    return false;
  }
  boolean contentClicked(float lx, float ly)
  {
    return false;
  }
boolean contentPressed(float lx, float ly){
 return false; 
}
boolean mouseReleased(int posX, int posY){
if(posX >= x && posX <= x+w && posY >= y && posY <= y+h){
if(searchView.draggedIndex != -1){

currentlyViewing = searchView.dragged;
//System.out.println("Currently Viewing "+ currentlyViewing);
currentIndex = searchView.draggedIndex;
searchView.draggedIndex = -1;
searchView.dragged = "";
}
return true;
}
searchView.draggedIndex = -1;
searchView.dragged = "";

return false;
}
}

