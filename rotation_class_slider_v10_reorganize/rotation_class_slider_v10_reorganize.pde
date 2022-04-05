import processing.sound.*;
SoundFile sample;
BeatDetector beatDetector;
setting slider[];
//AudioIn sample;



PFont schriftart;                 //creating the font
int edit_slider=0;
boolean UI_on = true;
float prev_xs, prev_ys, xs, inc, eRadius, angle, angle2, angle3, angle4, diameter;
float ys = 500;

void setup() {

  textParameter();
  fullScreen(P2D, 1);
  background(0);
  colorMode(HSB, 360);


  // sample = new SoundFile(this, "RIOT108 - ZUSTAND.wav");
  //sample = new AudioIn(this, 0);
 // sample = new SoundFile(this, "Berlin Cycling Kreuzberg, How to enjoy Summer day 2020 [4K] Soundscape.wav");
  sample = new SoundFile(this, "RIOT108 - UMSTAND.wav");
   sample.loop();
  //sample.start();
  beatDetector = new BeatDetector(this);
  beatDetector.input(sample);
  beatDetector.sensitivity(200);



  diameter = height - 10;

  // println(Serial.list());// look in the window when the program runs to see which port to use
  //myPort = new Serial(this, Serial.list()[3], 9600);  // for me com 26 was port 0, so I put a 0 here
  // myPort.bufferUntil('\n');

  //SliderFunktion

  slider = new setting[20];
  slider[0] = new setting("H", 0, 360, 0, 1);
  
  slider[1] = new setting("S", 0, 360, 0, 1);
  slider[1].value = 0.1;
  slider[2] = new setting("B", 0, 360, 0, 1);
  slider[2].value = 0;
  slider[3] = new setting("T", 0, 360, 0, 1);
  slider[3].value = 0.1;
  slider[4] = new setting("FH", 0, 360, 0, 1);
  slider[4].value = 0.1;
  slider[5] = new setting("FS", 0, 360, 0, 1);
  slider[5].value = 0.1;
  slider[6] = new setting("FB", 0, 360, 0, 1);
  slider[6].value = 0;
  slider[7] = new setting("FT", 0, 360, 0, 1);
  slider[7].value = 0.1;
  slider[8] = new setting("BGH", 0, 360, 0, 1);
  slider[8].value = 0.1;
  slider[9] = new setting("BGS", 0, 360, 0, 1);
  slider[9].value = 0.1;
  slider[10] = new setting("BGB", 0, 360, 0, 1);
  slider[10].value = 0;
  slider[11] = new setting("BGT",0,360, 0,1);
  slider[11].value = 0.1;
  slider[12] = new setting("size", 0, 200, 0, 1);
  slider[13] = new setting("corners", 1, 0, 0, 1);
  slider[14] = new setting("rotate", -0.000001, 0.000001, 0, 1);
  slider[15] = new setting("amount", 1, 150, 0, 1);
  slider[16] = new setting("space", .05, 4, 0, 1);
  slider[17] = new setting("move", -0.1, 0.1);
  slider[18] = new setting("sinus 1", -0.1, 0.1);
  slider[19] = new setting("sinus 2", -0.1, 0.1);



  // slider[16] = new setting("sinus 2",-0.01, 0.01);
}
// H 0 S 1 B 2 T 3 FH 4 FS 5 FB 6 FT 7 BGS 8 corners

/*  
 
 slider[5] = new setting("FS", 0, 360,0,1);     NEW SLIDER
 slider[6] = new setting("FB", 0, 360,0,1);
 slider[7] = new setting("FT", 0, 360,0,1);
 slider[8] = new setting("size", 0, 360,0,1);
 slider[9] = new setting("corners", 0, 360,0,1);
 slider[10] = new setting("BGH", -0.000001, 0.000001,0,1);
 slider[11] = new setting("BGS", 1, 150,0,1);
 slider[12] = new setting("BGB", .05, 4,0,1);
 slider[13] = new setting("BGT", -0.1, 0.1);
 slider[14] = new setting("rotate", -0.000001, 0.000001,0,1);
 slider[15] = new setting("amount", 1, 150,0,1);
 slider[16] = new setting("space", .05, 4,0,1);
 slider[17] = new setting("move", -0.1, 0.1);
 slider[18] = new setting("sinus 1", -0.1, 0.1);
 slider[19] = new setting("sinus 2", -0.1, 0.1);
 
   slider[0] = new setting("H", 0, 360,0,1);    
  slider[1] = new setting("S", 0, 360,0,1);    
  slider[2] = new setting("B", 4, 200,0,1);
  slider[3] = new setting("size", 10, 1000,0,1);
  slider[4] = new setting("corners", 1, 0,0,1);
  slider[5] = new setting("FH", 0, 360,0,1);
  slider[6] = new setting("FS", 0, 360,0,1);
  slider[7] = new setting("FB", 0, 360,0,1);
  slider[8] = new setting("FT", 0, 360,0,1);
  slider[9] = new setting("BGS", 0, 360,0,1);
  slider[10] = new setting("rotate", -0.000001, 0.000001,0,1);
  slider[11] = new setting("amount", 1, 150,0,1);
  slider[12] = new setting("space", .05, 4,0,1);
  slider[13] = new setting("move", -0.1, 0.1);
  slider[14] = new setting("sinus 1", -0.1, 0.1);
  slider[15] = new setting("sinus 2", -0.1, 0.1);
 
 
 
 slider[14] = new setting("sinus 1", -0.1, 0.1);
 slider[15] = new setting("sinus 2", -0.1, 0.1);
 */
boolean CRX=false, HIDE_UI=false;

float d1 = 10 + (sin(angle/2) * diameter) + diameter/2;
float d2 = 10 + (sin(angle2/2) * diameter/2) + diameter/2;


int corners2 = 0;

int i2 = 1;



void draw() {

  CRX=false;
  textSize(17);
  textAlign(LEFT, CENTER);
  checkbox_hover=false;

  d1 = 10 + (sin(angle/2) * diameter) + diameter/2;
  d2 = 10 + (sin(angle2/2) * diameter/2) + diameter/2;
  corners2 = 0;
  i2 = 1;

  inc = TWO_PI/25.0;


  noStroke();
  fill(slider[8].read_setting(), slider[9].read_setting(), slider[10].read_setting(), slider[1].read_setting()  );
  rect(0, 0, width, height);
  println(slider[9].read_setting());

  pushMatrix();

  scale(0.5);
  translate((HIDE_UI?0:400)+width, (HIDE_UI?0:100)+height);



  for (int i = 0; i<width; i =i+width/int( slider[15].read_setting()  )) {
    fill(slider[4].read_setting()+i/10, slider[5].read_setting(), slider[6].read_setting(), slider[7].read_setting());
    strokeWeight(1);
    stroke((float)slider[0].read_setting()+i/10, (float)slider[1].read_setting(), (float)slider[2].read_setting(), (float)slider[3].read_setting());
    rotate(d1);


    // main sketch running

    int corners = 0;
    corners =int( min((slider[12].read_setting()-(float)i/32 )/2, (slider[12].read_setting()-(float)i/32 )/2)*slider[13].read_setting()  );

    rect(  (i/slider[16].read_setting()+d2/4)/2, (d2/16)/2, (slider[12].read_setting()-(float)i/32)/2, (slider[12].read_setting()-(float)i/32)/2, corners, corners, corners, corners );

    rect(  i/slider[16].read_setting()+d2/16, d2/16, slider[12].read_setting()-(float)i/64, slider[12].read_setting()-(float)i/64, corners, corners, corners, corners );
    // slider[3].read_setting()            ==> Werte anhand der skala einstellen
    // slider[3].value = etwas             ==> slider auf einen wert zwingen ACTUNG!!! zwischen 0 und 1
    // slider[3].max oder .min    = etwas  ==> skala verändern
  }
  popMatrix();

  angle4 += slider[19].read_setting();
  angle3 += slider[18].read_setting();
  angle2 += slider[17].read_setting();
  angle += slider[14].read_setting();

  for (int i=0; i<slider.length; i++)slider[i].update_sin();
  if (!HIDE_UI)UI();
  drawDebug();
  if (CRX)cursor(HAND);
  else cursor(ARROW);
  for (int i=0; i<slider.length; i++)slider[i].self_correct();
}
