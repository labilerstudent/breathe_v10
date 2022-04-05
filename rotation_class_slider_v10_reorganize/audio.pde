float ampl = 0; 

void drawDebug() {
  stroke(255);
  strokeWeight(2);  
  double[] energyBuffer = beatDetector.getEnergyBuffer();
  int cursor = beatDetector.getEnergyCursor();
  float last = (float) energyBuffer[cursor] / 100 * 50;
  float spacing = (float) 200 / (energyBuffer.length - 1);
  for (int j = 1; j < energyBuffer.length; j++) {
    int index = (j + cursor) % energyBuffer.length;    
    float energy = (float) energyBuffer[index] / 100 * 50;
    ampl=energy; stroke(360);
    if(!HIDE_UI)line((j - 1) * spacing+84, 580 - last * 1, j * spacing+84, 580 - energy);
    last = energy;
  }
  
    boolean[] beatBuffer = beatDetector.getBeatBuffer();
  for (int j = 1; j < beatBuffer.length; j++) {
    int index = (j +cursor) % energyBuffer.length;
    boolean beat = beatBuffer[index];
    if (beat&&!HIDE_UI) {
      
     stroke(360);
    // line(j * spacing+84, 460, j * spacing+84, 480);
     triangle(84,530,84,500,104,515);
     if(dist( (34*2+50)/3,470,mouseX,mouseY)<10)CRX=true; 
     
    }
    
  }


}
