
class BasicMenuView extends View {

 
 /*
 Integrator leftMenuHead = new Integrator(20);
  Integrator leftMenu = new Integrator(20);
  Integrator leftCheckBoxes = new Integrator(150);
  Integrator leftText = new Integrator(130);
*/  
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
  BasicMenuView(float x_, float y_, float w_, float h_)
  {
    super(x_, y_, w_, h_);
     
     /*checkboxChecked.resize(0,25);
     checkboxUnchecked.resize(0,25);
     checkboxChecked2.resize(0,25);
     checkboxUnchecked2.resize(0,25);
    
     uparrow.resize(0,15);
     downarrow.resize(0,15);
     */
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
  fill(tabColor2);
 
 roundrect(0,0,600,20,20);
 fill(textColor2);
 textFont(fbold);
 text("Filter:",50,15);
 
 /*
 if(gendersChecked)
 image(checkboxChecked,100,-3);
 else
 image(checkboxUnchecked,100,-3);
 
 text(" By Gender",180,17);
 
 if(regionChecked)
 image(checkboxChecked,350,-3);
 else
 image(checkboxUnchecked,350,-3);
 
 text(" By Region",430,17);
 textFont(f2);

 if(!genderExpand){
 fill(tabColor2);
 roundrect(80,-20,190,5,10);
 image(uparrow, 165,-25);
 }else{
   
 /*
 Integrator leftMenuHead = new Integrator(20);
  Integrator leftMenu = new Integrator(20);
  Integrator leftCheckBoxes = new Integrator(150);
  Integrator leftText = new Integrator(130);
  
 */
 /*
 fill(tabColor2);
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

 }
 
 if(!regionExpand){
 fill(tabColor2);
 roundrect(330,-20,190,5,10);
 image(uparrow, 420,-25);
 }
 */
  }
  
  boolean contentClicked(float lx, float ly)
  {
    
   // System.out.println("Content Clicked Filter: "+lx + " , "+ly);
   /* 
    if(lx >= 102 && lx <= 122 && ly >= 0 && ly <= 20 ){
      
     // System.out.println(gendersChecked);
      gendersChecked = !gendersChecked;
    //  System.out.println(gendersChecked);
    if(gendersChecked)
    regionChecked = false;
    }
    if(lx >= 355 && lx <= 375 && ly >= 0 && ly <= 20 ){
      
     // System.out.println(gendersChecked);
      regionChecked = !regionChecked;
    //  System.out.println(gendersChecked);
    if(regionChecked)
    gendersChecked = false;
    }
   
    */
     return true;
  }

  
}
