import controlP5.*;
ControlP5[] gui = new ControlP5[3];
import ddf.minim.*;
Minim minim;
AudioPlayer[] ap = new AudioPlayer[12];
PrintWriter output;
boolean d = false; 
boolean move = false; 
int playm = 1;
PImage img;
PImage record;
int cl = 1;
int pl = 1;
float stw = 2;
AudioInput in;
AudioRecorder recorder;
void setup(){
fullScreen();
// size(1080,720);
output = createWriter("note.txt");
record = loadImage("record.png");
 minim = new Minim(this);
 in = minim.getLineIn();
 recorder = minim.createRecorder(in, "myrecording.wav");
 ap[0] = minim.loadFile("a.wav");
 ap[1] = minim.loadFile("b.wav");
 ap[2] = minim.loadFile("bb.wav");
 ap[3] = minim.loadFile("c.wav");
 ap[4] = minim.loadFile("cc.wav");
 ap[5] = minim.loadFile("d.wav");
 ap[6] = minim.loadFile("e.wav");
 ap[7] = minim.loadFile("eb.wav");
 ap[8] = minim.loadFile("f.wav");
 ap[9] = minim.loadFile("ff.wav");
 ap[10] = minim.loadFile("g.wav");
 ap[11] = minim.loadFile("gg.wav");
 gui[0] = new ControlP5(this);
 gui[0].addButton("Ok")
   .setPosition(50,50)
   .setSize(100,50)
   .setValue(0)
   .activateBy(ControlP5.PRESS);
;

 gui[1] = new ControlP5(this);
 gui[1].addButton("Play")
   .setPosition(180,50)
   .setSize(100,50)
   .setValue(0)
   .activateBy(ControlP5.PRESS);
;

 gui[1] = new ControlP5(this);
 gui[1].addButton("Reset")
   .setPosition(300,50)
   .setSize(100,50)
   .setValue(0)
   .activateBy(ControlP5.PRESS);
;


}
public void Ok(int value){
  if(cl == 2){
 saveFrame("1.png");
 text("The NEW",200,100);
 d = true;
  }
  cl++;

}


public void Play(int value){
  if(cl==3){
  if(pl == 1){
  move = true;
 d = true;
  }
  pl++;
  }
}


public void Reset(int value){
  if(cl==3){
  if(pl == 2){
  move = false;
 d = false;
 cl =2;
 pl=1;
 background(200);
  }
  }
}




void draw(){
  
if(keyPressed){
  if(stw >= 0.2){
 if(keyCode == DOWN)  {
   stw = stw-0.2;
 }
  }
  if(keyCode == UP) {
    stw = stw+0.2;
  }
  
  if(key == 'N' || key == 'n') {
    
    output.flush(); 
  output.close();
  exit();
  }
}

if(cl == 3){
 background(200);
img = loadImage("1.png");
image(img, 0,0);
//filter(INVERT);
}

 if(d == false){
   if(mouseButton==LEFT){
     
     strokeWeight(stw);
    line(mouseX,mouseY,pmouseX,pmouseY);
   }
 }
 if(move  == true){
    if ( recorder.isRecording() )
  {
    image(record, 5,15,20,20);
    //text("Currently recording...", 5, 15);
  }
  else
  {
    text("Not recording.", 5, 15);
  }
   if(playm > width){
    playm =1; 
   }
   playm++;
   if(keyPressed){
    if(key == 'i') {
     playm = playm+2; 
    }
     
   }
   
   strokeWeight(2);
  line(playm,height,playm,-height); 
 
  PImage track = img.get(playm, 0, 5, height); 
  //image(track, 300, 200);
  int colorX = 0; // X-coordinate of the closest in color video pixel
  int colorY = 0; // Y-coordinate of the closest in color video pixel
  float closestColor = 10000; 
  
  track.loadPixels();
  int index = 0;
   for (int y = 0; y < track.height; y++) {
     for (int x = 0; x < track.width; x++) {
       color pixelValue = track.pixels[index];
       float colorProximity = abs(red(pixelValue)-0)+abs(green(pixelValue)-255)+abs(blue(pixelValue)-0);
       if (colorProximity < closestColor) {
         closestColor = colorProximity;
         closestColor=closestColor-10; 
         colorY = y;
         colorX = x;
       }
       index++;
     }
   }
  color c = get(5, height);
  //text("Black color Position"+colorY, 200, 400);
  ellipse(playm,colorY,20,20);
   //Here The Piano Key's Sound 
   for(int d=0; d<ap.length; d++){
     if (!ap[d].isPlaying()) { 
    ap[d].rewind();
} 
   }
   
   if(colorY == 0){
         ap[0].pause();
      }
if(colorY < 49 && colorY !=0 && colorY !=50){
        
         ap[0].play();
          text("A",180,200);
          output.println("A");
        
      }
      
       if(colorY < 20 && colorY !=0 && colorY !=50){
        
         ap[1].play();
         text("B",180,200);
         output.println("B");
        
      }
      
         if(colorY < 40 && colorY !=0 && colorY !=50){
        
         ap[2].play();
         text("BB",180,200);
         output.println("BB");
        
      }
      
          if(colorY < 80 && colorY !=0 && colorY !=50){
        
         ap[3].play();
         text("C",180,200);
         output.println("C");
        
      }
      
            if(colorY < 150 && colorY !=0 && colorY !=50){
        
         ap[4].play();
         text("CC",180,200);
         output.println("CC");
        
      }
      
           if(colorY < 200 && colorY !=0 && colorY !=50){
        
         ap[5].play();
         text("D",180,200);
         output.println("D");
        
      }
      
            if(colorY < 250 && colorY !=0 && colorY !=50){
        
         ap[6].play();
         text("E",180,200);
         output.println("E");
        
      }
      
              if(colorY < 300 && colorY !=0 && colorY !=50){
        
         ap[7].play();
         text("EB",180,200);
         output.println("EB");
        
      }
      
      
               if(colorY < 400 && colorY !=0 && colorY !=50){
        
         ap[8].play();
         text("F",180,200);
         output.println("F");
        
      }
      
                 if(colorY < 450 && colorY !=0 && colorY !=50){
        
         ap[9].play();
         text("FF",180,200);
         output.println("FF");
        
      }
      
      
                   if(colorY < 500 && colorY !=0 && colorY !=50){
        
         ap[10].play();
         text("G",180,200);
         output.println("G");
        
      }
      
                   if(colorY > 500 && colorY !=0 && colorY !=50){
        
         ap[11].play();
         text("GG",180,200);
         output.println("GG");
        
      }
   
   
   
   //End of the Piano Sound
 }
    
}

void mousePressed(){
  playm = mouseX;
  
}


void keyReleased()
{
  if (key == 'C' ) {
    background(200);
    
  }
  if(cl>2){
  if ( key == 'r' ) 
  {

    if ( recorder.isRecording() ) 
    {
      recorder.endRecord();
    }
    else 
    {
      recorder.beginRecord();
    }
  }
  if ( key == 's' )
  {
   
    recorder.save();

  }
  }
}