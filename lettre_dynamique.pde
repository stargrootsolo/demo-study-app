class Letter {
  char letter;

  float homex,homey;

  float x,y;
  
  Letter(float x_, float y_, char letter_) {
    homex = x = x_;
    homey = y = y_;
    letter = letter_;
  }
  
  void display() {
    fill(0, 0, 100);
    text(letter,x,y);
  }

  void shake() {
    x += random(-5,5);
    y += random(-5,5);
  }
  
  void home() { 
    x = homex;
    y = homey;
  }
}
