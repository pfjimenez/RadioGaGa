// This class is used to draw the Center View for Graph View
class CenterView extends View {
<<<<<<< HEAD


=======
  public String currentlyViewing = "";
  public int currentIndex = -1;
  public int lastDrag = -555;
>>>>>>> daa99f634038ad80ff74ba844c425e27d7e3fdd2
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
    text(currentlyViewing,w/2,h/2);
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
     line(40,h-30,40,10);
       fill(0);
       textSize(10);
if(!gendersChecked && ! ageChecked && !regionChecked){
     for(int i = 0; i < 315;i+=50){
       float y3 = map(i*10000,0,3150000,h-30,10);
       text(i,25,y3);
     }}
     if(gendersChecked){
       for(int i = 0; i < 8000;i+=1000){
       float y3 = map(i,0,7150,h-30,5);
       text(i,25,y3);
     }
     }
     if(regionChecked){
       for(int i = 0; i < 8000;i+=500){
       float y3 = map(i,0,8000,h-30,5);
       text(i,25,y3);
       }
     }
     if(ageChecked){
            for(int i = 0; i < 7000;i+=500){
       float y3 = map(i,0,7000,h-30,5);
       text(i,25,y3);
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
  
}

