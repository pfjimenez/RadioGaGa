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

=======
>>>>>>> parent of ef4fb8b... Updates
public color viewBackgroundColor = 255;
public color infoBoxBackground = #000000;
public Integrator genderic;

public int normalFontSize = 14;
<<<<<<< HEAD

public int maxl, minl;
// Baby Blue, baby pink, pink, Darker blue, Dark green, green, Orange, grey,pruple
color[] barsColor = {
  #C6E2FF, #FFC0CB, #EE799F,#87CEFA, #2E8B57,#BCEE68,#FFA54F,#CFCFCF,#AB82FF
};


public int maxl, minl;
// Baby Blue, baby pink, pink, Darker blue, Dark green, green, Orange, grey,pruple
color[] barsColor = {
  #C6E2FF, #FFC0CB, #EE799F,#87CEFA, #2E8B57,#BCEE68,#FFA54F,#CFCFCF,#AB82FF
};


 PImage ppl;
public int normalFontSize = 16;
=======
>>>>>>> parent of ef4fb8b... Updates
public int smallFontSize = 12 ;
public int largeFontSize = 20;
public ControlP5 controlP5;

public View mainView;
public TabView viewTabs;
public CenterView graphView;
public MenuView menuView;

public Collection<Track> topTracks;
<<<<<<< HEAD

=======
>>>>>>> parent of ef4fb8b... Updates
public SearchView searchView;
public RelationshipsView relationshipsView;
public int mainNodeRG = 1;

<<<<<<< HEAD
// Used for Bubbles
public int circlesOnScreen;
public int maxNumOfCircles; // max number of circles (characters) that will be drawn.
public int valuesTotal = 0;
//public Ball[] balls = new Ball[0];
public SearchView searchView;
public BubbleView bubbleView;

// Reading in singers and artists files

=======
>>>>>>> parent of ef4fb8b... Updates
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

public int maxListeners = 1;
public int minListeners = 1;


// Changing lalalala
<<<<<<< HEAD

// Changing Checkboxes and radioboxes
public boolean gendersChecked = false;
public boolean regionChecked = false;
public boolean ageChecked = false;
public boolean allChecked = true;
public boolean customizeChecked  = false;

=======
>>>>>>> parent of ef4fb8b... Updates
public boolean maleChecked = true;
public boolean femaleChecked = true;
public boolean gendersChecked = true;
public boolean regionChecked = false;
public boolean genderExpand = true;
public boolean regionExpand = true;
public boolean africaChecked = true;
public boolean asiaChecked = true;
public boolean europeChecked = true;
public boolean australiaChecked = true;
public boolean southAmericaChecked = true;
public boolean northAmericaChecked = true;
public boolean carribeanChecked = true;
public boolean middleEastChecked = true;
public ScrollMenu genderScroll;  
public Checkbox showMales;
public Checkbox showFemales;
public Checkbox nineyrs;
public Checkbox nineteenyrs;
public Checkbox twentynineyrs;
public Checkbox thirtynineyrs;
public Checkbox fortynineyrs;
public Checkbox fiftynineyrs;
public Checkbox sixtymoreyrs;

public Checkbox showAfrica;
public Checkbox showAsia;
public Checkbox showEurope;
public Checkbox showAustralia;
public Checkbox showNorthAmerica;
public Checkbox showSouthAmerica;
public Checkbox showCarribean;
public Checkbox showMiddleEast;

public PImage checkboxChecked ;
public ScrollMenu regionScroll;
public PImage checkboxUnchecked;
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> parent of ef4fb8b... Updates

public boolean draggingContent = false;
public String currentlyViewing = "";
public int currentIndex = -1;
  
int mainRNIndex = 0;
// public PImage checkboxChecked2 = loadImage("checkbox_checked.png");

//  public PImage checkboxUnchecked2 = loadImage("checkbox_unchecked.png");

<<<<<<< HEAD
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

=======
>>>>>>> parent of ef4fb8b... Updates
public void setup()
{
  size(1200, 700); 
  f2 = loadFont("ArialMT-20.vlw");
  fbold = loadFont("Arial-BoldMT-20.vlw");
  checkboxChecked = loadImage("checkbox_checked.png");

  checkboxUnchecked = loadImage("checkbox_unchecked.png");

  textFont(f2);
  papplet = this;
  mainView = new View(0, 0, width, height);
  genderScroll = new ScrollMenu(150, 499, 190, 5, genderExpand, 120);
  regionScroll = new ScrollMenu(370,260,190,5,regionExpand,360);
  //  int i  = 0;
  // String key = "b25b959554ed76058ac220b7b2e0a026"; //this is the key used in the last.fm API examples online.

  //topTracks = Artist.getTopTracks("Depeche Mode", key);
  smooth();

  loadData();

  viewTabs = new TabView(10, 10, 500, 30);
  mainView.subviews.add(viewTabs);
  controlP5 = new ControlP5(this);
<<<<<<< HEAD

  graphView  = new CenterView(10, 50, 900, 550);
  searchView = new SearchView(920, 20, 175, 600);
  bubbleView = new BubbleView(100, 30, 900, 600);
  mainView.subviews.add(bubbleView);

=======
  
  relationshipsView = new RelationshipsView(10, 40, 900, 600);
  mainView.subviews.add(relationshipsView);
  
  graphView  = new CenterView(10, 30, 900, 580);
  
  searchView = new SearchView(920, 10, 250, 630);
  mainView.subviews.add(searchView);
  
>>>>>>> parent of ef4fb8b... Updates
  nextArrow = loadImage("Next.png");
  nextArrow.resize(0, 30);
  prevArrow = loadImage("Previous.png"); 
  prevArrow.resize(0, 30);

  menuView = new MenuView(50, 635, 800, 20);
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
<<<<<<< HEAD

  
  showMales = new Checkbox((float)10, (float)20, 25, 25, checkboxChecked, checkboxUnchecked, "Males", true);
  showFemales = new Checkbox((float)10, (float)40, 25, 25, checkboxChecked, checkboxUnchecked, "Females", true);
  showUnknownGender = new Checkbox((float)10, (float)60, 25, 25, checkboxChecked, checkboxUnchecked, "Unspecified", true);
=======
  
  showMales = new Checkbox((float)10, (float)20, 25, 25, checkboxChecked, checkboxUnchecked, "Males", true);
  showFemales = new Checkbox((float)10, (float)60, 25, 25, checkboxChecked, checkboxUnchecked, "Females", true);
>>>>>>> parent of ef4fb8b... Updates
  showAfrica  = new Checkbox((float)10, (float)20, 25, 25, checkboxChecked, checkboxUnchecked, "Africa", true);
  showAsia = new Checkbox((float)10, (float)40, 25, 25, checkboxChecked, checkboxUnchecked, "Asia", true);
  showEurope = new Checkbox((float)10, (float)60, 25, 25, checkboxChecked, checkboxUnchecked, "Europe", true);
  showNorthAmerica = new Checkbox((float)10, (float)80, 25, 25, checkboxChecked, checkboxUnchecked, "North America", true);
  showSouthAmerica = new Checkbox((float)10, (float)100, 25, 25, checkboxChecked, checkboxUnchecked, "South America", true);
  showAustralia = new Checkbox((float)10, (float)120, 25, 25, checkboxChecked, checkboxUnchecked, "Australia", true);
  showCarribean = new Checkbox((float)10, (float)140, 25, 25, checkboxChecked, checkboxUnchecked, "Carribean", true);
  showMiddleEast= new Checkbox((float)10, (float)160, 25, 25, checkboxChecked, checkboxUnchecked, "Middle East", true);
<<<<<<< HEAD

   

=======
  
   if (!genderScroll.subviews.contains(showMales)) genderScroll.subviews.add(showMales);
>>>>>>> parent of ef4fb8b... Updates
        if (!genderScroll.subviews.contains(showFemales)) genderScroll.subviews.add(showFemales);
        if (!regionScroll.subviews.contains(showAfrica))regionScroll.subviews.add(showAfrica);
        if (!regionScroll.subviews.contains(showAsia))regionScroll.subviews.add(showAsia);
        if (!regionScroll.subviews.contains(showEurope))regionScroll.subviews.add(showEurope);
        if (!regionScroll.subviews.contains(showNorthAmerica))regionScroll.subviews.add(showNorthAmerica);
        if (!regionScroll.subviews.contains(showSouthAmerica))regionScroll.subviews.add(showSouthAmerica);
        if (!regionScroll.subviews.contains(showAustralia))regionScroll.subviews.add(showAustralia);
        if (!regionScroll.subviews.contains(showCarribean))regionScroll.subviews.add(showCarribean);
        if (!regionScroll.subviews.contains(showMiddleEast))regionScroll.subviews.add(showMiddleEast);
       
}

public void draw()
{
  background(backgroundColor); 
  mainView.draw();

<<<<<<< HEAD
  if(ppl != null)
  image(ppl, 50,200);
 //genderic.update();
 drawDraggableBox();
=======
  drawDraggableBox();
>>>>>>> parent of ef4fb8b... Updates
}


void mousePressed()
{
  //System.out.println(mouseX + " , "+ mouseY);
  mainView.mousePressed(mouseX, mouseY);
  //  tabView.mousepressed(mouseX,mouseY);
}

void mouseDragged()
{
  mainView.mouseDragged(mouseX, mouseY);
}

void mouseClicked()
{
<<<<<<< HEAD

=======
>>>>>>> parent of ef4fb8b... Updates
 // println("Clicked in ");
  mainView.mouseClicked(mouseX, mouseY);
 // println("Clicked in 2");
  /*
  // println("Clicked in new  " +newcheckbox.title + " " + newcheckbox.value );
  gendersChecked = menuView.byGender.value;
<<<<<<< HEAD

  mainView.mouseClicked(mouseX, mouseY);


=======
>>>>>>> parent of ef4fb8b... Updates
  maleChecked = showMales.value;
  femaleChecked = showFemales.value;
  genderExpand = genderScroll.expanded;
 // System.out.println("Gender Expand "+ genderExpand);
  regionExpand = regionScroll.expanded;
 // System.out.println("Region Expand "+regionExpand);
  regionChecked = menuView.byRegion.value;
// System.out.println("Region Checked "+ regionChecked);
   africaChecked = showAfrica.value;
   asiaChecked  = showAsia.value;
   europeChecked = showEurope.value;
   australiaChecked = showAustralia.value;
   middleEastChecked = showMiddleEast.value;
   northAmericaChecked = showNorthAmerica.value;
   southAmericaChecked = showSouthAmerica.value;
<<<<<<< HEAD

   carribeanChecked = showCarribean.value;*/

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
    
=======
   carribeanChecked = showCarribean.value;*/
>>>>>>> parent of ef4fb8b... Updates
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
