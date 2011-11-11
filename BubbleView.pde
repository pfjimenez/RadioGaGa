// This class is used to draw the Center View for Graph View
class BubbleView extends View {
  public String currentlyViewing = "";
  public int currentIndex = -1;
  
  BubbleView(float x_, float y_, float w_, float h_)
  {
    super(x_, y_, w_, h_);
  }


  void drawContent()
  {
    strokeWeight(2);
    stroke(tabColor2);
    fill(255);
    rect(x,y,w,h);
  
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

return true;
}
}

