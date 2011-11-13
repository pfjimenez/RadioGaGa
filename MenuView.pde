

class MenuView extends View {

  public PImage checkboxChecked = loadImage("checkbox_checked.png");

  public PImage checkboxUnchecked = loadImage("checkbox_unchecked.png");
  public PImage checkboxChecked2 = loadImage("checkbox_checked.png");

  public PImage checkboxUnchecked2 = loadImage("checkbox_unchecked.png");


  Integrator leftMenuHead = new Integrator(20);
  Integrator leftMenu = new Integrator(20);
  Integrator leftCheckBoxes = new Integrator(100);
  Integrator leftText = new Integrator(130);

  Checkbox byGender = new Checkbox((float)100, (float)-5, 25, 25, checkboxChecked, checkboxUnchecked, "By Gender", true);
  Checkbox byRegion = new Checkbox((float)320, (float)-5, 25, 25, checkboxChecked, checkboxUnchecked, "By Region", regionChecked);
 /*
  Checkbox showMales = new Checkbox((float)90, (float)-100, 25, 25, checkboxChecked, checkboxUnchecked, "Males", true);
  Checkbox showFemales = new Checkbox((float)90, (float)-60, 25, 25, checkboxChecked, checkboxUnchecked, "Females", true);
*/

  MenuView(float x_, float y_, float w_, float h_)
  {
    super(x_, y_, w_, h_);

    this.subviews.add(byGender);    
    this.subviews.add(byRegion);
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
    arc(ax, y, r, r, radians(270.0), radians(360.0));
    arc(x, ay, r, r, radians(90.0), radians(180.0));
    arc(ax, ay, r, r, radians(0.0), radians(90.0));
    rect(x, y-hr, w, hr);
    rect(x-hr, y, hr, h);
    rect(x, y+h, w, hr);
    rect(x+w, y, hr, h);

    rectMode(CORNERS);
  }

  void drawContent()
  {
    fill(menuColor1);

    roundrect(0, 0, 800, 15, 15);
    fill(textColor2);
    textFont(fbold);
    textSize(18);
    text("Filter:", 50, 12);

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

    /*
  roundrect(80,-16,190,5,10);
     image(uparrow, 165,-23);
     */
  /*
    if (this.subviews.contains(showMales))
      this.subviews.remove(showMales);
    if (this.subviews.contains(showFemales))
      this.subviews.remove(showFemales);

*/
    /*
 Integrator leftMenuHead = new Integrator(20);
     Integrator leftMenu = new Integrator(20);
     Integrator leftCheckBoxes = new Integrator(150);
     Integrator leftText = new Integrator(130);
     
     */
    /*
 fill(tabColor2);
     roundrect(80,-16,190,5,10);
     rectMode(CORNERS);
     fill(0,150);
     rect(80,-128,270,-21);
     fill(tabColor2);
     roundrect(80,-126,190,5,10);
     image(downarrow, 163,-130);
     */
  //  this.subviews.add(showMales);
   // this.subviews.add(showFemales);

    /*
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

    /*
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
     fill(menuColor1);
     
     roundrect(0,0,800,15,15);
     fill(textColor2);
     textFont(fbold);
     textSize(18);
     text("Filter:",50,12);
     
     
     }
     */
    textFont(f2);
  }

  boolean contentClicked(float lx, float ly)
  {
    return false;
  }
  boolean mouseClicked(float px, float py)
  {
    // System.out.println(px + " "+ py);

    if (!ptInRect(px, py, x, y-200, w, h+200)) return false;
    float lx = px - x;
    float ly = py - y;
    // check our subviews first
    for (int i = subviews.size()-1; i >= 0; i--) {
      // System.out.println(i);

      View v = (View)subviews.get(i);
      if (v.mouseClicked(lx, ly)) return true;
    }
    return contentClicked(lx, ly);
  }
}

