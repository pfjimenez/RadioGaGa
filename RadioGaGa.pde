import controlP5.*;

// ############################################################################################################################################################################################
// Project 4: Radio Gaga
// By Priscilla Jimenez, Hung Park and Heba Basiony
// Draft#1 11/5/2011 4:46 PM
// ############################################################################################################################################################################################

import de.umass.lastfm.*;
//Changing lololo
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
public  String titleChanged = "";
public color viewBackgroundColor = 255;
public color infoBoxBackground = #000000;
public Integrator genderic;

public int maxl, minl;
// Baby Blue, baby pink, pink, Darker blue, Dark green, green, Orange, grey,pruple
color[] barsColor = {
  #C6E2FF, #FFC0CB, #EE799F, #87CEFA, #2E8B57, #BCEE68, #FFA54F, #CFCFCF, #AB82FF
};
// Committing and Changing

PImage ppl = new PImage();
public int normalFontSize = 14;
public int smallFontSize = 12 ;
public int largeFontSize = 20;
public ControlP5 controlP5;

public View mainView;
public TabView viewTabs;
public CenterView graphView;
public MenuView menuView;

public Collection<Track> topTracks;
public RelationshipsView relationshipsView;
public int mainNodeRG = 1;

// Used for Bubbles
public int circlesOnScreen;
public int maxNumOfCircles; // max number of circles (characters) that will be drawn.
public int valuesTotal = 0;
//public Ball[] balls = new Ball[0];
public SearchView searchView;

// Reading in singers and artists files

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

// Changing Checkboxes and radioboxes
public boolean gendersChecked = false;
public boolean regionChecked = false;
public boolean ageChecked = false;
public boolean allChecked = true;
public boolean customizeChecked  = false;

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

public PImage checkboxChecked ;
public ScrollMenu regionScroll;
public PImage checkboxUnchecked;

public boolean draggingContent = false;
public String currentlyViewing = "";
public int currentIndex = -1;

int mainRNIndex = 0;
// public PImage checkboxChecked2 = loadImage("checkbox_checked.png");

//  public PImage checkboxUnchecked2 = loadImage("checkbox_unchecked.png");

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
public int startEntry = 0;
public int endEntry = 8;

public int maxAll= 31000000;
public int maxGender = 72000;
public int maxRegion = 80000;
public int maxAge =65000;

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
    genderScroll = new ScrollMenu(150, 479, 190, 5, genderExpand, 140);
  regionScroll = new ScrollMenu(350,260,190,5,regionExpand,360);
  ageScroll = new ScrollMenu(550,260,190,5,ageExpand,360);
 //  int i  = 0;
  // String key = "b25b959554ed76058ac220b7b2e0a026"; //this is the key used in the last.fm API examples online.

  //topTracks = Artist.getTopTracks("Depeche Mode", key);
  smooth();

  loadData();

  viewTabs = new TabView(10, 10, 500, 30);
  mainView.subviews.add(viewTabs);
  relationshipsView = new RelationshipsView(10, 40, 900, 550);
  mainView.subviews.add(relationshipsView);
  controlP5 = new ControlP5(this);

  graphView  = new CenterView(10, 40, 900, 500);
  searchView = new SearchView(920, 10, 250, 580);
  mainView.subviews.add(searchView);

  nextArrow = loadImage("Next.png");
  nextArrow.resize(0, 30);
  prevArrow = loadImage("Previous.png"); 
  prevArrow.resize(0, 30);

  menuView = new MenuView(50, 635, 1000, 20);
  gendersChecked = menuView.byGender.value;
  regionChecked = menuView.byRegion.value;
  
  for(int i = 0 ; i< 90; i++){
    Integrator temp = new Integrator(graphView.h);
    integrators.add(temp);
  }
  
  /*
   for (Track track : topTracks) {
   i++;
   System.out.printf("%s (%d plays)%n", track.getName(), track.getPlaycount());
   }
   */
  /*
   artist band name> <tab> <number of view by users> <tab> <number of male listening> <number of female listening> <tab> <ages of users listening> <tan> <region of where it was listened>
   */
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
   //     if (!genderScroll.subviews.contains(showUnknownGender)) genderScroll.subviews.add(showUnknownGender);
        if (!regionScroll.subviews.contains(showAfrica))regionScroll.subviews.add(showAfrica);
        if (!regionScroll.subviews.contains(showAsia))regionScroll.subviews.add(showAsia);
        if (!regionScroll.subviews.contains(showEurope))regionScroll.subviews.add(showEurope);
        if (!regionScroll.subviews.contains(showNorthAmerica))regionScroll.subviews.add(showNorthAmerica);
        if (!regionScroll.subviews.contains(showSouthAmerica))regionScroll.subviews.add(showSouthAmerica);
        if (!regionScroll.subviews.contains(showAustralia))regionScroll.subviews.add(showAustralia);
        if (!regionScroll.subviews.contains(showCarribean))regionScroll.subviews.add(showCarribean);
        if (!regionScroll.subviews.contains(showMiddleEast))regionScroll.subviews.add(showMiddleEast);
    //    if (!regionScroll.subviews.contains(showUnknownRegion))regionScroll.subviews.add(showUnknownRegion);
        
        ageScroll.subviews.add(showNineYrs);  
        ageScroll.subviews.add(showNineteenYrs);
        ageScroll.subviews.add(showTwentyNineYrs);
        ageScroll.subviews.add(showThirtyNineYrs);
        ageScroll.subviews.add(showFortyNineYrs);
        ageScroll.subviews.add(showFiftyNineYrs);
        ageScroll.subviews.add(showSixtyOrMoreYrs);
    //    ageScroll.subviews.add(showUnknownAge);
        
       // minl = Integer.parseInt(locations.get(0)[0]);
       // maxl = Integer.parseInt(locations.get(0)[0]);
   /*     int maxIndex = 0;
        for(int j = 0; j < ages.get(0).length;j++){
        minl = minl+Integer.parseInt(ages.get(0)[j]);
        maxl = maxl+Integer.parseInt(ages.get(0)[j]);
        }
        
        for(int i = 1 ; i< ages.size();i++){
      int l=0;
/// 
for(int j = 0; j < ages.get(i).length;j++){
     //       if(j != 4 && j != 5){
      l = l+Integer.parseInt(ages.get(i)[j]);
      }
  //l = Integer.parseInt(locations.get(i)[0]);  
        if(l>maxl){
        maxl = l;
        maxIndex= i;
        }
        if(l<minl)
        minl = l;         //}
  //      }
        }
        System.out.println("Maximum Listeners: "+maxl+"@ Index = "+maxIndex+ "\nMinimum Listeners: "+minl);
     */
     /*
  minl = Integer.parseInt(males.get(0))+Integer.parseInt(females.get(0));
  maxl = Integer.parseInt(males.get(0))+Integer.parseInt(females.get(0));
  int maxIndex = 0; 
  for(int i = 1; i< males.size();i++){
 int l =  Integer.parseInt(males.get(i))+Integer.parseInt(females.get(i));
      if(l>maxl){
        maxl = l;
        maxIndex= i;
        }
        if(l<minl)
        minl = l;         //}
  //      }
  }
   System.out.println("Maximum Listeners: "+maxl+"@ Index = "+maxIndex+ "\nMinimum Listeners: "+minl);
   */
  for(int i = 0 ; i< 90; i++){
  Integrator temp = new Integrator(graphView.h);
  integrators.add(temp);
  }
}

public void draw()
{
  background(backgroundColor); 
  mainView.draw();

  if (ppl != null)
    image(ppl, 50, 200);
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
  mainView.mouseClicked(mouseX, mouseY);
  if (titleChanged.contains("Age")&& menuView.byAge.value ) {
          menuView.byGender.value = false;
          menuView.byRegion.value = false;
 integrators = new ArrayList<Integrator>(); 
          for(int j = 0 ; j< 90; j++){
  
             Integrator temp = new Integrator(graphView.h);
  integrators.add(temp);
  }
          int x2 = 70;
          int y2 = 0;
         
            graphView.subviews = new ArrayList<View>();
          
          for (int j = startEntry ; j <= endEntry;j++) {
            Entry e = new Entry((float)x2, (float)y2, (float)50, graphView.h, j);
            if (!graphView.subviews.contains(e))graphView.subviews.add(e);
            x2+=90;
          }
 
        }
        if (titleChanged.contains("Region")&& menuView.byRegion.value ) {
          menuView.byGender.value = false;
          menuView.byAge.value = false;
 integrators = new ArrayList<Integrator>(); 
          for(int j = 0 ; j< 90; j++){
  
             Integrator temp = new Integrator(graphView.h);
  integrators.add(temp);
  }
          int x2 = 70;
          int y2 = 0;
         
            graphView.subviews = new ArrayList<View>();
          
          for (int j = startEntry ; j <= endEntry;j++) {
            Entry e = new Entry((float)x2, (float)y2, (float)50, graphView.h, j);
            if (!graphView.subviews.contains(e))graphView.subviews.add(e);
            x2+=90;
          }
 
        }
        if (titleChanged.contains("Gender")&& menuView.byGender.value ) {
          menuView.byAge.value = false;
          menuView.byRegion.value = false;
 integrators = new ArrayList<Integrator>(); 
          for(int j = 0 ; j< 90; j++){
  
             Integrator temp = new Integrator(graphView.h);
  integrators.add(temp);
  }
          int x2 = 70;
          int y2 = 0;
         
            graphView.subviews = new ArrayList<View>();
          
          for (int j = startEntry ; j <= endEntry;j++) {
            Entry e = new Entry((float)x2, (float)y2, (float)50, graphView.h, j);
            if (!graphView.subviews.contains(e))graphView.subviews.add(e);
            x2+=90;
          }
 
        }
        if (titleChanged.contains("All")&& menuView.all.value ) {
          menuView.customize.value = false;
        }

        if (titleChanged.contains("Chosen")&& menuView.customize.value ) {
          System.out.println("Here! I'm here");
          menuView.all.value = false;
        }
     
        if (titleChanged.contains("All") && menuView.all.value) {
 integrators = new ArrayList<Integrator>(); 
          for(int j = 0 ; j< 90; j++){
  
             Integrator temp = new Integrator(graphView.h);
  integrators.add(temp);
  }
          int x2 = 70;
          int y2 = 0;
         
            graphView.subviews = new ArrayList<View>();
          
          for (int j = startEntry ; j <= endEntry;j++) {
            Entry e = new Entry((float)x2, (float)y2, (float)50, graphView.h, j);
            if (!graphView.subviews.contains(e))graphView.subviews.add(e);
            x2+=90;
          }
       }
      if(titleChanged.contains("Chosen") && menuView.customize.value){
        
 integrators = new ArrayList<Integrator>(); 
            graphView.subviews = new ArrayList<View>();
      for(int j = 0 ; j< graphView.entryViewing.size(); j++){
      
        
        
      }
      

      }
  // println("Clicked in new  " +newcheckbox.title + " " + newcheckbox.value );
   gendersChecked = menuView.byGender.value;
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
   carribeanChecked = showCarribean.value;

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

  carribeanChecked = showCarribean.value;
  
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
  if (draggingContent && viewTabs.view == 1) {
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
  }else{
    if(draggingContent &&viewTabs.view == 2){
    if(customizeChecked){
        graphView.entryViewing.add(searchView.dragged);
        //System.out.println("Currently Viewing "+ currentlyViewing);
        graphView.entryIndex.add(""+searchView.draggedIndex);
        searchView.draggedIndex = -1;
        searchView.dragged = "";
     
    }
    else{
      
     graphView. justSearched = searchView.draggedIndex;
      searchView.draggedIndex = -1;
      searchView.dragged = "";
     
    }
    }else{
 
     if(viewTabs.view == 2) graphView.lastDrag = -555;
  }
}
}
void roundrect(int x, int y, int w, int h, int r, color c) {
  rectMode(CORNER);
  noFill();
  stroke(c);

  int  ax, ay, hr;

  ax=x+w-1;
  ay=y+h-1;
  hr = r/2;

  arc(x+r/2, y+r/2, r, r, radians(180.0), radians(270.0));
  arc(ax+r/2, y+r/2, r, r, radians(270.0), radians(360.0));
  arc(x+r/2, ay+r/2, r, r, radians(90.0), radians(180.0));
  arc(ax+r/2, ay+r/2, r, r, radians(0.0), radians(90.0));

  line(x+1+r/2, y-hr+r/2, w-2+r/2, y-hr+r/2);
  line(x, y+r/2, x, h+r/2);
  line(x+1+r/2, h+hr-1+r/2, w-2+r/2, h+hr-1+r/2);
  line(w+hr-1+r/2, y+r/2, w+hr-1+r/2, h+r/2);

}

