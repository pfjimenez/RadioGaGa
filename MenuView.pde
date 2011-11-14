

class MenuView extends View {




  Integrator leftMenuHead = new Integrator(20);
  Integrator leftMenu = new Integrator(20);
  Integrator leftCheckBoxes = new Integrator(100);
  Integrator leftText = new Integrator(130);

  Checkbox byGender;
  Checkbox byRegion;

  Checkbox byAge;
  /*
  Checkbox showMales = new Checkbox((float)90, (float)-100, 25, 25, checkboxChecked, checkboxUnchecked, "Males", true);
   Checkbox showFemales = new Checkbox((float)90, (float)-60, 25, 25, checkboxChecked, checkboxUnchecked, "Females", true);
   */

  MenuView(float x_, float y_, float w_, float h_)
  {
    super(x_, y_, w_, h_);
/*
    byGender = new Checkbox((float)100, (float)-5, 25, 25, buttonCheck, buttonCross, "By Gender  ", gendersChecked);
    byRegion = new Checkbox((float)320, (float)-5, 25, 25, buttonCheck, buttonCross, "By Region  ", regionChecked);

    byAge = new Checkbox((float)520, (float)-5, 25, 25, buttonCheck, buttonCross, "By Age     ", ageChecked);
*/
// String text_, boolean value, char c
 byGender = new Checkbox((float)110, (float)5, 25, 25, "By Gender  ", gendersChecked,'1');
    byRegion = new Checkbox((float)330, (float)5, 25, 25,"By Region  ", regionChecked,'1');

    byAge = new Checkbox((float)530, (float)5, 25, 25, "By Age     ", ageChecked,'1');

    this.subviews.add(byGender);    
    this.subviews.add(byRegion);
    this.subviews.add(byAge);
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
    textFont(f2);

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

      Checkbox c = (Checkbox)subviews.get(i);
      View v = (View)subviews.get(i);
      if (v.mouseClicked(lx, ly)) {
        if (c.getTitle().contains("Age")&& c.value ){
        byGender.value = false;
        byRegion.value = false;
        }
        if (c.getTitle().contains("Region")&& c.value ){
        byGender.value = false;
        byAge.value = false;
        }
        if (c.getTitle().contains("Gender")&& c.value ){
        byAge.value = false;
        byRegion.value = false;
        }
        


        
          return true;
      }
    }
    return contentClicked(lx, ly);
  }
  
}

