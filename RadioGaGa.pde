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
//color viewBackgroundColor = #2D2A36;
//color infoBoxBackground = #000000;
public Integrator genderic;
 PImage ppl;
public int normalFontSize = 16;
public int smallFontSize = 12 ;
public int largeFontSize = 20;
public ControlP5 controlP5;

public View mainView;
public TabView viewTabs;
public CenterView graphView;
public MenuView menuView;

public Collection<Track> topTracks;

public int circlesOnScreen;
public int maxNumOfCircles; // max number of circles (characters) that will be drawn.
public int valuesTotal = 0;
//public Ball[] balls = new Ball[0];
public SearchView searchView;
public BubbleView bubbleView;
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

// Changing lalalala
public boolean gendersChecked = false;
public boolean regionChecked = false;
public boolean ageChecked = false;

public boolean maleChecked = true;
public boolean femaleChecked = true;
public boolean unknownGenderChecked = true; 

public boolean genderExpand = true;
public boolean regionExpand = true;
public boolean ageExpand = true;

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
public ScrollMenu genderScroll;  

public Checkbox showMales;
public Checkbox showFemales;
public Checkbox showUnknownGender;
public ScrollMenu ageScroll;

public Checkbox showNineYrs;
public Checkbox showNineteenYrs;
public Checkbox showTwentyNineYrs;
public Checkbox showThirtyNineYrs;
public Checkbox showFortyNineYrs;
public Checkbox showFiftyNineYrs;
public Checkbox showSixtyOrMoreYrs;
public Checkbox showUnknownAge;

public Checkbox showAfrica;
public Checkbox showAsia;
public Checkbox showEurope;
public Checkbox showAustralia;
public Checkbox showNorthAmerica;
public Checkbox showSouthAmerica;
public Checkbox showCarribean;
public Checkbox showMiddleEast;
public Checkbox showUnknownRegion;

public PImage checkboxChecked ;
public ScrollMenu regionScroll;
public PImage checkboxUnchecked;
public PImage buttonCheck, buttonCross;
// public PImage checkboxChecked2 = loadImage("checkbox_checked.png");

//  public PImage checkboxUnchecked2 = loadImage("checkbox_unchecked.png");


public void setup()
{
  size(1200, 700); 
  f2 = loadFont("ArialMT-20.vlw");
  fbold = loadFont("Arial-BoldMT-20.vlw");
  checkboxChecked = loadImage("checkbox_checked.png");

  checkboxUnchecked = loadImage("checkbox_unchecked.png");
  buttonCheck = loadImage("button-check.png");
  buttonCross = loadImage("button-cross.png");
  buttonCheck.resize(0,20);
  buttonCross.resize(0,20);

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

  graphView  = new CenterView(10, 30, 900, 580);
  searchView = new SearchView(920, 20, 175, 600);
  bubbleView = new BubbleView(100, 30, 900, 600);
  mainView.subviews.add(bubbleView);

  nextArrow = loadImage("Next.png");
  nextArrow.resize(0, 40);
  prevArrow = loadImage("Previous.png"); 
  prevArrow.resize(0, 40);

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
  // Setting up the static data that we have and are gonna use except when live data is needed
  String[] rowsin = loadStrings("output6.txt"); 
  int rowsinno = rowsin.length;
  for (int i = 0; i< rowsinno; i++) {
    String []tokens = rowsin[i].split("\t");
    bandNames.add(tokens[0]);
    //System.out.println(tokens[0]);
    listeners.add(tokens[1]);
    males.add(tokens[2]);
    females.add(tokens[3]);
    String[] tokens2 = tokens[4].split(" ");
    String[] tokens3 = tokens[5].split(" ");
    ages.add(tokens2);
    locations.add(tokens3);
  }
  showMales = new Checkbox((float)10, (float)20, 25, 25, checkboxChecked, checkboxUnchecked, "Males", true);
  showFemales = new Checkbox((float)10, (float)40, 25, 25, checkboxChecked, checkboxUnchecked, "Females", true);
  showUnknownGender = new Checkbox((float)10, (float)60, 25, 25, checkboxChecked, checkboxUnchecked, "Unspecified", true);
  showAfrica  = new Checkbox((float)10, (float)20, 25, 25, checkboxChecked, checkboxUnchecked, "Africa", true);
  showAsia = new Checkbox((float)10, (float)40, 25, 25, checkboxChecked, checkboxUnchecked, "Asia", true);
  showEurope = new Checkbox((float)10, (float)60, 25, 25, checkboxChecked, checkboxUnchecked, "Europe", true);
  showNorthAmerica = new Checkbox((float)10, (float)80, 25, 25, checkboxChecked, checkboxUnchecked, "North America", true);
  showSouthAmerica = new Checkbox((float)10, (float)100, 25, 25, checkboxChecked, checkboxUnchecked, "South America", true);
  showAustralia = new Checkbox((float)10, (float)120, 25, 25, checkboxChecked, checkboxUnchecked, "Australia", true);
  showCarribean = new Checkbox((float)10, (float)140, 25, 25, checkboxChecked, checkboxUnchecked, "Carribean", true);
  showMiddleEast= new Checkbox((float)10, (float)160, 25, 25, checkboxChecked, checkboxUnchecked, "Middle East", true);
  showUnknownRegion = new Checkbox((float)10, (float)180, 25, 25, checkboxChecked, checkboxUnchecked, "Unspecified", true);
  showNineYrs = new Checkbox((float)10, (float)20, 25, 25, checkboxChecked, checkboxUnchecked, "0 - 9 years", true);     
  showNineteenYrs = new Checkbox((float)10, (float)40, 25, 25, checkboxChecked, checkboxUnchecked, "10 - 19 years", true);     
  showTwentyNineYrs = new Checkbox((float)10, (float)60, 25, 25, checkboxChecked, checkboxUnchecked, "20 - 29 years", true);  
  showThirtyNineYrs = new Checkbox((float)10, (float)80, 25, 25, checkboxChecked, checkboxUnchecked, "30 - 39 years", true);
  showFortyNineYrs = new Checkbox((float)10, (float)100, 25, 25, checkboxChecked, checkboxUnchecked, "40 - 49 years", true);    
  showFiftyNineYrs = new Checkbox((float)10, (float)120, 25, 25, checkboxChecked, checkboxUnchecked, "50 - 59 years", true); 
  showSixtyOrMoreYrs = new Checkbox((float)10, (float)140, 25, 25, checkboxChecked, checkboxUnchecked, "60+ years", true);
  showUnknownAge = new Checkbox((float)10, (float)160, 25, 25, checkboxChecked, checkboxUnchecked, "Unspecified", true);
   
        if (!genderScroll.subviews.contains(showMales)) genderScroll.subviews.add(showMales);
        if (!genderScroll.subviews.contains(showFemales)) genderScroll.subviews.add(showFemales);
        if (!genderScroll.subviews.contains(showUnknownGender)) genderScroll.subviews.add(showUnknownGender);
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
}
public void draw()
{
  background(backgroundColor, 200); 
  mainView.draw();
  if(ppl != null)
  image(ppl, 50,200);
 //genderic.update();
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
  mainView.mouseDragged(mouseX, mouseY);
}

void mouseClicked()
{
  mainView.mouseClicked(mouseX, mouseY);
 
  maleChecked = showMales.value;
  femaleChecked = showFemales.value;
  unknownGenderChecked = showUnknownGender.value;
  genderExpand = genderScroll.expanded;
 // System.out.println("Gender Expand "+ genderExpand);
  regionExpand = regionScroll.expanded;
 // System.out.println("Region Expand "+regionExpand);
  
// System.out.println("Region Checked "+ regionChecked);
   africaChecked = showAfrica.value;
   asiaChecked  = showAsia.value;
   europeChecked = showEurope.value;
   australiaChecked = showAustralia.value;
   middleEastChecked = showMiddleEast.value;
   northAmericaChecked = showNorthAmerica.value;
   southAmericaChecked = showSouthAmerica.value;
   carribeanChecked = showCarribean.value;
   unknownRegionChecked = showUnknownRegion.value;  
 // System.out.println(unknownRegionChecked);

   ageExpand = ageScroll.expanded;
 
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
  //  System.out.println("Gender "+gendersChecked+" Reigon "+regionChecked+" ageChecked "+ageChecked);
    
} 
void keyPressed() {
  //System.out.println("Here!");
  //System.out.println(mainView.keypressed());
  mainView.keypressed();
}
void mouseReleased() {
  mainView.mouseReleased(mouseX, mouseY);
}
void drawDraggableBox() {

  if (!mainView.subviews.contains(searchView))
    searchView.myTextfield.hide();
  if (searchView.draggedIndex != -1) {
    //   System.out.println("Drawing Dragged");
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

