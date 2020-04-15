VineMaker vine;

void setup(){
  size(640,640);
  colorMode(HSB);
  background(0);
  frameRate(20);
  vine = new VineMaker(width/3,0);
}

void draw(){
  vine.update();
}

void mousePressed(){
  vine.dots.add(new Dot(new PVector(mouseX, mouseY), vine.startSpeed, vine.startSize));
}

void keyPressed(){
  if(key=='r'){
    vine.resetDots();
  }
}
