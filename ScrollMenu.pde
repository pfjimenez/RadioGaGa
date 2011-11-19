class ScrollMenu extends View {

  public PImage uparrow;
  public PImage downarrow; 
  public int smallHeight;
  public boolean expanded;
  public int openedHeight;
  Integrator head;
  //Integrator leftMenu = new Integrator(20);
  //Integrator leftCheckBoxes = new Integrator(100);
  //Integrator leftText = new Integrator(130);


  void draw()
  {
    
    rectMode(CORNERS);
    pushMatrix();
    translate(this.x, this.y);
    // draw out content, then our subviews on top
    //    drawContent();
    fill(0, 150);
    rect(0, head.value, w, openedHeight);
   if(expanded){
     if(subviews.size()>0){
    int divid = (openedHeight-50)/(subviews.size());
     for (int i = 0; i < subviews.size(); i++) {
      View v = (View)subviews.get(i);
      
      v.y = ((divid*(i+1)))+head.value;
 //    System.out.println(v.y); 
      v.draw();
    }
  //roundrect(0, openedHeight, (int)w, smallHeight, 10);
     }
 }else{
    for (int i = 0; i < subviews.size(); i++) {
      View v = (View)subviews.get(i);
      v.y = ((300*(i+1)))+head.value;
   //  System.out.println(v.y); 
      v.draw();
    }
   //  roundrect(0, openedHeight, (int)w, smallHeight, 10);
   
   }
 
    fill(tabColor2);
 
   roundrect(0, openedHeight, (int)w, smallHeight, 10);
 
    roundrect(0, (int)head.value, (int)w, smallHeight, 10);
    if (expanded)
      image(downarrow, w/2-10, head.value-5);
    else {
      image(uparrow, w/2-10, head.value-5);
    }
    
    
    head.update(); 

    popMatrix();
   
  }

  public ScrollMenu(float x_, float y_, float w_, float h_, boolean expanded, int openedHeight ) {

    super(x_, y_, w_, openedHeight+30);
    this.expanded = expanded;
    uparrow = loadImage("br_up.png");
    downarrow = loadImage("br_down.png"); 
    uparrow.resize(0, 15);
    downarrow.resize(0, 15);
    this.openedHeight = openedHeight;
    smallHeight = (int)h_;
    this.head = new Integrator (openedHeight); 


    // Source of the Code: http://processing.org/discourse/yabb2/YaBB.pl?num=1213696787
    if (expanded)
      head.target(0);
    //System.out.println(hi.value);
  }


  void roundrect(int x2, int y2, int w2, int h2, int r) {

    noStroke();
    rectMode(CORNER);

    int  ax, ay, hr;

    ax=x2+w2-1;
    ay=y2+h2-1;
    hr = r/2;

    rect(x2, y2, w2, h2);
    arc(x2, y2, r, r, radians(180.0), radians(270.0));
    arc(ax, y2, r, r, radians(270.0), radians(360.0));
    arc(x2, ay, r, r, radians(90.0), radians(180.0));
    arc(ax, ay, r, r, radians(0.0), radians(90.0));
    rect(x2, y2-hr, w2, hr);
    rect(x2-hr, y2, hr, h2);
    rect(x2, y2+h2, w2, hr);
    rect(x2+w2, y2, hr, h2);

    rectMode(CORNERS);
  }
  /*
  void drawContent() {
    fill(0);
 rect(0,0,w,h);
    fill(0, 150);
    rect(0, head.value, w, openedHeight);
    fill(tabColor2);

    roundrect(0, openedHeight, (int)w, smallHeight, 10);
    roundrect(0, (int)head.value, (int)w, smallHeight, 10);
    if (expanded)
      image(downarrow, w/2-10, head.value-5);
    else {
      image(uparrow, w/2-10, head.value-5);
    } 
    //head.update();
  } 
  */
  boolean contentClicked(float lx, float ly) {
    
  //  System.out.println("Hey in here "+x+"  BUT "+ lx);
    if (expanded) {
      if (lx >= 0  && lx <= w && ly >= -5 && ly <= smallHeight) { 
        expanded = !expanded;
        head.target(openedHeight);
      }
    }
    else {
      if (lx >= 0 && lx <= w && ly >= openedHeight-5 && ly <= openedHeight+smallHeight) { 
        expanded = !expanded;
        head.target(0);
      }
    }
    return true;
  }
}
/*
class ScrollMenu extends View {
 
 public PImage uparrow;
 public PImage downarrow; 
 public int smallHeight;
 public boolean expanded;
 public int openedHeight;
 Integrator head;
 //Integrator leftMenu = new Integrator(20);
 //Integrator leftCheckBoxes = new Integrator(100);
 //Integrator leftText = new Integrator(130);
 
 public ScrollMenu(float x_, float y_, float w_, float h_, boolean expanded, int openedHeight ){
 
 super(x_, y_, w_, openedHeight+30);
 this.expanded = expanded;
 uparrow = loadImage("br_up.png");
 downarrow = loadImage("br_down.png"); 
 uparrow.resize(0,15);
 downarrow.resize(0,15);
 this.openedHeight = openedHeight;
 smallHeight = (int)h_;
 head = new Integrator (openedHeight); 
 // Source of the Code: http://processing.org/discourse/yabb2/YaBB.pl?num=1213696787
 if(expanded)
 head.target(0);
 }
 
 
 void roundrect(int x2, int y2, int w2, int h2, int r) {
 
 noStroke();
 rectMode(CORNER);
 
 int  ax, ay, hr;
 
 ax=x2+w2-1;
 ay=y2+h2-1;
 hr = r/2;
 
 rect(x2, y2, w2, h2);
 arc(x2, y2, r, r, radians(180.0), radians(270.0));
 arc(ax, y2, r,r, radians(270.0), radians(360.0));
 arc(x2, ay, r,r, radians(90.0), radians(180.0));
 arc(ax, ay, r,r, radians(0.0), radians(90.0));
 rect(x2, y2-hr, w2, hr);
 rect(x2-hr, y2, hr, h2);
 rect(x2, y2+h2, w2, hr);
 rect(x2+w2,y2,hr, h2);
 
 rectMode(CORNERS);
 }
 void drawContent(){
 
 fill(0,150);
 rect(0,head.value,w,openedHeight);
 fill(tabColor2);
 
 roundrect(0,openedHeight,(int)w,smallHeight,10);
 roundrect(0,(int)head.value,(int)w,smallHeight,10);
 if(expanded)
 image(downarrow, w/2-10,head.value-5);
 else{
 image(uparrow,w/2-10,head.value-5);
 } 
 head.update();
 
 
 } 
 boolean mousePressed(float lx, float ly){
 if(expanded){
 if(lx >= x && lx <= x+w && ly >= y-5 && ly <= y+smallHeight){ 
 expanded = !expanded;
 head.target(openedHeight);
 
 
 }
 }
 else{
 if(lx >= x && lx <= x+w && ly >= y+openedHeight-5 && ly <= y+openedHeight+smallHeight){ 
 expanded = !expanded;
 head.target(0);
 
 }
 }
 return true;
 }
 }
 */
