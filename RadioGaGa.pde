import controlP5.*;

// ############################################################################################################################################################################################
// Project 4: Radio Gaga
// By Priscilla Jimenez, Hung Park and Heba Basiony
// Draft#1 11/5/2011 4:46 PM
// ############################################################################################################################################################################################

import de.umass.lastfm.*;

public PApplet papplet;
public PFont font;
public color backgroundColor = 255;
public color textColor = 0;
public color textColor2 = 255;
public color textColor1 = #9370db;
public color tabColor2 = #9370db;
public color tabColor1 = #EED2EE;
public color boldTextColor = #FFFF00;
public color titleTextColor = #BA55D3;
public color menuColor1 = #483D8B;
public color draggableContentBoxColor= #CCCCFF;
public PFont f2, fbold;
public PImage nextArrow, prevArrow;
<<<<<<< HEAD
public color viewBackgroundColor = 255;
public color infoBoxBackground = #000000;
public Integrator genderic;

public int normalFontSize = 14;
=======
public int maxl, minl;
// Baby Blue, baby pink, pink, Darker blue, Dark green, green, Orange, grey,pruple
color[] barsColor = {
  #C6E2FF, #FFC0CB, #EE799F,#87CEFA, #2E8B57,#BCEE68,#FFA54F,#CFCFCF,#AB82FF
};


 PImage ppl;
public int normalFontSize = 16;
>>>>>>> daa99f634038ad80ff74ba844c425e27d7e3fdd2
public int smallFontSize = 12 ;
public int largeFontSize = 20;
public ControlP5 controlP5;

// The different Views
public View mainView;
public TabView viewTabs;
public CenterView graphView;
public MenuView menuView;

public Collection<Track> topTracks;
<<<<<<< HEAD
public SearchView searchView;
public RelationshipsView relationshipsView;
public int mainNodeRG = 1;

=======

// Used for Bubbles
public int circlesOnScreen;
public int maxNumOfCircles; // max number of circles (characters) that will be drawn.
public int valuesTotal = 0;
//public Ball[] balls = new Ball[0];
public SearchView searchView;
public BubbleView bubbleView;

// Reading in singers and artists files
>>>>>>> daa99f634038ad80ff74ba844c425e27d7e3fdd2
/*
   <artist band name> <tab> <number of view by users> <tab> <number of male listening> <number of female listening> <tab> <ages of users listening> <tan> <region of where it was listened>
 */
public ArrayList<String> bandNames = new ArrayList<String>();
public ArrayList<String> listeners = new ArrayList<String>();
public ArrayList<String> males = new ArrayList<String>();
public ArrayList<String> females = new ArrayList<String>();
public ArrayList<String[]> ages = new ArrayList<String[]>();
//<0-9 age></t><10-19></t><20-29></t><30-39></t><40-49></t><50-59></t><60+>
public ArrayList<String[]> locations = new ArrayList<String[]>();
//<africa></t><asia></t><europe></t><australia></t><caribbean></t><middleEast></t><northAmerica></t><southAmerica>

<<<<<<< HEAD
public int maxListeners = 1;
public int minListeners = 1;


// Changing lalalala
=======
// Changing Checkboxes and radioboxes
public boolean gendersChecked = false;
public boolean regionChecked = false;
public boolean ageChecked = false;
public boolean allChecked = true;
public boolean customizeChecked  = false;

>>>>>>> daa99f634038ad80ff74ba844c425e27d7e3fdd2
public boolean maleChecked = true;
public boolean femaleChecked = true;
public boolean unknownGenderChecked = true; 

public boolean genderExpand = false;
public boolean regionExpand = false;
public boolean ageExpand = false;

public boolean africaChecked = true;
public boolean asiaChecked = true;
public boolean europeChecked = true;
public boolean australiaChecked = true;
public boolean southAmericaChecked = true;
public boolean northAmericaChecked = true;
public boolean carribeanChecked = true;
public boolean middleEastChecked = true;
public boolean unknownRegionChecked = true;

public boolean nineYrsChecked = true;
public boolean nineteenYrsChecked = true;
public boolean twentyNineYrsChecked = true;
public boolean thirtyNineYrsChecked = true;
public boolean fortyNineYrsChecked = true;
public boolean fiftyNineYrsChecked = true;
public boolean sixtyOrMoreChecked = true;
public boolean unknownAgeChecked = true;

public Checkbox showMales;
public Checkbox showFemales;
public Checkbox showUnknownGender;
public ScrollMenu genderScroll;  

public Checkbox showNineYrs;
public Checkbox showNineteenYrs;
public Checkbox showTwentyNineYrs;
public Checkbox showThirtyNineYrs;
public Checkbox showFortyNineYrs;
public Checkbox showFiftyNineYrs;
public Checkbox showSixtyOrMoreYrs;
public Checkbox showUnknownAge;
public ScrollMenu ageScroll;


public Checkbox showAfrica;
public Checkbox showAsia;
public Checkbox showEurope;
public Checkbox showAustralia;
public Checkbox showNorthAmerica;
public Checkbox showSouthAmerica;
public Checkbox showCarribean;
public Checkbox showMiddleEast;
public Checkbox showUnknownRegion;
public ScrollMenu regionScroll;

public PImage checkboxChecked ;
public PImage checkboxUnchecked;
<<<<<<< HEAD

public boolean draggingContent = false;
public String currentlyViewing = "";
public int currentIndex = -1;
  
int mainRNIndex = 0;
// public PImage checkboxChecked2 = loadImage("checkbox_checked.png");
=======
>>>>>>> daa99f634038ad80ff74ba844c425e27d7e3fdd2

// Variables used for the graphs
public int startEntry = 0;
public int endEntry = 8;

<<<<<<< HEAD
=======
// These integrators are used for plotting
// Here're how they go:
// 0 - 9 - Used for males, Afria or 0-9 years or for overall listeners
// 10 - 19 - Used for Females, Asia, 10-19 years
// 20 - 29 Used for Undetermined Genders, Europe or 20 - 29 years
// 30 - 39 Used for N.America, 30 - 39 years
// 40 - 49 Used for S.America, 40 - 49 years
// 50 - 59  used for australia, 50 - 59 years
// 60 - 69 used for carribean, 60 or mroe years
// 70 - 79 used for middle east, unspecified age
// 80 - 89 used for unspecified region
public ArrayList<Integrator> integrators = new ArrayList<Integrator>();

>>>>>>> daa99f634038ad80ff74ba844c425e27d7e3fdd2
public void setup()
{
  size(1200, 700); 
  f2 = loadFont("ArialMT-20.vlw");
  fbold = loadFont("Arial-BoldMT-20.vlw");
  checkboxChecked = loadImage("checkbox_checked.png");

  checkboxUnchecked = loadImage("checkbox_unchecked.png");
 // buttonCheck = loadImage("button-check.png");
 // buttonCross = loadImage("button-cross.png");
 // buttonCheck.resize(0,20);
 // buttonCross.resize(0,20);

  textFont(f2);
  papplet = this;
  mainView = new View(0, 0, width, height);
  genderScroll = new ScrollMenu(150, 479, 190, 5, genderExpand, 140);
  regionScroll = new ScrollMenu(350,260,190,5,regionExpand,360);
  ageScroll = new ScrollMenu(550,260,190,5,ageExpand,360);
  //  int i  = 0;
   // String key = "b25b959554ed76058ac220b7b2e0a026"; //this is the key used in the last.fm API examples online.

  //topTracks = Artist.getTopTracks("Depeche Mode", key);

/*
  PaginatedResult p = Artist.getImages("Depeche Mode", key);
  Collection<Image> p2 = p.getPageResults();
  Object[] ps = new Object[p2.size()];
  ps = p2.toArray();
  de.umass.lastfm.Image imagy = (de.umass.lastfm.Image)ps[1];
  ppl = loadImage(imagy.getImageURL(ImageSize.LARGE),"png");
*/
 // System.out.println(p.contains(""));
  smooth();

  viewTabs = new TabView(10, 10, 500, 50);
  mainView.subviews.add(viewTabs);
  controlP5 = new ControlP5(this);

  graphView  = new CenterView(10, 50, 900, 550);
  searchView = new SearchView(920, 20, 175, 600);
  bubbleView = new BubbleView(100, 30, 900, 600);
  mainView.subviews.add(bubbleView);

>>>>>>> daa99f634038ad80ff74ba844c425e27d7e3fdd2
  nextArrow = loadImage("Next.png");
  nextArrow.resize(0, 30);
  prevArrow = loadImage("Previous.png"); 
  prevArrow.resize(0, 30);

  menuView = new MenuView(50, 635, 1000, 20);
  gendersChecked = menuView.byGender.value;
  regionChecked = menuView.byRegion.value;
  /*
   for (Track track : topTracks) {
   i++;
   System.out.printf("%s (%d plays)%n", track.getName(), track.getPlaycount());
   }
   */
  /*
   artist band name> <tab> <number of view by users> <tab> <number of male listening> <number of female listening> <tab> <ages of users listening> <tan> <region of where it was listened>
   */

  showUnknownRegion = new Checkbox((float)10, (float)180, 25, 25, checkboxChecked, checkboxUnchecked, "Unspecified", true);
  showNineYrs = new Checkbox((float)10, (float)20, 25, 25, checkboxChecked, checkboxUnchecked, "0 - 9 years", true);     
  showNineteenYrs = new Checkbox((float)10, (float)40, 25, 25, checkboxChecked, checkboxUnchecked, "10 - 19 years", true);     
  showTwentyNineYrs = new Checkbox((float)10, (float)60, 25, 25, checkboxChecked, checkboxUnchecked, "20 - 29 years", true);  
  showThirtyNineYrs = new Checkbox((float)10, (float)80, 25, 25, checkboxChecked, checkboxUnchecked, "30 - 39 years", true);
  showFortyNineYrs = new Checkbox((float)10, (float)100, 25, 25, checkboxChecked, checkboxUnchecked, "40 - 49 years", true);    
  showFiftyNineYrs = new Checkbox((float)10, (float)120, 25, 25, checkboxChecked, checkboxUnchecked, "50 - 59 years", true); 
  showSixtyOrMoreYrs = new Checkbox((float)10, (float)140, 25, 25, checkboxChecked, checkboxUnchecked, "60+ years", true);
  showUnknownAge = new Checkbox((float)10, (float)160, 25, 25, checkboxChecked, checkboxUnchecked, "Unspecified", true);
   
        if (!genderScroll.subviews.contains(showFemales)) genderScroll.subviews.add(showFemales);
   //     if (!genderScroll.subviews.contains(showUnknownGender)) genderScroll.subviews.add(showUnknownGender);
        if (!regionScroll.subviews.contains(showAfrica))regionScroll.subviews.add(showAfrica);
        if (!regionScroll.subviews.contains(showAsia))regionScroll.subviews.add(showAsia);
        if (!regionScroll.subviews.contains(showEurope))regionScroll.subviews.add(showEurope);
        if (!regionScroll.subviews.contains(showNorthAmerica))regionScroll.subviews.add(showNorthAmerica);
        if (!regionScroll.subviews.contains(showSouthAmerica))regionScroll.subviews.add(showSouthAmerica);
        if (!regionScroll.subviews.contains(showAustralia))regionScroll.subviews.add(showAustralia);
        if (!regionScroll.subviews.contains(showCarribean))regionScroll.subviews.add(showCarribean);
        if (!regionScroll.subviews.contains(showMiddleEast))regionScroll.subviews.add(showMiddleEast);
        if (!regionScroll.subviews.contains(showUnknownRegion))regionScroll.subviews.add(showUnknownRegion);
        
        ageScroll.subviews.add(showNineYrs);  
        ageScroll.subviews.add(showNineteenYrs);
        ageScroll.subviews.add(showTwentyNineYrs);
        ageScroll.subviews.add(showThirtyNineYrs);
        ageScroll.subviews.add(showFortyNineYrs);
        ageScroll.subviews.add(showFiftyNineYrs);
        ageScroll.subviews.add(showSixtyOrMoreYrs);
        ageScroll.subviews.add(showUnknownAge);
        
       // minl = Integer.parseInt(locations.get(0)[0]);
       // maxl = Integer.parseInt(locations.get(0)[0]);
  /*      int maxIndex = 0;
        for(int j = 0; j < locations.get(0).length;j++){
        minl = minl+Integer.parseInt(locations.get(0)[j]);
        maxl = maxl+Integer.parseInt(locations.get(0)[j]);
        }
        
        for(int i = 1 ; i< locations.size();i++){
      int l=0;
/// 
for(int j = 0; j < locations.get(i).length;j++){
     //       if(j != 4 && j != 5){
      l = l+Integer.parseInt(locations.get(i)[j]);
      }
  //l = Integer.parseInt(locations.get(i)[0]);  
        if(l>maxl){
        maxl = l;
        maxIndex= i;
        }
        if(l<minl)
        minl = l;         //}
  //      }
        }*/
        //System.out.println("Maximum Listeners: "+maxl+"@ Index = "+maxIndex+ "\nMinimum Listeners: "+minl);
        
  for(int i = 0 ; i< 90; i++){
  Integrator temp = new Integrator(graphView.h);
  integrators.add(temp);
  }
}

public void draw()
{
  background(backgroundColor); 
  mainView.draw();
<<<<<<< HEAD

=======
  if(ppl != null)
  image(ppl, 50,200);
 //genderic.update();
>>>>>>> daa99f634038ad80ff74ba844c425e27d7e3fdd2
  drawDraggableBox();
}


void mousePressed()
{
  //System.out.println(mouseX + " , "+ mouseY);
  mainView.mousePressed(mouseX, mouseY);
  //  tabView.mousepressed(mouseX,mouseY);
}

void mouseDragged()
{
  System.out.println(graphView.lastDrag);
  if(viewTabs.view == 2 && graphView.lastDrag != -555){
      if (mouseX < graphView.lastDrag &&  (graphView.lastDrag - mouseX)%10 ==0 && endEntry < bandNames.size()-1 && allChecked) {
        startEntry+=1;
        endEntry+=1;
        graphView.subviews = new ArrayList<View>();
        int x2 = 70;
        int y2 = 0;
        for (int j = startEntry ; j <= endEntry; j++) {
          Entry e = new Entry((float)x2, (float)y2, (float)50, graphView.h, j);
          graphView.subviews.add(e);
          x2+=90;
        }
        graphView.lastDrag = mouseX;
      }else{
      if(mouseX > graphView.lastDrag && (mouseX-graphView.lastDrag)%10 ==0 && startEntry >0 && allChecked){
        startEntry-=1;
        endEntry-=1;
        graphView.subviews = new ArrayList<View>();
        int x2 = 70;
        int y2 = 0;
        for (int j = startEntry ; j <= endEntry; j++) {
          Entry e = new Entry((float)x2, (float)y2, (float)50, graphView.h, j);
          graphView.subviews.add(e);
          x2+=90;
        }
        graphView.lastDrag = mouseX;
      }
      }
    
  
  }
  else{
  mainView.mouseDragged(mouseX, mouseY);
  }
}

void mouseClicked()
{
<<<<<<< HEAD
 // println("Clicked in ");
  mainView.mouseClicked(mouseX, mouseY);
 // println("Clicked in 2");
  /*
  // println("Clicked in new  " +newcheckbox.title + " " + newcheckbox.value );
  gendersChecked = menuView.byGender.value;
=======
  mainView.mouseClicked(mouseX, mouseY);
 
>>>>>>> daa99f634038ad80ff74ba844c425e27d7e3fdd2
  maleChecked = showMales.value;
  femaleChecked = showFemales.value;
  unknownGenderChecked = showUnknownGender.value;

  genderExpand = genderScroll.expanded;
  regionExpand = regionScroll.expanded;
  ageExpand = ageScroll.expanded;

   africaChecked = showAfrica.value;
   asiaChecked  = showAsia.value;
   europeChecked = showEurope.value;
   australiaChecked = showAustralia.value;
   middleEastChecked = showMiddleEast.value;
   northAmericaChecked = showNorthAmerica.value;
   southAmericaChecked = showSouthAmerica.value;
<<<<<<< HEAD
   carribeanChecked = showCarribean.value;*/
=======
   carribeanChecked = showCarribean.value;
   unknownRegionChecked = showUnknownRegion.value;  

 
   nineYrsChecked = showNineYrs.value;
   nineteenYrsChecked = showNineteenYrs.value;
   twentyNineYrsChecked = showTwentyNineYrs.value;
   thirtyNineYrsChecked = showThirtyNineYrs.value;
   fortyNineYrsChecked = showFortyNineYrs.value;
   fiftyNineYrsChecked = showFiftyNineYrs.value;
   sixtyOrMoreChecked = showSixtyOrMoreYrs.value;
   unknownAgeChecked = showUnknownAge.value;
   
    gendersChecked = menuView.byGender.value;
    regionChecked = menuView.byRegion.value;
    ageChecked = menuView.byAge.value;
    allChecked = menuView.all.value;
    customizeChecked = menuView.customize.value;
    
    
>>>>>>> daa99f634038ad80ff74ba844c425e27d7e3fdd2
} 
void keyPressed() {
  //System.out.println("Here!");
  //System.out.println(mainView.keypressed());
  mainView.keypressed();
}

void drawDraggableBox() {

  if (searchView.draggedIndex != -1) {
    rectMode(CORNERS);
    fill(tabColor2, 100);
    strokeWeight(1);
    rect(mouseX-10, mouseY-10, mouseX+203, mouseY+15);
    fill(255);
    textSize(12);
    textAlign(CENTER);
    String t = searchView.dragged;
    textFont(fbold);
    if (t.length()>25)
      t = t.substring(0, 26);
    text(t, mouseX+100, mouseY+10);
    textFont(f2);
    textSize(20);
  }
}

void mouseReleased() {
  println("release");
   if (draggingContent){
      if (mouseX >= 10 && mouseX <= 10 + 900 && mouseY >= 40 && mouseY <= 40 + 600) { // Inside the rectangule view.
        if (searchView.draggedIndex != -1) {
          println("entro");
          currentlyViewing = searchView.dragged;
          //System.out.println("Currently Viewing "+ currentlyViewing);
          currentIndex = searchView.draggedIndex;
          searchView.draggedIndex = -1;
          searchView.dragged = "";
        }
      }
      searchView.draggedIndex = -1;
      searchView.dragged = "";
    }
  }
