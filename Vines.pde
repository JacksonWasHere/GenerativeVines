VineMaker vine;

void setup(){
  fullScreen();
  colorMode(HSB);
  background(0);
  frameRate(20);
  vine = new VineMaker(width/3,0);
}

void draw(){
  vine.update();
}

void mousePressed(){
  vine.addNew(mouseX,mouseY);
}

void keyPressed(){
  if(key=='r'){
    vine.resetDots();
  }
}
