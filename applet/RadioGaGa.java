import processing.core.*; 
import processing.xml.*; 

import de.umass.lastfm.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class RadioGaGa extends PApplet {



PApplet papplet;

DateFormat dateTimeFormat= new SimpleDateFormat("EEEE, MMMM dd, yyyy HH:mm");
DateFormat dateFormat= new SimpleDateFormat("EEEE, MMMM dd, yyyy");
DateFormat shortDateFormat= new SimpleDateFormat("MM/dd/yyyy HH:mm");
DateFormat dbDateFormat= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

PFont font;

int backgroundColor = 0;
int textColor = 255;
int boldTextColor = 0xffFFFF00;
int titleTextColor = 0;
int viewBackgroundColor = 0xff2D2A36;
int infoBoxBackground = 0xff000000;

int normalFontSize = 13;
int smallFontSize = 10 ;
int largeFontSize = 15;

View mainView;
Checkbox newcheckbox;
HRangeSlider newSlider;

Collection<Track> topTracks;

public void setup()
{
  size(1000, 700); 
  font = loadFont("Helvetica-20.vlw");
  
  papplet = this;
  mainView = new View(0,0,width,height);
  
  smooth();
  
  newcheckbox = new Checkbox(15,15,12,12,"Test",boldTextColor);
  mainView.subviews.add(newcheckbox);
  
  String[] test = {"A","B","C"};
  newSlider = new HRangeSlider(15,50,12,12,test,1);
  mainView.subviews.add(newSlider);
  
  String key = "b25b959554ed76058ac220b7b2e0a026"; //this is the key used in the last.fm API examples online.

  topTracks = Artist.getTopTracks("Depeche Mode", key);

		

		

}
  public void draw()
  {
    background(backgroundColor); 
    
    for (Track track : topTracks) {

        System.out.printf("%s (%d plays)%n", track.getName(), track.getPlaycount());
   }

    mainView.draw(); 
  }


public void mousePressed()
{
  mainView.mousePressed(mouseX, mouseY);
}

public void mouseDragged()
{
  mainView.mouseDragged(mouseX, mouseY);
}

public void mouseClicked()
{
  println("Clicked in " +newcheckbox.title + " " + newcheckbox.value );
  mainView.mouseClicked(mouseX, mouseY);
  println("Clicked in new  " +newcheckbox.title + " " + newcheckbox.value );
}


int checkboxColor = 255;

class Checkbox extends View {
  boolean value;
  int ckbColor = -1;
  PImage icon;
  String title;
  int iconColor = -1;
  
  Checkbox(float x_, float y_, float w_, float h_,String text_, PImage image_, int iconColor_)
  {
    super(x_, y_, w_, h_);
    value = false;
    icon = image_;
    title = text_;
    iconColor = iconColor_;
  }
  
  Checkbox(float x_, float y_, float w_, float h_, String text_,int color_)
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
  
  public void drawContent()
  {
    strokeWeight(1);

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
   fill(textColor);
   textFont(font,normalFontSize);
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
  
  public boolean contentClicked(float lx, float ly)
  {
    value = !value;
    println(value);
    return true;
  }
  
  public void setValue(Boolean _value){
    value = _value;
  }
}
int spaceBtwLines = 10;
int markSize = 10;
int sliderColor = 150;
int activeSliderColor = 255;

class HRangeSlider extends View {
  private float value;
  private int index_1;
  private int index_2;
  private String minLabel;
  private String maxLabel;
  String[] labels;
  private String title;
  
  private boolean movingMin;
  private boolean movingMax;
  private int charactersToShow;

  
  HRangeSlider(float x_, float y_, float w_, float h_,String[] _labels,String _title,int _chr)
  {
    super(x_, y_, (PApplet.parseInt(textWidth(_title))  + (_labels.length*spaceBtwLines)), (textAscent() + textDescent() + markSize+2));
    index_1 = 0;
    index_2 = _labels.length-1;
    labels = _labels;
    title = _title;
    charactersToShow = _chr;
  }
  
  HRangeSlider(float x_, float y_, float w_, float h_,String[] _labels,int _chr)
  {
    super(x_, y_, (_labels.length*spaceBtwLines), (textAscent() + textDescent() + markSize+2));
    index_1 = 0;
    index_2 = _labels.length-1;
    labels = _labels;
    title = "";
    charactersToShow = _chr;
  }
  
  public void drawContent()
  {
   
      textAlign(LEFT,CENTER);
      textFont(font,normalFontSize);
      fill(textColor);
      text(title, 0, 0);
    
      textFont(font,smallFontSize);
      for (int i = 0; i < labels.length; i++) {
        float x = PApplet.parseInt(textWidth(title)) + i*spaceBtwLines;
        if (i == index_1) {
          strokeWeight(2);
          stroke(activeSliderColor);
          line(x, 0, x, markSize);
          textAlign(CENTER, TOP);
          text(labels[index_1].substring(0,charactersToShow), x, markSize+2);
        } 
       else if (i == index_2) {
          strokeWeight(2);
          stroke(activeSliderColor);
          line(x, 0, x, markSize);
          textAlign(CENTER, TOP);
          text(labels[index_2].substring(0,charactersToShow), x, markSize+2);
        } 
        else {
          strokeWeight(1);
          stroke(sliderColor);
          line(x, 0, x,markSize-4);
        }
      }
  }
  
  public boolean contentPressed(float lx, float ly)
  {
    
    value = constrain(PApplet.parseInt((lx - textWidth(title)) / spaceBtwLines),0,labels.length-1);
    if (value == index_1)
    {
       movingMin = true;
       movingMax = false;
    }
    else if (value == index_2){
      movingMax = true;
      movingMin = false;
    }
    else {
      movingMin = false;
      movingMax = false;
    }
    
    return true;
  }
  
  public boolean contentDragged(float lx, float ly)
  {
    value = constrain(PApplet.parseInt((lx - textWidth(title)) / spaceBtwLines),0,labels.length-1);
    if (movingMin){        
        index_1 = PApplet.parseInt(value);
    }else if (movingMax){
        index_2 = PApplet.parseInt(value);
    }
    return true;
  }
  
  public int minIndex(){
    if (index_1 > index_2){
        return index_2;
    }
    return index_1;
  }
  
  public int maxIndex(){
    if (index_1 > index_2){
        return index_1;
    }
    return index_2;
  }
}

class View {
  float x, y, w, h;
  ArrayList subviews;
  
  View(float x_, float y_, float w_, float h_)
  {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    subviews = new ArrayList();
  }
  
  public void draw()
  {
    pushMatrix();
    translate(x, y);
    // draw out content, then our subviews on top
    drawContent();
    for (int i = 0; i < subviews.size(); i++) {
      View v = (View)subviews.get(i);
      v.draw();
    }
    popMatrix();
  }
  
  public void drawContent()
  {
    // override this
    // when this is called, the coordinate system is local to the view,
    // i.e. 0,0 is the top left corner of this view
  }
  
  public boolean contentPressed(float lx, float ly)
  {
    // override this
    // lx, ly are in the local coordinate system of the view,
    // i.e. 0,0 is the top left corner of this view
    // return false if the click is to "pass through" this view
    return true;
  }
  
  public boolean contentDragged(float lx, float ly)
  {
    return true;
  }
  
  public boolean contentClicked(float lx, float ly)
  {
    return true;
  }
  
  public boolean contentMouseWheel(float lx, float ly, int delta)
  {
    return false;
  }

  public boolean ptInRect(float px, float py, float rx, float ry, float rw, float rh)
  {
    return px >= rx && px <= rx+rw && py >= ry && py <= ry+rh;
  }

  public boolean mousePressed(float px, float py)
  {
    if (!ptInRect(px, py, x, y, w, h)) return false;
    float lx = px - x;
    float ly = py - y;
    // check our subviews first
    for (int i = subviews.size()-1; i >= 0; i--) {
      View v = (View)subviews.get(i);
      if (v.mousePressed(lx, ly)) return true;
    }
    return contentPressed(lx, ly);
  }

  public boolean mouseDragged(float px, float py)
  {
    if (!ptInRect(px, py, x, y, w, h)) return false;
    float lx = px - x;
    float ly = py - y;
    // check our subviews first
    for (int i = subviews.size()-1; i >= 0; i--) {
      View v = (View)subviews.get(i);
      if (v.mouseDragged(lx, ly)) return true;
    }
    return contentDragged(lx, ly);
  }

  public boolean mouseClicked(float px, float py)
  {
    if (!ptInRect(px, py, x, y, w, h)) return false;
    float lx = px - x;
    float ly = py - y;
    // check our subviews first
    for (int i = subviews.size()-1; i >= 0; i--) {
      View v = (View)subviews.get(i);
      if (v.mouseClicked(lx, ly)) return true;
    }
    return contentClicked(lx, ly);
  }
  
  public boolean mouseWheel(float px, float py, int delta)
  {
    if (!ptInRect(px, py, x, y, w, h)) return false;
    float lx = px - x;
    float ly = py - y;
    // check our subviews first
    for (int i = subviews.size()-1; i >= 0; i--) {
      View v = (View)subviews.get(i);
      if (v.mouseWheel(lx, ly, delta)) return true;
    }
    return contentMouseWheel(lx, ly, delta);
  }
}

  static public void main(String args[]) {
    PApplet.main(new String[] { "--present", "--bgcolor=#666666", "--stop-color=#cccccc", "RadioGaGa" });
  }
}
