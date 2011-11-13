color checkboxColor2 = 255;

class ScrolledCheckbox extends View {
  boolean value;
  color ckbColor = -1;
  PImage icon;
  String title;
  color iconColor = -1;
  PImage unchecked;
  PImage checked;
  int sized = 0;
  public Integrator interpolar;
  public int cutoff;
 ScrolledCheckbox(float x_, float y_,int w_, int h_,PImage checked, PImage unchecked, String text_,boolean value, Integrator i, int cutoff){
    super(x_, y_,w_,h_);
    title  = text_;
    this.value = value;
    this.checked = checked;
   this.unchecked = unchecked; 
 this.interpolar = i;
 this.cutoff = cutoff;
}
  
  void drawContent()
  {
   // strokeWeight(1);
 if(checked != null && unchecked != null){
       //System.out.println("Drawing Checkbox");
    //   textFont(fbold);
       fill(255);
     text(title, w+70, interpolar.value+cutoff+20);
    // textFont(f2);
     if(value){
       //checked.resize(0,sized);
       image(checked,0,interpolar.value+cutoff,w,h);
     }else{
     
       //unchecked.resize(0,sized);
       image(unchecked,0,interpolar.value+cutoff,w,h);
     }
        
        
     }
  }
  
  boolean contentClicked(float lx, float ly)
  {
    value = !value;
 //   println(value);
    return true;
  }
  
  void setValue(Boolean _value){
    value = _value;
  }
}
