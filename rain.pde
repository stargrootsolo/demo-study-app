class Drop {
  float x = random(width);
  float y = random(-500,-50);
  float z = random(0, 20);
  float len = map(z, 0, 13, 10, 16);
    float yspeed = map(z, 0, 20, 4, 30);
  
  void fall() {
    y = y + yspeed;
    float grav = map(z, 0, 20, 0, 0.9);
    yspeed = yspeed + grav;
    
    if (y > height) {
      y = random(-200,-100);
      yspeed = map(z, 0, 20, 4, 30); 
       } 
    
 }   
 
 
    void show() {
      float thick = map(z, 0, 20, 1, 3);
      strokeWeight(1);
      stroke(210, 28, 94);
      line(x,y,x,y+len);
      
      }
    }
