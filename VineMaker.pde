class VineMaker {
  ArrayList<Dot> dots; //stores dots
  ArrayList<Dot> newDots; //buffer for children
  int originalX;
  int originalY;

  // --- Game Rules ---
  //children
  float childRange = PI/2;
  float childVarience = childRange/2;
  float branchChance = 0.5;
  int childGenType = 1;
  //all dots
  int startSize = 4;
  int dotLifeSpan = 0; // set at 0 for infinite
  float dotTurning = PI/4;
  boolean organic = true;
  PVector startSpeed = new PVector(0,5);
  
  

  public VineMaker(int x, int y) {
    //setup arrays
    dots = new ArrayList<Dot>();
    newDots = new ArrayList<Dot>();
    originalX = x;
    originalY = y;
    setDots();
  }
  
  void setDots(){
    background(0);
    dots.clear();
    newDots.clear();
  }

  void resetDots() {
    // setup the board and reset arrays
    setDots();
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
        //remove if it's too old and lifespan is implemented
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
  
  //Adds new dots at x,y
  void addNew(int x, int y){
    Dot newChild = new Dot(new PVector(x, y), this.startSpeed, this.startSize);
    newChild.turning = dotTurning;
    dots.add(newChild);
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
