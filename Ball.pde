/*
public float grav = 1.40;                    // Gravedad
public float b = 0.85;                       // Rebote
public float f = 0.90;                       // Friccion

// color ballColor = #FFFF99;
// color hBallColor = #FF66CC;
public color hBallColor = 255;
public color ballColor = 255;

public int BOX_W = 200;
public int BOX_H = 150;

public class Ball extends View{

  public float r;
  public float m;
  
  public float x2;
  public float y2;
  
  public float vx;
  public float vy;
  
  public int id;
  public float ka;
  
  public String name;
  public int value;
  public int topPos;
  
  public boolean cursorOnCharacter;
  public PImage p ;  
  public Ball( float x, float y, float h, float w,int ID, float KA, String _name, int _value,int _topPos ) {
    super(x,y,w,h);
    ka = KA;
    r = sqrt( ka / PI );
    m = r;
    x2 = random(r+x,x+w-r);
    y2 = random(r+y,y+h-r);
    vx = random(-3,3);
    vy = random(-3,3);
    id = ID;
    name = _name;
    value = _value;
    cursorOnCharacter = false;
    topPos = _topPos;
  }
  
  
 
  public void bounce() {
  
    if ( y2 + vy + r > y + h + 2) {
    
      y2 = y + h - r;
      vx *= f;
      vy *= -b;
    }
    if ( y2 + vy - r < y + 2) {
    
      y2 = r+y;
      vx *= f;
      vy *= -b;
    }
    if ( x2 + vx + r > x+w - 2 ) {
    
      x2 = x + w - r;
      vx *= -b;
      vy *= f;
    }
    if ( x2 + vx - r < x + 2 ) {
    
      x2 = r+x;
      vx *= -b;
      vy *= f;
    }
  }
  
  public void collide() {
  
    for ( int i=maxNumOfCircles; i>=0; i-- ) {
    
      if ( i < balls.length ) {
      
        float X = balls[i].x2;
        float Y = balls[i].y2;
        float R = balls[i].r;
        float M = balls[i].m;
      
        float deltax = X-x2;
        float deltay = Y-y2;
        float d = sqrt(pow(deltax,2)+pow(deltay,2));
      
        if ( d < r + R && d > 0 ) {
        
          float dD = r + R - d;
          float theta = atan2(deltay,deltax);
        
          vx += -dD*cos(theta)*M/(m+M);
          vy += -dD*sin(theta)*M/(m+M);
        
          vx *= b;
          vy *= b;
        
        }
      }
    }
  }
  
  public void move() {
  
    if ( cursorOnCharacter && mousePressed && ( dragging == -1 || dragging == id ) ) {
      x2 = mouseX;
      y2 = mouseY;
      vx = 0;
      vy = 0;
      dragging = id;
    } else {
      x2 += vx;
      y2 += vy;
    }
    
    
  }
  
 public void cursorOn() {
  
    if ( dist(x2, y2, mouseX, mouseY) < r ) cursorOnCharacter = true;
    else cursorOnCharacter = false;
  
  }
  
 public void display() {
       
      if ( cursorOnCharacter ){
        stroke(borderBoxColor);
        fill(fillBoxColor);
        strokeWeight(2);
        rectMode(CORNER);
        rect(x+w+10,y+h - BOX_H,BOX_W,BOX_H);
        stroke(hBallColor);
        strokeWeight(r);
        textSize(12); 
        stroke(textColor);
        strokeWeight(2);
        textAlign(LEFT);
        fill(0);
        textFont(fbold);
       // image(p, CHARACTER_GRAPH_X+CHARACTER_GRAPH_W + 110,CHARACTER_GRAPH_Y+CHARACTER_GRAPH_H - BOX_H - 120);
        
        text("Name:",  x+w+20,y+h - BOX_H + 5,BOX_W,BOX_H);
        fill(textColor);
        text(name,  x+w+85,y+h - BOX_H + 5,BOX_W,BOX_H);
        fill(0);
        text("Number of Appearances:\n ",  x+w+20,y+h - BOX_H + 40,BOX_W,BOX_H);
        fill(textColor);
        textSize(32);
        text(str(value),  x+w+65,y+h - BOX_H + 100,BOX_W,BOX_H);
        
        // " + str(value),CHARACTER_GRAPH_X+CHARACTER_GRAPH_W+20,CHARACTER_GRAPH_Y+CHARACTER_GRAPH_H - BOX_H + 5,BOX_W,BOX_H);
        textAlign(CENTER);
        strokeWeight(1);
        textSize(20);
        textFont(f2);
    }
      else{
        fill(ballColor);
        strokeWeight(r/10);
        stroke(borderBoxColor);
      }
     strokeWeight(3);
     fill(textColor2);
        
     ellipse(x2,y2,2*r-r/10,2*r-r/10);
  }
}


public Ball[] append(Ball t[], float ka, String _name, int _value,int _topPos) {  
  Ball temp[]=new Ball[t.length+1];  
  System.arraycopy(t,0,temp,0,t.length);  
  temp[t.length]=new Ball(t.length, ka, _name, _value,_topPos);  
  return temp;  
}
*/
