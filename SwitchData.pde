color[] colortheme = {#6284A3, #A35D5A, #EBF0B4, #F0A09C, #84BCF0,
  #D4D0AB, #ABD4C6, #B6ABD4, #D4BCB6};

// create a class instance of a table for the dataset
Table switchData;
// useful variable for counting rows
int rowCount;

void setup() {
  size(1000, 600);
  // anti-aliasing
  smooth();
  // change rect mode to make computations easier
  rectMode(CORNERS);
  // read in the text file
  switchData = new Table("SwitchData.tsv");
  rowCount = switchData.getRowCount();
}

void draw() {
  int bottom = 30;
  int sides = 75;
  // create a line chart if the mouse is pressed
  if (mousePressed) {
    // grey background
    background(colortheme[0]);
  }
  // when the mouse isn't pressed, show the barchart
  else {
    background(colortheme[0]);
    
    int legendCount = 0;
    int count1 = 0;
    int count2 = 0;
    int count3 = 0;
    int count4 = 0;
    int count5 = 0;
    int count6 = 0;
    int count7 = 0;
    
    // y-axis ticks
    for (int ii = (0 + bottom); ii <= (height - bottom); ii += (height / 340) * 16) {
      stroke(0);
      line(5, ii, 20, ii);
    }
    
    // draw the bars
    for (int row = 0; row < rowCount; row++) {
      // get info from the data table
      String games = switchData.getString(row, 1);
      float id = float(switchData.getString(row, 0));
      float idMap = map(id, 1, 14, (0 + sides), (width - sides));
      float hours = float(switchData.getString(row, 2));
      float hoursMap = map(hours, 0, 340, (height - bottom), (0 + bottom));
      float rating = float(switchData.getString(row, 4));
      String label = switchData.getString(row, 6);
      String type = switchData.getString(row, 7);
      
      noStroke();
      textAlign(LEFT);
      stroke(0);
      textSize(12);
       
      // fill bars by type
      if (type.equals("Action/Adventure") == true) {
        noStroke();
        fill(colortheme[1]);
        println(type);
        rect(idMap - 15, hoursMap, idMap + 15, height - bottom);
        if (count1 == 0) {
          rect(width/2-10, 90 + legendCount, width/2+10, 90 + legendCount + 20);
          legendCount += 25;
          fill(0);
          text(type, width/2 + 15, 80 + legendCount);
        }
        count1 += 1;
      }
      if (type.equals("Shooter") == true) {
        noStroke();
        fill(colortheme[2]);
        rect(idMap - 15, hoursMap, idMap + 15, height - bottom);
        if (count2 == 0) {
          rect(width/2-10, 90 + legendCount, width/2+10, 90 + legendCount + 20);
          legendCount += 25;
          fill(0);
          text(type, width/2 + 15, 80 + legendCount);
        }
        count2 += 1;
      }
      if (type.equals("Fighting") == true) {
        noStroke();
        fill(colortheme[3]);
        rect(idMap - 15, hoursMap, idMap + 15, height - bottom);
        if (count3 == 0) {
          rect(width/2-10, 90 + legendCount, width/2+10, 90 + legendCount + 20);
          legendCount += 25;
          fill(0);
          text(type, width/2 + 15, 80 + legendCount);
        }
        count3 += 1;
      }
      if (type.equals("Role-Playing") == true) {
        noStroke();
        fill(colortheme[4]);
        rect(idMap - 15, hoursMap, idMap + 15, height - bottom);
        if (count4 == 0) {
          rect(width/2-10, 90 + legendCount, width/2+10, 90 + legendCount + 20);
          legendCount += 25;
          fill(0);
          text(type, width/2 + 15, 80 + legendCount);
        }
        count4 += 1;
      }
      if (type.equals("Strategy") == true) {
        noStroke();
        fill(colortheme[5]);
        rect(idMap - 15, hoursMap, idMap + 15, height - bottom);
        if (count5 == 0) {
          rect(width/2-10, 90 + legendCount, width/2+10, 90 + legendCount + 20);
          legendCount += 25;
          fill(0);
          text(type, width/2 + 15, 80 + legendCount);
        }
        count5 += 1;
      }
      if (type.equals("Rhythm") == true) {
        noStroke();
        fill(colortheme[6]);
        rect(idMap - 15, hoursMap, idMap + 15, height - bottom);
        if (count6 == 0) {
          rect(width/2-10, 90 + legendCount, width/2+10, 90 + legendCount + 20);
          legendCount += 25;
          fill(0);
          text(type, width/2 + 15, 80 + legendCount);
        }
        count6 += 1;
      }
      if (type.equals("Party") == true) {
        noStroke();
        fill(colortheme[7]);
        rect(idMap - 15, hoursMap, idMap + 15, height - bottom);
        if (count7 == 0) {
          rect(width/2-10, 90 + legendCount, width/2+10, 90 + legendCount + 20);
          legendCount += 25;
          fill(0);
          text(type, width/2 + 15, 80 + legendCount);
        }
        count7 += 1;
      }

      // add text to the bottom
      fill(0);
      textAlign(LEFT);
      textSize(12);
      text(label, idMap - 15, height - bottom/3);
     
      // this will display information when hovering over the bars of the graph
      if ((mouseX > idMap - 15)&&(mouseX < idMap + 15)&&(mouseY > hoursMap)) {
        if ((idMap + 300) < width) {
          text(games + " played for " + int(hours) + "hrs", idMap - 60, 25);
        }
        else {
          text(games + " played for " + int(hours) + "hrs", width - 325, 25);
        }
      }
    }
    
    // title
    textAlign(CENTER);
    textSize(40);
    text("Switch Games Hours Played", width/2, height/2 + 30);
  }
}
