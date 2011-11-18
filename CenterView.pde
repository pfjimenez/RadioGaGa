// This class is used to draw the Center View for Graph View
class CenterView extends View {

<<<<<<< HEAD
  public String currentlyViewing = "";
  public int currentIndex = -1;
  public int lastDrag = -555;
=======
>>>>>>> parent of ef4fb8b... Updates

  CenterView(float x_, float y_, float w_, float h_)
  {
    super(x_, y_, w_, h_);
  }


  void drawContent()
  {
    strokeWeight(2);
    stroke(tabColor2);
    fill(255);
    rect(x, y, w, h);
    if (currentIndex != -1) {

      fill(textColor1);
      text(currentlyViewing, x+(w/2), y+(h/2));
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
  boolean contentPressed(float lx, float ly) {
    return false;
  }

}

