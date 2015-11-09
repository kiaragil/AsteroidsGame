public int bSize = 600;
SpaceShip clarkKent = new SpaceShip();
star[] kryptonite = new star[100];
boolean left = false;
boolean right = false;
boolean up = false;
boolean down = false;
boolean hyperSpace = false;
boolean fire = false;
public void setup(){
  size(bSize,bSize);
  for(int i = 0; i < kryptonite.length; i++){
    kryptonite[i] = new star();
  }
}
public void draw(){  
  background(0);
  clarkKent.show();
  clarkKent.move();
  for(int i = 0; i < kryptonite.length; i++)
    {
      kryptonite[i].show();
    }

  if (left == true){
    clarkKent.setPointDirection((int)(clarkKent.getPointDirection()-5));
  }
  if (right == true){
    clarkKent.setPointDirection((int)(clarkKent.getPointDirection()+5));
  }
  if (up == true){
    clarkKent.accelerate(.05);
  }
  if (down  == true){
    clarkKent.accelerate(-.05);
  }

}

void keyPressed()
{
  if(key == CODED && keyCode == UP){ 
    up = true;
  }
  else if(key == CODED && keyCode == DOWN){ 
    down = true;
  }
  else if(key == CODED && keyCode == LEFT){ 
    left = true;
  }
  else if(key == CODED && keyCode == RIGHT){ 
    right = true;
  }
  if(key == 'h'){ 
    clarkKent.setX((int)(Math.random()*600));
    clarkKent.setY((int)(Math.random()*600));
  }
}
void keyReleased()
{
  if(key == CODED && keyCode == UP){ 
    up = false;
  }
  else if(key == CODED && keyCode == DOWN){ 
    down = false;
  }
  else if(key == CODED && keyCode == LEFT){ 
    left = false;
  }
  else if(key == CODED && keyCode == RIGHT){ 
    right = false;
  }

}
public void keyTyped(){

}


class SpaceShip extends Floater{   
    public SpaceShip(){
      corners = 4;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = -10;
      yCorners[0] = 14;
      xCorners[1] = 16;
      yCorners[1] = 0;
      xCorners[2] = -10;
      yCorners[2] = -14;
      xCorners[3] = -6;
      yCorners[3] = 0;

      myColor = color(161,239,139);   
      myCenterX = ((int)(bSize/2));
      myCenterY = ((int)(bSize/2));
      setDirectionX(0);
      setDirectionY(0);
      setPointDirection(0); //holds current direction the ship is pointing in degrees    

    }

  public void setX(int x){myCenterX = x;}
  public int getX(){return ((int)(myCenterX));}
  public void setY(int y){myCenterY = y;}   
  public int getY(){return ((int)(myCenterY));}  
  public void setDirectionX(double x){myDirectionX = x;} 
  public double getDirectionX(){return((int)(myDirectionX));}   
  public void setDirectionY(double y){myDirectionY = y;}  
  public double getDirectionY(){return((int)(myDirectionY));} 
  public void setPointDirection(int degrees){myPointDirection = degrees;} 
  public double getPointDirection(){return((int)(myPointDirection));}

  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    myDirectionX = myDirectionX/1.0054;
    myDirectionY = myDirectionY/1.0054;

        //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   

}

class star
{
  private int myX,myY,size;
  star()
  {
    myX = (int)(Math.random()*width);
    myY = (int)(Math.random()*height);
  }
  void show()
  {
    stroke(255);
    ellipse(myX,myY,4,4);
    if(myX > width){myX = 0;}
    else if(myX < 0){myX = width;}
    if(myY > height){myY = 0;}
    else if(myY < 0){myY = height;}
  }
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

