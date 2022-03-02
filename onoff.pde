class onoff {
  PVector pos;
  float radius;
  color col;
  String caption;
  boolean visible;

  onoff(float x, float y, float r, String txt, color c) {
    pos = new PVector(x, y);
    radius = r;
    caption = txt;
    col = c;
    visible = true;
  }

  void display() {
    strokeWeight(3);
    fill(0);
    ellipse(75,685,100,30);
    
    float fontSize = radius * 0.33;
    textSize(fontSize);
    fill(0, 0, 100);
    float tw = textWidth(caption);
    float tx = pos.x - (tw/2);
    float ty = pos.y + (fontSize / 2);
    text(caption, tx, ty);
  }
}

void mouseClicked() {
  if (on.visible) {   
    float d = dist(on.pos.x, on.pos.y, mouseX, mouseY);
    if (d <= on.radius){
    pluie = !pluie;
 rainmusic = !rainmusic;

   
    } 
  }
}
