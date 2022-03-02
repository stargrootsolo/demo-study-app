import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

PImage rain;
PFont romantic;
PFont font1;
PFont font2;
PFont font3;
PFont font4;
PFont font5;
PFont font6;
Button ok;
boolean forest;
PImage fst;
boolean pluie;
boolean rainmusic;
float hue;
onoff on;
Slider slider1;
String message = "Where do you want to study?";
Letter[] letters;
onoff[] onoff;


Drop [] drops = new Drop[1000];

import ddf.minim.*;
Minim minim;
AudioPlayer player;


import processing.sound.*;
SoundFile backgroundmusic;



void setup() {
  size(1280 ,720);
  
   backgroundmusic = new SoundFile(this,"ambiant_song.mp3" );
   backgroundmusic.loop();

   
   minim=new Minim(this);
  player=minim.loadFile("rain.mp3");
    
  colorMode( HSB, 360,100,100);
  rain = loadImage("rain_final.png");
   font6 = createFont ("ROMANTIC.TTF",20);
     font1=createFont("ROMANTIC.TTF",40);
     font3 = createFont ("ROMANTIC.TTF",50);
       font2=createFont("GreatMammoth Free.otf",40);
       font4=createFont("GreatMammoth Free.otf",25);
              font5=createFont("GreatMammoth Free.otf",15);
        fst = loadImage("magical_forest_final.png");
        
    
        for (int i = 0; i < drops.length; i++) {
  drops [i] = new Drop();
  
 }
   textFont(font1);
       letters = new Letter[message.length()];
       int x = 500;
       for (int i = 0;i< message.length (); i ++ ){
         letters[i] = new Letter (x, 100, message.charAt(i));
         x+= textWidth(message.charAt(i));
         
           ok = new Button(651,670,115, "changing ambiance", color(0, 0, 0));
           on = new onoff(75, 683, 50, "on rain", color(0, 0, 100));
           
          slider1 = new Slider( 200,200, 200, 30, 0, 360, "Hue");
  hue = slider1.sliderVal;
       }
}

void draw() {

   
  image(rain,0,0);
if(forest) {
    image(fst,0,0);
 }

  
  if (ok.visible) ok.show();

 
//titre
  fill(0, 0, 100);
  textFont(font3);
  text("Study chill app",550,60);
  filter(POSTERIZE, 6);
  
  for(int i = 0; i< letters.length; i++) {
    letters[i].display();
    if(mousePressed){
      letters[i].shake();
    }else{
      letters[i].home();
    }
  }
  
  
  //indications en bas a droite
    fill(0, 0, 100);
  textFont(font6);
  text("Press number 1 to 9 to change the tint!",1025,698);
  
  fill(0, 0, 100);
  textFont(font6);
  text("Put some color!",1090,662);


  //bouton rain
   fill(0);
 stroke(0, 0, 100);
 strokeWeight(2);
 ellipse(75,685,100,30);
  
  fill(0, 0, 100);
  textFont (font5);
  text("off rain",48,690);
  
  if (rainmusic)
    player.play();
    else
    player.pause();

//slider
 if( mousePressed){
    boolean isChanged = slider1.checkPressed( mouseX, mouseY);
    if(isChanged){
        hue = slider1.sliderVal; 
    }
  }
  slider1.display();
  fill( hue, 100, 100);
  
 //decorations gauche

noStroke();
circle(501,100,5);
circle(535,125,4);
circle(525,70,4.5);

beginShape();
  vertex(520, 90);
   vertex(523, 100);
    vertex(530, 105);
     vertex(523, 110);
      vertex(520, 120);
      
      vertex(517, 110);
    vertex(510, 105);
     vertex(517, 100);
    endShape(CLOSE);
    
 beginShape();
  vertex(490, 60);
   vertex(493, 70);
    vertex(500, 75);
     vertex(493, 80);
      vertex(490, 90);
      
      vertex(487, 80);
    vertex(480, 75);
     vertex(487, 70);
    endShape(CLOSE);
    
 //decorations droite

 noStroke();
circle(801,50,5);
circle(835,65,4);
circle(825,15,4.5);

beginShape();
  vertex(820, 30);
   vertex(823, 40);
    vertex(830, 45);
     vertex(823, 50);
      vertex(820, 60);
      
      vertex(817, 50);
    vertex(810, 45);
     vertex(817, 40);
    endShape(CLOSE);
    
    //grosse etoiles
   
    noStroke();
    ellipse(520,40,30,5);
     ellipse(520,40,5,30);
   stroke(#ffe5b4);
   point(530, 30);
    point(525, 202);
   point(510, 50);
 
 //texte bouton changing ambiance
    textFont(font4);
  text("Changing ambiance",553,683);
  

  
  if(pluie) {
  for (int i = 0; i < drops.length; i++) {
    drops [i].fall();
      drops [i].show();
      }
  if (on.visible) on.display();
  

  }
  }
  void mousePressed() {
  if (ok.visible) {  
    float d = dist(ok.pos.x, ok.pos.y, mouseX, mouseY);
    if (d <= ok.radius){
      forest = !forest;
      
    } 
  }
}

class Button {
  PVector pos;
  float radius;
  color col;
  String caption;
  boolean visible;

  Button(float x, float y, float r, String txt, color c) {
    pos = new PVector(x, y);
    radius = r;
    caption = txt;
    col = c;
    visible = true;
  }

  void show() {
    fill(0);
  stroke(255);
  strokeWeight(2);
  rect(550,650,200,50);
    
    float fontSize = radius * 0.22;
    textSize(fontSize);
    fill(255);
    float tw = textWidth(caption);
    float tx = pos.x - (tw/2);
    float ty = pos.y + (fontSize / 2);
    text(caption, tx, ty);
  }
}
