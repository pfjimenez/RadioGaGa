color checkboxColor = 255;

class Checkbox extends View {
  boolean value;
  color ckbColor = -1;
  PImage icon;
  String title;
  color iconColor = -1;
  PImage unchecked;
  PImage checked;
  int sized = 0;
  Checkbox(float x_, float y_, float w_, float h_,String text_, PImage image_, color iconColor_)
  {
    super(x_, y_, w_, h_);
    value = false;
    icon = image_;
    title = text_;
    iconColor = iconColor_;
  }
  
  Checkbox(float x_, float y_, float w_, float h_, String text_,color color_)
  {
    super(x_, y_, w_, h_);
    value = false;
    ckbColor = color_;
    title = text_;
  }
  
  Checkbox(float x_, float y_, float w_, float h_, String text_)
  {
    super(x_, y_, w_, h_);
    value = false;
    title = text_;
  }
  
  Checkbox(float x_, float y_,int w_, int h_,PImage checked, PImage unchecked, String text_,boolean value){
    super(x_, y_,w_,h_);
    title  = text_;
    this.value = value;
    this.checked = checked;
   this.unchecked = unchecked; 
 
}
  
  void drawContent()
  {
    strokeWeight(1);
 if(checked != null && unchecked != null){
       //System.out.println("Drawing Checkbox");
       textFont(fbold);
       fill(255);
     text(title, w+70, 20);
     textFont(f2);
     if(value){
       //checked.resize(0,sized);
       image(checked,0,0,w,h);
     }else{
     
       //unchecked.resize(0,sized);
       image(unchecked,0,0,w,h);
     }
        
        
     }else{
    if (value){
      stroke((ckbColor== -1)?checkboxColor:ckbColor);
      noFill();
      rect(0, 0, w, h);
      fill((ckbColor== -1)?checkboxColor:ckbColor);
      rect(2, 2, w-4, h-4);
    }
    else{
      stroke((ckbColor== -1)?checkboxColor:ckbColor);
      noFill();
      rect(0, 0, w, h);
    }
    
   fill(textColor2);
 //  textFont(font,normalFontSize);
   textAlign(LEFT,TOP);
   if (icon != null){
     text(title, w + w + 10, 0);
     if (iconColor == -1){
       imageMode(CORNERS);
       image(icon, w + 5, 0,w+5+w,h);
     }
     else{
       noStroke();
       fill(iconColor);
       ellipse(w + h/2 + 5, h/2,h,h);
     }
   }
   
   else{
    
     text(title, w + 5, 0);
   }
   }
    
  }
  
  boolean contentClicked(float lx, float ly)
  {
    value = !value;
    println(value);
    return true;
  }
  
  void setValue(Boolean _value){
    value = _value;
  }
}
