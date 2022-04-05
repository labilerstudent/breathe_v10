void UI ()
{  
  fill(0);
  noStroke();
  rect(0, 0, width, 120);
  pushMatrix();
  stroke((float)slider[0].read_setting(), (float)slider[1].read_setting(), (float)slider[2].read_setting());
  corners2 =int( min((slider[3].read_setting()-(float)i2/32 )/2, (slider[3].read_setting()-(float)i2/32 )/2)*slider[4].read_setting()  );
  noStroke();
  rect(0, 0, 370, height);
  stroke(360);
  noFill();
  strokeWeight(0.5);



  //UI RECT

  rect(84, 280, 200, 200);

  stroke((float)slider[0].read_setting()/10, 0, (float)slider[2].read_setting());
  strokeWeight(1);
  fill(slider[5].read_setting(), 0, slider[7].read_setting(), slider[8].read_setting());

  // UI RECT
  rectMode(CENTER);
  fill(360);
  rect(  slider[12].read_setting()+84, 375, slider[3].read_setting()/8, slider[3].read_setting()/8, corners2, corners2, corners2, corners2 );
  fill(0);

  noStroke();
  rectMode(CORNER);



  popMatrix();
  strokeWeight(1);

  slider (0, 40, 20, 200);
  slider (1, 40, 40, 200);
  slider (2, 40, 60, 200);
  slider (3, 40, 80, 200);
  slider (4, 40, 100, 200);
  slider (5, 40, 120, 200);
  slider (6, 40, 140, 200);
  slider (7, 40, 160, 200);
  slider (8, 40, 180, 200);
  slider (9, 40, 200, 200);
  slider (10, 40, 220, 200);
  slider (11, 40, 240, 200);
  slider (12, 40, 260 , 200);
  slider (13, 40, height-260, 200);
  slider (14, 40, height-240, 200);
  slider (15, 40, height-220, 200);
  
  slider (16, 40, height-200, 200);
  slider (17, 40, height-140, 200);
  slider (18, 40, height-80, 200);
  slider (19, 40, height-20, 200);

  float current_state = angle3, current_state2 = angle4;
  int laenge = 200;
  noFill();
  stroke(360);
  
  
        ellipse(84+laenge, height-110+(sin(current_state/2) )*15, 5, 5);

        beginShape();
      
        for (int i=0; i<laenge; i++) {
          current_state-= slider[18].read_setting()*10;
      
          vertex(84+laenge-i, height-110+(sin(current_state/2) )*15);
        }
      
        endShape();
      
        noFill();
        stroke(360);
        ellipse(84+laenge, height-50+(sin(current_state2/2) )*15, 5, 5);
      
        //SINE
        beginShape();
      
        for (int i=0; i<laenge; i++) {
          current_state2-= slider[19].read_setting()*10;
      
          vertex(84+laenge-i, height-50+(sin(current_state2/2) )*15);
        }
      
        endShape();
 
  rect(84, 600, 200, 200);
  rectMode(CORNER);
  pushMatrix();
  translate(184, 600);
  rotate(d1*125);

  // for (int i = 0; i < 20; i = + 100/ (int( slider[11].read_setting()/10)+1  )) {
  //ellipse(((i/slider[12].read_setting()+d2/2000)*8), 0, 20, 20);
  //  println(i/slider[12].read_setting()+d2/1600);
  //}  

  popMatrix();
  //text(frameRate,190,450);
 ellipse(120+d2/8, height -170, 30, 30);
  pushMatrix();



  popMatrix();




  textAlign(LEFT, TOP);

  textAlign(RIGHT, CENTER);
  text("askor", width-20, 35 );
  text("void001", width-20, 55,16 );
  text("fps = "+(int)frameRate, width-20, 75 );
  text("amount = "+(int)slider[11].read_setting()*2, width-20, 95 );
  text("to do: stroke transparency,order sliders, line in, more tracks(?), play pause, skip(?)", 1000, 100);
  

  
}
