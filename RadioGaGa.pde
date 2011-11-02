PApplet papplet;

DateFormat dateTimeFormat= new SimpleDateFormat("EEEE, MMMM dd, yyyy HH:mm");
DateFormat dateFormat= new SimpleDateFormat("EEEE, MMMM dd, yyyy");
DateFormat shortDateFormat= new SimpleDateFormat("MM/dd/yyyy HH:mm");
DateFormat dbDateFormat= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

PFont font;

color backgroundColor = 0;
color textColor = 255;
color boldTextColor = #FFFF00;
color titleTextColor = 0;
color viewBackgroundColor = #2D2A36;
color infoBoxBackground = #000000;

int normalFontSize = 13;
int smallFontSize = 10 ;
int largeFontSize = 15;

View mainView;
Checkbox newcheckbox;


void setup()
{
  size(1000, 700); 
  font = loadFont("Helvetica-20.vlw");
  
  papplet = this;
  mainView = new View(0,0,width,height);
  
  smooth();
  
  newcheckbox = new Checkbox(15,15,12,12,"Test",boldTextColor);
  mainView.subviews.add(newcheckbox);
  
}
  void draw()
  {
    background(backgroundColor); 
    
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
  mainView.mouseClicked(mouseX, mouseY);
}


void buttonClicked(Checkbox button)
{
  println("Clicked");
}


