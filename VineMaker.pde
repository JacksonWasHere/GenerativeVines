class VineMaker {
  ArrayList<Dot> dots; //stores dots
  ArrayList<Dot> newDots; //buffer for children
  int originalX;
  int originalY;

  // --- Game Rules ---
  float childRange = PI/2;
  float childVarience = childRange/2;
  float branchChance = 0.2;
  int childGenType = 0;
  int startSize = 4;
  int dotLifeSpan = 30; // set at 0 for infinite
  boolean organic = true;
  PVector startSpeed = new PVector(0,5);
  
  

  public VineMaker(int x, int y) {
    //setup arrays
    dots = new ArrayList<Dot>();
    newDots = new ArrayList<Dot>();
    originalX = x;
    originalY = y;
    setDots(x,y);
  }
  
  void setDots(int x, int y){
    background(0);
    dots.clear();
    newDots.clear();
    //dots.add(new Dot(new PVector(x, y), startSpeed, startSize));
  }

  void resetDots() {
    // setup the board and reset arrays
    setDots(originalX,originalY);
  }

  void update() {
    // loop through each dot to see if we should delete it
    for (int i = 0; i < dots.size(); i++) {
      Dot d = dots.get(i);
      //delete if it's far out of bounds or has no size
      if (d.size == 0 || d.position.x < -100 || d.position.y < -100 || d.position.x > width+100 || d.position.y > height+100) {
        dots.remove(i);
        i--;
      } else if (dotLifeSpan != 0 && d.age == dotLifeSpan){
        dots.remove(i);
        i--;
      }
    }
    this.drawVines();
    // put all new children in the array
    for (Dot d : newDots) {
      dots.add(d);
    }
    newDots.clear();
  }
  
  float getOdds(){
    if(childGenType == 0){
      return branchChance;
    } else {
      return branchChance/((float)dots.size()); // higher population means less reproduction chances
    }
  }

  void drawVines() {
    noStroke();
    
    for (Dot d : dots) {
      //this method draws and updates the dot
      d.update(organic);
      
      // generate a child with certain odds
      if (random(1)<=getOdds()) {
        Dot newChild = d.makeChild(childRange, childVarience);
        newDots.add(newChild);
        
        // Adds semetry if wanted
        //Dot cloneChild = new Dot(new PVector(d.position.x,d.position.y),new PVector(newChild.direction.x,-newChild.direction.y),newChild.size);
        //cloneChild.intensity = newChild.intensity;
        //newDots.add(cloneChild);
      }
    }
  }
}
