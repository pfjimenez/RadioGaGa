// This class is used to visualize the relationships of an artist or song.
class RelationshipsView extends View {

  RelationshipsGraph rGraph;
  
  RelationshipsView(float x_, float y_, float w_, float h_)
  {
    super(x_, y_, w_, h_);
    
    rGraph = new RelationshipsGraph(0,0,w_,h_-100);
    this.subviews.add(rGraph);
  }


  void drawContent()
  {
    strokeWeight(2);
    stroke(tabColor2);
    fill(viewBackgroundColor);
    rect(0,0,w,h);
  }
  
}

static float hValue = 50;
static float wValue = 250;
static float hMainValue = 70;
static float degree = 30.0;
float angle = 90.0;

class RelationshipsGraph extends View{

  RelationshipNode mainNode;
  Map<Integer,RelationshipNode> similarTypeNodesMap;
  Map<Integer,RelationshipNode> recommendedNodesMap;
  Map<Integer,RelationshipNode> similarRankedNodes;
  int previousMainRNIndex = 0;
  
  RelationshipsGraph(float x_, float y_, float w_, float h_)
  {
    super(x_, y_, w_, h_);
    previousMainRNIndex = mainRNIndex;
    mainNode = new RelationshipNode(w_/2 - wValue/2,h_/2,wValue, hMainValue,float(listeners.get(mainRNIndex)),bandNames.get(mainRNIndex));
    mainNode.mainNode = true;
    this.subviews.add(mainNode);

    similarTypeNodesMap = new HashMap<Integer, RelationshipNode>();
    recommendedNodesMap = new HashMap<Integer, RelationshipNode>();
    similarRankedNodes = new HashMap<Integer, RelationshipNode>();
    
    float rx = w_/2 - wValue/2;
    float ry = h_/2 + hValue/2;
    
    for (int i = 1; i < 5 ; i++) {
      float x = h/2 * cos(radians(angle)) + ((angle > 90 && angle < 270) ?-rx/4:((angle == 90 || angle == 270)?0:rx/4));
     // float x = h/2 * cos(radians(angle));
      float y = h/2 * sin(radians(angle)) +  ((angle == 90)?20:0);
      RelationshipNode rn = new RelationshipNode(constrain(rx - x,5,w-wValue-5),constrain(ry - y,5,h-hValue-5), wValue, hValue, float(listeners.get(mainRNIndex+i)),bandNames.get(mainRNIndex+i));
      recommendedNodesMap.put(i, rn);
      subviews.add(rn);
      angle = angle + degree;
     }
     
      for (int i = 1; i < 5 ; i++) {
          float x = h/2 * cos(radians(angle)) + ((angle > 90 && angle < 270) ?-rx/4:((angle == 90 || angle == 270)?0:rx/4));
          float y = h/2 * sin(radians(angle)) +  ((angle == 270)?-20:0);
          RelationshipNode rn = new RelationshipNode(constrain(rx - x,5,w-wValue-5),ry - y, wValue, hValue, float(listeners.get(mainRNIndex+i)),bandNames.get(mainRNIndex+i));
          similarRankedNodes.put(i, rn);
          subviews.add(rn);
          angle = angle + degree;
     }
     
      for (int i = 1; i < 5 ; i++) {
           float x = h/2 * cos(radians(angle)) + ((angle > 90 && angle < 270) ?-rx/4:((angle == 90 || angle == 270)?0:rx/4));
          float y = h/2 * sin(radians(angle)) +  ((angle == 270)?-20:0);
          RelationshipNode rn = new RelationshipNode(constrain(rx - x,5,w-wValue-5),constrain(ry - y,5,h-hValue-5), wValue, hValue, float(listeners.get(mainRNIndex+i)),bandNames.get(mainRNIndex+i));
          similarTypeNodesMap.put(i, rn);
          subviews.add(rn);
          angle = angle + degree;
     }
    
    
  }
  
   void drawContent() {
      mainNode.cursorOn();
   }
   
   
}

color activeNode = tabColor1;

class RelationshipNode extends View{
  
   float iX;
   float iY;
   float rValue;
   boolean mouseOverMe = false;
   float absX;
   float absY;
   String nodeName;
   boolean mainNode;
   
   RelationshipNode(float x, float y, float w, float h, float rValue, String nodeName) {
  
    super(x,y,w,h);
    println(x + " - " + y);
    this.rValue = rValue;
    iX = x;
    iY = y;
    this.nodeName = nodeName;   
    this.mainNode = false; 
   }
  
   void drawContent() {
     int _lines = (mainNode?3:2);
     textAlign(CENTER);
     strokeWeight(3);
     textSize(normalFontSize);
     fill(mouseOverMe?activeNode:255,mouseOverMe?125:0);  
   //  ellipseMode(CORNER);
    // ellipse(0,0,w,h);
     rectMode(CORNER);
     rect(0,0,w,h);
     fill(textColor);
     textLeading(normalFontSize);
     if (mainNode){
       textSize(smallFontSize);
       text("Details...",w/2,3*h/_lines - 5);
       text(nodeName+"\n# of listerners: " + round(rValue),w/2,h/3);
     }   
     else text(nodeName+"\n# of listerners: " + round(rValue),w/2,h/2);
  }
  
   public void cursorOn() {
  //  println(r/2 + " " + r/2+ " " +int(mouseX-x) + " " +int(mouseY-y) + " " +r/2 + " - " +dist(r/2,r/2,mouseX-x,mouseY-y) ) ;
  //  if (dist(r/2,r/2,mouseX-x,mouseY-y) < r/2 ) mouseOverMe = true;
   // else mouseOverMe = false;
  
  }
  
  boolean contentClicked(float lx, float ly)
  {
    return true;
  }
  
}




