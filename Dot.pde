class Dot {
  
  //controlling motion
  PVector position;
  PVector direction;
  float turning;
  
  int size;
  int intensity = 0; //what color
  int age = 0; // how many times it's been drawn
  
  public Dot(PVector pos, PVector dir, int siz) {
    position = pos;
    direction = dir;
    size = siz;
  }

  void update(boolean org) {
    //update position
    position.x += direction.x;
    position.y += direction.y;
    //increase color
    intensity = (intensity + 3)%256;
    //add organic motion if true
    if(org){
      rotateVector(direction,random(turning) - turning/2);
    }
    drawDot();
    age += 1;
  }

  Dot makeChild(float range, float varience) {
    //make a new direction vector with a rotated copy
    float theta = random(range) - varience;
    float x = direction.x*cos(theta) - direction.y*sin(theta); //derived from 2x2 rotation vector times <x,y>
    float y = direction.x*sin(theta) + direction.y*cos(theta);
    PVector newDir = new PVector(x,y);
    //make a child with same positon, newDir, and a smaller size
    Dot child = new Dot(new PVector(position.x,position.y),newDir,size-1);
    //information that should be inherited for consistency
    child.turning = this.turning;
    child.intensity = this.intensity;
    return child;
  }

  void drawDot() {
    fill(intensity,255,255);
    ellipse(position.x, position.y, size, size);
  }
  
  void rotateVector(PVector vector, float theta) {
    float x = vector.x*cos(theta) - vector.y*sin(theta); //derived from 2x2 rotation vector times <x,y>
    float y = vector.x*sin(theta) + vector.y*cos(theta);
    vector.x = x;
    vector.y = y;
  }
  
  //TODO: implement
  //Note: may never need this
  Dot clone(){
    PVector positionNew = new PVector();
    PVector direction;
    int size;
    int intensity = 255;
    return null;
  }
}
