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

    if (!gendersChecked && !ageChecked && !regionChecked) {
      fill(0);
      textFont(fbold);
      textSize(10);
   //   textAlign(CENTER,BOTTOM);
      
      text(bandName, 10, h - 10);
      strokeWeight(0.5);
      stroke(#CFCFCF);
      line(20, 20, 20, h-30);
      textSize(20);
      textFont(f2);
    }
    else {
      if (gendersChecked) {
      }
      else {
      }
    }
  }
}

