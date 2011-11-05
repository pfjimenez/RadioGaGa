// ############################################################################################################################################################################################
// Project 4: Radio Gaga
// By Priscilla Jimenez, Hung Park and Heba Basiony
// Draft#1 11/5/2011 4:46 PM
// ############################################################################################################################################################################################

import de.umass.lastfm.*;

PApplet papplet;

DateFormat dateTimeFormat= new SimpleDateFormat("EEEE, MMMM dd, yyyy HH:mm");
DateFormat dateFormat= new SimpleDateFormat("EEEE, MMMM dd, yyyy");
DateFormat shortDateFormat= new SimpleDateFormat("MM/dd/yyyy HH:mm");
DateFormat dbDateFormat= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");



PFont font;

color backgroundColor = #D8BFD8;
color textColor = 255;
color boldTextColor = #FFFF00;
color titleTextColor = #BA55D3;
//color viewBackgroundColor = #2D2A36;
//color infoBoxBackground = #000000;

int normalFontSize = 13;
int smallFontSize = 10 ;
int largeFontSize = 15;

View mainView;
Checkbox newcheckbox;
HRangeSlider newSlider;
TabView viewTabs;

Collection<Track> topTracks;

void setup()
{
  size(1200, 700); 
  font = loadFont("Helvetica-20.vlw");
  
  papplet = this;
  mainView = new View(0,0,width,height);
  
  smooth();
  
   viewTabs = new TabView(10,10,200,200);
  mainView.subviews.add(viewTabs);

  
  //String key = "b25b959554ed76058ac220b7b2e0a026"; //this is the key used in the last.fm API examples online.

  //topTracks = Artist.getTopTracks("Depeche Mode", key);
		

}
  void draw()
  {
    background(backgroundColor,200); 
    
    /*
    for (Track track : topTracks) {

        System.out.printf("%s (%d plays)%n", track.getName(), track.getPlaycount());
   }
*/
    mainView.draw(); 
  }


void mousePressed()
{
  mainView.mousePressed(mouseX, mouseY);
}

void mouseDragged()
{
  mainView.mouseDragged(mouseX, mouseY);
}

void mouseClicked()
{
  println("Clicked in " +newcheckbox.title + " " + newcheckbox.value );
  mainView.mouseClicked(mouseX, mouseY);
  println("Clicked in new  " +newcheckbox.title + " " + newcheckbox.value );
}


