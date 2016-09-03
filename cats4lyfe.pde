Eye eRight, eLeft;  //declaring instances of class Eye
float a = 0;
float noiseScale = 20;
  
//setting up some stuff
void setup(){
  size(1000,1000);
  eRight = new Eye(650,450,50);    //initializing right eye
  eLeft = new Eye(350,450,50);     //initializing left eye
}


void draw(){
  a+=0.6;

  background(70);    //grey background :")
  
  float shake = 0;
  
  //setting up "shake" variables for clicking
  if(mousePressed){
    shake = noise(a)*noiseScale;                      //put it here because i wasn't sure about scope issues in Processing.js
  }
  else{
    textSize(32);
    text("Click Anywhere In the Box", 280, 100);   //if mouse isn't being pressed, display a prompt :"D
  }
  
  //!From here on, anything with a "shake" variable in the coordinates will "shake" when the mouse is pressed
 
  //building cat face!!
  noStroke();  //no ugly outline on cat >8(
  fill(255);  //white cat \o/
  ellipse(500+shake,500,600,500);  //cat face-face
  triangle(550+shake,340,800+shake,500,800+shake,150);  //right ear
  triangle(450+shake,340,200+shake,500,200+shake,150);  //left ear
  
  //kitty eyesssssss
  strokeWeight(5);
  stroke(0);
  ellipse(650+shake,450,50,50);
  ellipse(350+shake,450,50,50);
  
  //kitty nose :3
  fill(250,164,230);
  triangle(475+shake,480,525+shake,480,500+shake,515);
  fill(255,255,255);
  
  //kitty whiskerssss
    //left whiskers
    line(150+shake,600,350+shake,550);
    line(140+shake,540,350+shake,540);
    //right whiskers
    line(850+shake,600,650+shake,550);
    line(860+shake,540,650+shake,540);
  
   //irises
   if(mousePressed){
    //irises that don't follow mouse
    fill(97, 247, 226);
    ellipse(660,440,30,30);
    ellipse(340,440,30,30);
    //show lazorsssssss \o////
    fill(247,218,97);
    triangle(660+shake,440,1200+shake,350, 1000+shake, 0); 
    triangle(340+shake,440,-300+shake,800,0+shake,1400);
    fill(234,144,26);
    triangle(660,440,1000,350,1200, 0); 
    triangle(340,440,0,800,0,1200);
   }
   else{
    //if mouse isn't shown, have eyes follow mouse
    //updating points
    eRight.update(mouseX, mouseY);
    eLeft.update(mouseX, mouseY);
    //displaying points
    eRight.display();
    eLeft.display();
   }
  
}




class Eye{
  int ex, ey;
  int size;
  float angle = 0.0;

  Eye(int x, int y, int s) {
    ex = x;
    ey = y;
    size = s;
 }

  void update(int mx, int my) {
    angle = atan2(my-ey, mx-ex);
  }

  void display() {
    pushMatrix();
    translate(ex, ey);
    fill(255);
    ellipse(0, 0, size, size);
    rotate(angle);
    fill(153);
    ellipse(size/4, 0, size/2, size/2);
    popMatrix();
  }
}
