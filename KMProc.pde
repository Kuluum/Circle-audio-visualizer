
public class KMPoint2D
{
  public float x;
  public float y;
  
  public KMPoint2D (float x, float y) 
  {
    this.x = x;
    this.y = y;
  }
  
   public KMPoint2D (int x, int y) 
  {
    this.x = (float)x;
    this.y = (float)y;
  }
  
  public void set(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
  
  public void set(int x, int y)
  {
    this.x = (float)x;
    this.y = (float)y;
  }
  
  public void set(KMPoint2D newPoint)
  {
    this.x = newPoint.x;
    this.y = newPoint.y;
  }
  
  public void inc(float dx, float dy)
  {
    this.x += dx;
    this.y += dy;
  }
  
  public void inc(int dx, int dy)
  {
    this.x += (float)dx;
    this.y += (float)dy;
  }
  
  public String description()
  {
    return "KMPoint2D(" + this.x + ", " + this.y + ")";
  }
  
  public String toString()
  {
    return description();
  }
}

public static class Stuff
{
  /*
   * Transform curve line which pixels in initialArray to curve circle;
   * 
   */
 public static KMPoint2D[] circling(float meanY, KMPoint2D[] initialArray)
  {
    float circleRad = initialArray.length/2;
    
    float angleStep = 360.f/(initialArray.length-1);
    for( int i = 0; i < initialArray.length; i++)
    {
      float rad = circleRad + (initialArray[i].y - meanY);
      float angle = radians(i * angleStep);
      initialArray[i].set(rad*sin(angle), rad*cos(angle));
    }
    return initialArray;
  }
}