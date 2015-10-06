
import ddf.minim.*;

Minim minim;
AudioPlayer groove;

void setup()
{
  size(1280, 1024, P2D);

  minim = new Minim(this);
  groove = minim.loadFile("Zeds Dead - Rude Boy (Original Mix).mp3", 512);
  groove.loop();
}

static float a = 0;
void draw()
{
  background(0);
  
  KMPoint2D[] leftArr = new KMPoint2D[groove.bufferSize()];
  KMPoint2D[] rightArr = new KMPoint2D[groove.bufferSize()];
  for(int i = 0; i < groove.bufferSize(); i++)
  {
    leftArr[i] = new KMPoint2D((float)i, 50 + groove.left.get(i) * 30);
    rightArr[i] = new KMPoint2D((float)i, 50 + groove.right.get(i) * 40);
  }

  pushMatrix();
  
  translate(width/2, height/2-100);
  a+= 0.5;
  rotate(a);
  strokeWeight(2);
  Stuff.circling(50, leftArr); //<>//
  Stuff.circling(50, rightArr);
  for (int i = 0; i < leftArr.length - 1; i++)
  {
    
    stroke(#7CFC00);
    line (leftArr[i].x,  leftArr[i].y, leftArr[i+1].x, leftArr[i+1].y);
    stroke(#FF1493);
    line (rightArr[i].x,  rightArr[i].y, rightArr[i+1].x, rightArr[i+1].y);
  }
  
  popMatrix();
  
  
  for(int i = 0; i < groove.bufferSize() - 1; i++)
  {
    stroke(255,0,0);
    line(400+i, 800  + groove.left.get(i)*50,  400+i+1, 800  + groove.left.get(i+1)*50);
    stroke(0,0,255);
    line(400+i, 800 + groove.right.get(i)*50, 400+i+1, 800 + groove.right.get(i+1)*50);
  }
}

void keyPressed()
{
  if ( key == 'p' ) groove.pause();
  else if (key == 's') groove.loop();
}