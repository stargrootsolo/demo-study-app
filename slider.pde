class Slider {
  float x, y;
  float w, h;
  float min, max;
  float sliderX;
  float sliderVal;
  String label;


  Slider( float x, float y, float w, float h, float min, float max, String label) {
    this.x = x+840;
    this.y = y+470;
    this.w = w;
    this.h = h-20;
    this.min = min;
    this.max = max;
    this.label = label; 

    sliderX = x + (w/2);
    sliderVal = map( sliderX, x, x+w, min, max);

  }


  void display() {

 fill(300,0,0,50);
    rect( x, y, w, h); 

    fill(326, 100, 100,50);
    rect( sliderX-1, y-3, 4, h + 6);

  }
  

  void setSliderVal( float sliderVal) {
    this.sliderVal = sliderVal;
    this.sliderX = map( sliderVal, min, max, x, x+w);
  }


  boolean checkPressed(int mx, int my) {
    boolean isChanged = false;
    if ( mx >= x && mx <= x+w && my> y && my< y +h) { 
      isChanged = true;
      sliderX = mx;
      sliderVal = map( sliderX, x, x+w, min, max);
    }
    return isChanged;
  }
}
