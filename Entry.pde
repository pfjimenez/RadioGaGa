class Entry extends View {


  public int index = -1;

  Entry(float x_, float y_, float w_, float h_, int index)
  {
    super(x_, y_, w_, h_);
    this.index= index;
  }
  /*
public ArrayList<String> bandNames = new ArrayList<String>();
   public ArrayList<String> listeners = new ArrayList<String>();
   public ArrayList<String> males = new ArrayList<String>();
   public ArrayList<String> females = new ArrayList<String>();
   public ArrayList<String[]> ages = new ArrayList<String[]>();
   //<0-9 age></t><10-19></t><20-29></t><30-39></t><40-49></t><50-59></t><60+>
   public ArrayList<String[]> locations = new ArrayList<String[]>();
   //<africa></t><asia></t><europe></t><australia></t><caribbean></t><middleEast></t><northAmerica></t><southAmerica>
   
   */

  void drawContent()
  {
    String bandName = bandNames.get(index);
    int numOfListeners = Integer.parseInt(listeners.get(index));

    int numOfMales = Integer.parseInt(males.get(index));
    int numOfFemales = Integer.parseInt(females.get(index));

    int numOfNine = Integer.parseInt(ages.get(index)[0]);
    int numOfNineteen = Integer.parseInt(ages.get(index)[1]);
    int numOfTwentyNine = Integer.parseInt(ages.get(index)[2]);
    int numOfThirtyNine = Integer.parseInt(ages.get(index)[3]);
    int numOfFortyNine = Integer.parseInt(ages.get(index)[4]);
    int numOfFiftyNine = Integer.parseInt(ages.get(index)[5]);
    int numOfSixtyOrMore = Integer.parseInt(ages.get(index)[6]);

    int numOfAfrica = Integer.parseInt(locations.get(index)[0]);
    int numOfAsia = Integer.parseInt(locations.get(index)[1]);
    int numOfEurope= Integer.parseInt(locations.get(index)[2]);
    int numOfAustralia = Integer.parseInt(locations.get(index)[3]);
    int numOfCarribean = Integer.parseInt(locations.get(index)[4]);
    int numOfMiddleEast = Integer.parseInt(locations.get(index)[5]);
    int numOfNorthAmerica = Integer.parseInt(locations.get(index)[6]);
    int numOfSouthAmerica = Integer.parseInt(locations.get(index)[7]);

    fill(0);
    textFont(fbold);
    textSize(10);
    //   textAlign(CENTER,BOTTOM);
    String t = bandName;
    if (t.length()>15)
      t = t.substring(0, 15)+"...";
    text(t, 20, h - 10);
    strokeWeight(0.5);
    stroke(#CFCFCF);
    line(20, 10, 20, h-30);
    int diff = index - startEntry;
    integrators.get(diff).target(numOfListeners);
    if (mouseX >= x && mouseX <= x+w && mouseY >= y+10 && mouseY <= y+h+10 && graphView.lastDrag == -555 && !regionExpand && !ageExpand && !genderExpand) {
      stroke(0);
      strokeWeight(2);
    }
    else
      stroke(barsColor[8]);
    fill(barsColor[8]);
    float y2 = map(integrators.get(diff).value, 0, maxAll, h-30, 10);
    if (!gendersChecked && !ageChecked && !regionChecked) {
      //  System.out.println("Percentage of "+bandName+" = "+((double)numOfListeners/3150000));
      rect(0, h-30, w, y2);
      integrators.get(diff).update();
      textSize(20);
      textFont(f2);
    }
    else {
      // 0 - 9 - Used for males, Afria or 0-9 years or for overall listeners
      // 10 - 19 - Used for Females, Asia, 10-19 years
      // 20 - 29 Used for Undetermined Genders, Europe or 20 - 29 years
      // 30 - 39 Used for N.America, 30 - 39 years
      // 40 - 49 Used for S.America, 40 - 49 years
      // 50 - 59  used for australia, 50 - 59 years
      // 60 - 69 used for carribean, 60 or mroe years
      // 70 - 79 used for middle east, unspecified age
      // 80 - 89 used for unspecified region
      if (gendersChecked) {
        float yMales = h-30, yFemales = h-30;
        if (maleChecked) {
          //    System.out.println(numOfMales);
          if (mouseX >= x && mouseX <= x+w && mouseY >= y+10 && mouseY <= y+h+10 && graphView.lastDrag == -555 && !regionExpand && !ageExpand && !genderExpand) {
            stroke(0);
            strokeWeight(2);
          }
          else {
            noStroke();
          }
          fill(barsColor[0]);
          //   y2 = map((numOfListeners-numOfMales-numOfFemales), 0, 3150000, 30, h-40);
          integrators.get(diff).target(numOfMales);
          yMales= map(integrators.get(diff).value, 0, maxGender, h-30, 5);    
          rect(0, h-30, w, yMales);
          integrators.get(diff).update();
        }
        if (femaleChecked && maleChecked) {
          if (mouseX >= x && mouseX <= x+w && mouseY >= y+10 && mouseY <= y+h+10 && graphView.lastDrag == -555 && !regionExpand && !ageExpand && !genderExpand) {
            stroke(0);
            strokeWeight(2);
          }
          else {
            noStroke();
          }
          fill(barsColor[1]);
          //   y2 = map((numOfListeners-numOfMales-numOfFemales), 0, 3150000, 30, h-40);
          integrators.get(diff+10).target(numOfFemales+numOfMales);
          //  System.out.println(yMales);

          yFemales = map(integrators.get(diff+10).value, 0, maxGender, h-30, 5);    
          rect(0, yMales, w, yFemales);
          integrators.get(diff+10).update();
        }
        else {
          if (femaleChecked) {
            if (mouseX >= x && mouseX <= x+w && mouseY >= y+10 && mouseY <= y+h+10 && graphView.lastDrag == -555 && !regionExpand && !ageExpand && !genderExpand) {
              stroke(0);
              strokeWeight(2);
            }
            else {
              noStroke();
            }
            fill(barsColor[1]);
            //   y2 = map((numOfListeners-numOfMales-numOfFemales), 0, 3150000, 30, h-40);
            integrators.get(diff+10).target(numOfFemales);
            //  System.out.println(yMales);

            yFemales = map(integrators.get(diff+10).value, 0, maxGender, h-30, 5);    
            rect(0, h-30, w, yFemales);
            integrators.get(diff+10).update();
          }
        }
        textSize(20);
        textFont(f2);
      }


      else {
        if (regionChecked) {
          float yEuropean = h - 30;
          float yNorthAmerica = h - 30;
          float ySouthAmerica = h - 30;
          float yMiddleEast = h - 30;
          float yAsia = h - 30;
          float yAfrica = h - 30;
          float yAustralia = h - 30;
          float yCarribean =  h - 30;
          int asian = 0;
          int european = 0;
          int african = 0;
          int nAmerican = 0;
          int sAmerican = 0;
          int middleEastern = 0;
          int carribean = 0;
          int australian = 0;
          if (europeChecked) {
            european = numOfEurope;
            //    System.out.println(numOfMales);
            if (mouseX >= x && mouseX <= x+w && mouseY >= y+10 && mouseY <= y+h+10 && graphView.lastDrag == -555 && !regionExpand && !ageExpand && !genderExpand) {
              stroke(0);
              strokeWeight(2);
            }
            else {
              noStroke();
            }
            fill(barsColor[0]);
            //   y2 = map((numOfListeners-numOfMales-numOfFemales), 0, 3150000, 30, h-40);
            integrators.get(diff).target(numOfEurope);
            yEuropean = map(integrators.get(diff).value, 0, maxRegion, h-30, 5);    
            rect(0, h-30, w, yEuropean);
            integrators.get(diff).update();
          }
          if (northAmericaChecked) {
            nAmerican = numOfNorthAmerica;
            if (mouseX >= x && mouseX <= x+w && mouseY >= y+10 && mouseY <= y+h+10 && graphView.lastDrag == -555 && !regionExpand && !ageExpand && !genderExpand) {
              stroke(0);
              strokeWeight(2);
            }
            else {
              noStroke();
            }
            fill(barsColor[5]);
            //  System.out.println("North America = "+numOfNorthAmerica+" and Both = "+(numOfNorthAmerica+european));
            //   y2 = map((numOfListeners-numOfMales-numOfFemales), 0, 3150000, 30, h-40);
            integrators.get(diff+10).target(numOfNorthAmerica+european);
            yNorthAmerica = map(integrators.get(diff+10).value, 0,maxRegion, h-30, 5);    
            rect(0, yEuropean, w, yNorthAmerica);
            //    System.out.println("yEuropean = "+yEuropean+" and yNorthAmerican"+yNorthAmerica);
            integrators.get(diff+10).update();
          }
          else {
            yNorthAmerica = yEuropean;
          }
          if (southAmericaChecked) {
            sAmerican = numOfSouthAmerica;
            if (mouseX >= x && mouseX <= x+w && mouseY >= y+10 && mouseY <= y+h+10 && graphView.lastDrag == -555 && !regionExpand && !ageExpand && !genderExpand) {
              stroke(0);
              strokeWeight(2);
            }
            else {
              noStroke();
            }
            fill(barsColor[2]);
            //  System.out.println("North America = "+numOfNorthAmerica+" and Both = "+(numOfNorthAmerica+european));
            //   y2 = map((numOfListeners-numOfMales-numOfFemales), 0, 3150000, 30, h-40);
            integrators.get(diff+20).target(numOfSouthAmerica+european+nAmerican);
            ySouthAmerica = map(integrators.get(diff+20).value, 0, maxRegion, h-30, 5);    
            rect(0, yNorthAmerica, w, ySouthAmerica);
            //    System.out.println("yEuropean = "+yEuropean+" and yNorthAmerican"+yNorthAmerica);
            integrators.get(diff+20).update();
          }
          else {
            ySouthAmerica =yNorthAmerica;
          }

          if (asiaChecked) {
            asian = numOfAsia;
            if (mouseX >= x && mouseX <= x+w && mouseY >= y+10 && mouseY <= y+h+10 && graphView.lastDrag == -555 && !regionExpand && !ageExpand && !genderExpand) {
              stroke(0);
              strokeWeight(2);
            }
            else {
              noStroke();
            }
            fill(barsColor[3]);
            //  System.out.println("North America = "+numOfNorthAmerica+" and Both = "+(numOfNorthAmerica+european));
            //   y2 = map((numOfListeners-numOfMales-numOfFemales), 0, 3150000, 30, h-40);
            integrators.get(diff+30).target(numOfAsia+european+nAmerican+sAmerican);
            yAsia = map(integrators.get(diff+30).value, 0, maxRegion, h-30, 5);    
            rect(0, ySouthAmerica, w, yAsia);
            //    System.out.println("yEuropean = "+yEuropean+" and yNorthAmerican"+yNorthAmerica);
            integrators.get(diff+30).update();
          }
          else {
            yAsia = ySouthAmerica;
          }

          if (africaChecked) {
            african = numOfAfrica;
            if (mouseX >= x && mouseX <= x+w && mouseY >= y+10 && mouseY <= y+h+10 && graphView.lastDrag == -555 && !regionExpand && !ageExpand && !genderExpand) {
              stroke(0);
              strokeWeight(2);
            }
            else {
              noStroke();
            }
            fill(barsColor[4]);
            //  System.out.println("North America = "+numOfNorthAmerica+" and Both = "+(numOfNorthAmerica+european));
            //   y2 = map((numOfListeners-numOfMales-numOfFemales), 0, 3150000, 30, h-40);
            integrators.get(diff+40).target(african+european+nAmerican+sAmerican+asian);
            yAfrica = map(integrators.get(diff+40).value, 0, maxRegion, h-30, 5);    
            rect(0, yAsia, w, yAfrica);
            //    System.out.println("yEuropean = "+yEuropean+" and yNorthAmerican"+yNorthAmerica);
            integrators.get(diff+40).update();
          }
          else {
            yAfrica = yAsia;
          }

          if (australiaChecked) {
            australian = numOfAustralia;
            if (mouseX >= x && mouseX <= x+w && mouseY >= y+10 && mouseY <= y+h+10 && graphView.lastDrag == -555 && !regionExpand && !ageExpand && !genderExpand) {
              stroke(0);
              strokeWeight(2);
            }
            else {
              noStroke();
            }
            fill(barsColor[6]);
            //  System.out.println("North America = "+numOfNorthAmerica+" and Both = "+(numOfNorthAmerica+european));
            //   y2 = map((numOfListeners-numOfMales-numOfFemales), 0, 3150000, 30, h-40);
            integrators.get(diff+50).target(australian+african+european+nAmerican+sAmerican+asian);
            yAustralia = map(integrators.get(diff+50).value, 0, maxRegion, h-30, 5);    
            rect(0, yAfrica, w, yAustralia);
            //    System.out.println("yEuropean = "+yEuropean+" and yNorthAmerican"+yNorthAmerica);
            integrators.get(diff+50).update();
          }else{
          yAustralia = yAfrica;
          }
          if(middleEastChecked){
          middleEastern = numOfMiddleEast;
            if (mouseX >= x && mouseX <= x+w && mouseY >= y+10 && mouseY <= y+h+10 && graphView.lastDrag == -555 && !regionExpand && !ageExpand && !genderExpand) {
              stroke(0);
              strokeWeight(2);
            }
            else {
              noStroke();
            }
            fill(barsColor[1]);
            //  System.out.println("North America = "+numOfNorthAmerica+" and Both = "+(numOfNorthAmerica+european));
            //   y2 = map((numOfListeners-numOfMales-numOfFemales), 0, 3150000, 30, h-40);
            integrators.get(diff+60).target(australian+african+european+nAmerican+sAmerican+asian+middleEastern);
            yMiddleEast = map(integrators.get(diff+60).value, 0, maxRegion, h-30, 5);    
            rect(0, yAustralia, w, yMiddleEast);
            //    System.out.println("yEuropean = "+yEuropean+" and yNorthAmerican"+yNorthAmerica);
            integrators.get(diff+60).update();
          
          }else{
          yMiddleEast = yAustralia;
          }
          if(carribeanChecked){
          carribean = numOfCarribean;
            if (mouseX >= x && mouseX <= x+w && mouseY >= y+10 && mouseY <= y+h+10 && graphView.lastDrag == -555 && !regionExpand && !ageExpand && !genderExpand) {
              stroke(0);
              strokeWeight(2);
            }
            else {
              noStroke();
            }
            fill(barsColor[8]);
            //  System.out.println("North America = "+numOfNorthAmerica+" and Both = "+(numOfNorthAmerica+european));
            //   y2 = map((numOfListeners-numOfMales-numOfFemales), 0, 3150000, 30, h-40);
            integrators.get(diff+70).target(australian+african+european+nAmerican+sAmerican+asian+middleEastern+carribean);
            yCarribean = map(integrators.get(diff+70).value, 0, maxRegion, h-30, 5);    
            rect(0, yMiddleEast, w, yCarribean);
            //    System.out.println("yEuropean = "+yEuropean+" and yNorthAmerican"+yNorthAmerica);
            integrators.get(diff+70).update();
          
          }
          textSize(20);
          textFont(f2);
        }
        else {
          if (ageChecked) {
            int nineyrs = 0;
            int nineteenyrs = 0;
            int twentynineyrs = 0;
            int thirtynineyrs = 0;
            int fortynineyrs = 0;
            int fiftynineyrs = 0;
            int sixtymoreyrs = 0;
            float yNine = h - 30;
            float yNineteen = h - 30;
            float yTwentyNine = h -30; 
            float yThirtyNine = h - 30;
            float yFortyNine = h - 30;
            float yFiftyNine = h - 30;
            float ySixtyMore = h - 30;

            if (nineYrsChecked) {
              nineyrs = numOfNine;
              if (mouseX >= x && mouseX <= x+w && mouseY >= y+10 && mouseY <= y+h+10 && graphView.lastDrag == -555 && !regionExpand && !ageExpand && !genderExpand) {
                stroke(0);
                strokeWeight(2);
              }
              else {
                noStroke();
              }
              fill(barsColor[0]);
              //  System.out.println("North America = "+numOfNorthAmerica+" and Both = "+(numOfNorthAmerica+european));
              //   y2 = map((numOfListeners-numOfMales-numOfFemales), 0, 3150000, 30, h-40);
              integrators.get(diff).target(nineyrs);
              yNine = map(integrators.get(diff).value, 0, maxAge, h-30, 5);    
              rect(0, h - 30, w, yNine);
              //    System.out.println("yEuropean = "+yEuropean+" and yNorthAmerican"+yNorthAmerica);
              integrators.get(diff).update();
            }
            if (nineteenYrsChecked) {
              nineteenyrs = numOfNineteen;
              if (mouseX >= x && mouseX <= x+w && mouseY >= y+10 && mouseY <= y+h+10 && graphView.lastDrag == -555 && !regionExpand && !ageExpand && !genderExpand) {
                stroke(0);
                strokeWeight(2);
              }
              else {
                noStroke();
              }
              fill(barsColor[2]);
              //  System.out.println("North America = "+numOfNorthAmerica+" and Both = "+(numOfNorthAmerica+european));
              //   y2 = map((numOfListeners-numOfMales-numOfFemales), 0, 3150000, 30, h-40);
              integrators.get(diff+10).target(nineteenyrs+nineyrs);
              yNineteen = map(integrators.get(diff+10).value, 0, maxAge, h-30, 5);    
              rect(0, yNine, w, yNineteen);
              //    System.out.println("yEuropean = "+yEuropean+" and yNorthAmerican"+yNorthAmerica);
              integrators.get(diff+10).update();
            }else{
            yNineteen = yNine;
            }
            if(twentyNineYrsChecked){
            
              twentynineyrs = numOfTwentyNine;
              if (mouseX >= x && mouseX <= x+w && mouseY >= y+10 && mouseY <= y+h+10 && graphView.lastDrag == -555 && !regionExpand && !ageExpand && !genderExpand) {
                stroke(0);
                strokeWeight(2);
              }
              else {
                noStroke();
              }
              fill(barsColor[4]);
              //  System.out.println("North America = "+numOfNorthAmerica+" and Both = "+(numOfNorthAmerica+european));
              //   y2 = map((numOfListeners-numOfMales-numOfFemales), 0, 3150000, 30, h-40);
              integrators.get(diff+20).target(nineteenyrs+nineyrs+twentynineyrs);
              yTwentyNine = map(integrators.get(diff+20).value, 0, maxAge, h-30, 5);    
              rect(0, yNineteen, w, yTwentyNine);
              //    System.out.println("yEuropean = "+yEuropean+" and yNorthAmerican"+yNorthAmerica);
              integrators.get(diff+20).update();
            }else{
            yTwentyNine = yNineteen;
            }
            if(thirtyNineYrsChecked){
              thirtynineyrs = numOfThirtyNine;
              if (mouseX >= x && mouseX <= x+w && mouseY >= y+10 && mouseY <= y+h+10 && graphView.lastDrag == -555 && !regionExpand && !ageExpand && !genderExpand) {
                stroke(0);
                strokeWeight(2);
              }
              else {
                noStroke();
              }
              fill(barsColor[5]);
              //  System.out.println("North America = "+numOfNorthAmerica+" and Both = "+(numOfNorthAmerica+european));
              //   y2 = map((numOfListeners-numOfMales-numOfFemales), 0, 3150000, 30, h-40);
              integrators.get(diff+30).target(thirtynineyrs+ nineteenyrs+nineyrs+twentynineyrs);
              yThirtyNine = map(integrators.get(diff+30).value, 0, maxAge, h-30, 5);    
              rect(0, yTwentyNine, w, yThirtyNine);
              //    System.out.println("yEuropean = "+yEuropean+" and yNorthAmerican"+yNorthAmerica);
              integrators.get(diff+30).update();
            
            }else{
            yThirtyNine = yTwentyNine;
            }
            if(fortyNineYrsChecked){
              fortynineyrs = numOfFortyNine;
              if (mouseX >= x && mouseX <= x+w && mouseY >= y+10 && mouseY <= y+h+10 && graphView.lastDrag == -555 && !regionExpand && !ageExpand && !genderExpand) {
                stroke(0);
                strokeWeight(2);
              }
              else {
                noStroke();
              }
              fill(barsColor[6]);
              //  System.out.println("North America = "+numOfNorthAmerica+" and Both = "+(numOfNorthAmerica+european));
              //   y2 = map((numOfListeners-numOfMales-numOfFemales), 0, 3150000, 30, h-40);
              integrators.get(diff+40).target(fortynineyrs+ thirtynineyrs+ nineteenyrs+nineyrs+twentynineyrs);
              yFortyNine = map(integrators.get(diff+40).value, 0, maxAge, h-30, 5);    
              rect(0, yThirtyNine, w, yFortyNine);
              //    System.out.println("yEuropean = "+yEuropean+" and yNorthAmerican"+yNorthAmerica);
              integrators.get(diff+40).update();
            
            }else{
            yFortyNine = yThirtyNine;
            }
            if(fiftyNineYrsChecked){
              fiftynineyrs = numOfFiftyNine;
              if (mouseX >= x && mouseX <= x+w && mouseY >= y+10 && mouseY <= y+h+10 && graphView.lastDrag == -555 && !regionExpand && !ageExpand && !genderExpand) {
                stroke(0);
                strokeWeight(2);
              }
              else {
                noStroke();
              }
              fill(barsColor[8]);
              //  System.out.println("North America = "+numOfNorthAmerica+" and Both = "+(numOfNorthAmerica+european));
              //   y2 = map((numOfListeners-numOfMales-numOfFemales), 0, 3150000, 30, h-40);
              integrators.get(diff+50).target(fiftynineyrs+fortynineyrs+thirtynineyrs+ nineteenyrs+nineyrs+twentynineyrs);
              yFiftyNine = map(integrators.get(diff+50).value, 0, maxAge, h-30, 5);    
              rect(0, yFortyNine, w, yFiftyNine);
              //    System.out.println("yEuropean = "+yEuropean+" and yNorthAmerican"+yNorthAmerica);
              integrators.get(diff+50).update();
            
            }else{
            yFiftyNine = yFortyNine;
            }
            if(sixtyOrMoreChecked){
              sixtymoreyrs = numOfSixtyOrMore;
              if (mouseX >= x && mouseX <= x+w && mouseY >= y+10 && mouseY <= y+h+10 && graphView.lastDrag == -555 && !regionExpand && !ageExpand && !genderExpand) {
                stroke(0);
                strokeWeight(2);
              }
              else {
                noStroke();
              }
              fill(barsColor[7]);
              //  System.out.println("North America = "+numOfNorthAmerica+" and Both = "+(numOfNorthAmerica+european));
              //   y2 = map((numOfListeners-numOfMales-numOfFemales), 0, 3150000, 30, h-40);
              integrators.get(diff+60).target(fiftynineyrs+fortynineyrs+thirtynineyrs+ nineteenyrs+nineyrs+twentynineyrs+sixtymoreyrs);
              ySixtyMore = map(integrators.get(diff+60).value, 0, maxAge, h-30, 5);    
              rect(0, yFiftyNine, w, ySixtyMore);
              //    System.out.println("yEuropean = "+yEuropean+" and yNorthAmerican"+yNorthAmerica);
              integrators.get(diff+60).update();
            
            }
            
              textSize(20);
          textFont(f2);
        
          }
        }
      }
    }
  }
}

