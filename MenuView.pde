

class MenuView extends View {

  MenuView(float x_, float y_, float w_, float h_)
  {
    super(x_, y_, w_, h_);

  //newcheckbox = new Checkbox(15,15,12,12,"Test",boldTextColor);
 // this.subviews.add(newcheckbox);
  
  String[] test = {"A","B","C"};
  //newSlider = new HRangeSlider(15,50,12,12,test,1);
  //this.subviews.add(newSlider);
  }

  
  void drawContent()
  {
  //  fill(0);
  //  rect(0,0,w,h);
  }
  
  boolean contentClicked(float lx, float ly)
  {

    return true;
  }
  
}
