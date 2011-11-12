

class MenuView extends View {

  public PImage checkboxChecked = loadImage("checkbox_checked.png");
 
  public PImage checkboxUnchecked = loadImage("checkbox_unchecked.png");
  public PImage checkboxChecked2 = loadImage("checkbox_checked.png");
 
  public PImage checkboxUnchecked2 = loadImage("checkbox_unchecked.png");
  
  public PImage uparrow = loadImage("br_up.png");
  public PImage downarrow = loadImage("br_down.png");
  
 
 Integrator leftMenuHead = new Integrator(20);
  Integrator leftMenu = new Integrator(20);
  Integrator leftCheckBoxes = new Integrator(150);
  Integrator leftText = new Integrator(130);
 Checkbox byGender = new Checkbox((float)100,(float)-5,25,25,checkboxChecked, checkboxUnchecked,"By Gender",gendersChecked);
 Checkbox byRegion = new Checkbox((float)320,(float)-5,25,25,checkboxChecked, checkboxUnchecked,"By Region",regionChecked);
  
  /*
   roundrect(80,-20,190,5,10);
 rectMode(CORNERS);
 fill(0,150);
 rect(80,-340,270,-25);
 fill(tabColor2);
 roundrect(80,-340,190,5,10);
 image(uparrow, 165,-345);
 if(maleChecked)
 image(checkboxChecked,90,-250); 
 else
 image(checkboxUnchecked,90,-250); 
 
 fill(255);
 textFont(fbold);
 text("Men", 150, -230);
 
 if(femaleChecked)
 image(checkboxChecked,90,-150);
else
 image(checkboxUnchecked,90,-150); 

 text("Women", 165, -130);

  */
  MenuView(float x_, float y_, float w_, float h_)
  {
    super(x_, y_, w_, h_);
     
     this.subviews.add(byGender);    
     this.subviews.add(byRegion);    
    
     uparrow.resize(0,15);
     downarrow.resize(0,15);
  //newcheckbox = new Checkbox(15,15,12,12,"Test",boldTextColor);
 // this.subviews.add(newcheckbox);
  //newSlider = new HRangeSlider(15,50,12,12,test,1);
  //this.subviews.add(newSlider);
  }
  
  // Source of the Code: http://processing.org/discourse/yabb2/YaBB.pl?num=1213696787
void roundrect(int x, int y, int w, int h, int r) {
 
 noStroke();
 rectMode(CORNER);

 int  ax, ay, hr;

 ax=x+w-1;
 ay=y+h-1;
 hr = r/2;

 rect(x, y, w, h);
 arc(x, y, r, r, radians(180.0), radians(270.0));
 arc(ax, y, r,r, radians(270.0), radians(360.0));
 arc(x, ay, r,r, radians(90.0), radians(180.0));
 arc(ax, ay, r,r, radians(0.0), radians(90.0));
 rect(x, y-hr, w, hr);
 rect(x-hr, y, hr, h);
 rect(x, y+h, w, hr);
 rect(x+w,y,hr, h);

rectMode(CORNERS);
}
  
  void drawContent()
  {
  //  rect(0,0,w,h);
  fill(menuColor1);
 
 roundrect(0,0,800,15,15);
 fill(textColor2);
 textFont(fbold);
 textSize(18);
 text("Filter:",50,12);
 
 /*
 if(gendersChecked)
 image(checkboxChecked,100,-5);
 else
 image(checkboxUnchecked,100,-5);
 */
 // float x_, float y_, int sized,PImage checked, PImage unchecked, String text_,boolean value
 //text(" By Gender",180,15);
 
 /*if(regionChecked)
 image(checkboxChecked,320,-5);
 else
 image(checkboxUnchecked,320,-5);
 
 text(" By Region",400,15);
 */
 textFont(f2);

 if(!genderExpand){
 fill(tabColor2);
 roundrect(80,-16,190,5,10);
 image(uparrow, 165,-23);
 }else{
   
 /*
 Integrator leftMenuHead = new Integrator(20);
  Integrator leftMenu = new Integrator(20);
  Integrator leftCheckBoxes = new Integrator(150);
  Integrator leftText = new Integrator(130);
  
 */
 fill(tabColor2);
 roundrect(80,-16,190,5,10);
 rectMode(CORNERS);
 fill(0,150);
 rect(80,-338,270,-21);
 fill(tabColor2);
 roundrect(80,-336,190,5,10);
 image(downarrow, 163,-342);
 if(maleChecked)
 image(checkboxChecked,90,-250); 
 else
 image(checkboxUnchecked,90,-250); 
 
 fill(255);
 textFont(fbold);
 text("Men", 150, -230);
 
 if(femaleChecked)
 image(checkboxChecked,90,-150);
else
 image(checkboxUnchecked,90,-150); 

 text("Women", 165, -130);

 }
 
 if(!regionExpand){
 fill(tabColor2);
 roundrect(310,-20,190,5,10);
 image(uparrow, 400,-25);
 }
 else{
 fill(tabColor2);
 roundrect(310,-16,190,5,10);
 rectMode(CORNERS);
 fill(0,150);
 rect(310,-338,500,-21);
 fill(tabColor2);
 
 roundrect(310,-336,190,5,10);
 image(downarrow, 400,-342);
 
 
 }
 textFont(f2);
  }
  
  boolean contentClicked(float lx, float ly)
  {
      System.out.println("CLICKING");
    
    if(gendersChecked){
    maleChecked = true;
   femaleChecked = true; 
    }
    return true;
  }

  
}
