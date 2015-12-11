public int bSize = 600;

boolean left = false;
boolean right = false;
boolean up = false;
boolean down = false;
boolean hyperSpace = false;
boolean fire = false;

SpaceShip clarkKent = new SpaceShip();
Stars [] krypton = new Stars[150];
ArrayList <Asteroids> lexLuthor;


public void setup(){
  size(bSize,bSize);
  for(int i = 0; i < krypton.length; i++){
    krypton[i] = new Stars();
  }
  lexLuthor = new ArrayList <Asteroids>();
  for(int j = 0; j < 30; j++){
    lexLuthor.add(new Asteroids());
  }
}
public void draw(){
  background(0);  
  for(int i = 0; i < krypton.length; i++){
    krypton[i].show();
    }
  for(int j = 0; j < lexLuthor.size(); j++){
    lexLuthor.get(j).show();
    lexLuthor.get(j).move();
    if (dist(lexLuthor.get(j).getX(),lexLuthor.get(j).getY(), clarkKent.getX(), clarkKent.getY()) < 20){
      lexLuthor.remove(j);
    }
  }

  clarkKent.show();
  clarkKent.move();


  if (left == true){
    clarkKent.setPointDirection((int)(clarkKent.getPointDirection()-5));
  }
  if (right == true){
    clarkKent.setPointDirection((int)(clarkKent.getPointDirection()+5));
  }
  if (up == true){
    clarkKent.accelerate(.1);
  }
  if (down  == true){
    clarkKent.accelerate(-.1);
  }

}
void keyPressed(){
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
    //full stop 
    clarkKent.setDirectionX(0);
    clarkKent.setDirectionY(0);
    //random direction
    clarkKent.setPointDirection((int)(Math.random()*360+1));
    //random location
    clarkKent.setX((int)(Math.random()*600)); 
    clarkKent.setY((int)(Math.random()*600));
  }
}
void keyReleased(){  
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

    myColor = color(124,174,138);   
    setX((int)(bSize/2));
    setY((int)(bSize/2));
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

  public void move(){
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    myDirectionX = myDirectionX/1.015;
    myDirectionY = myDirectionY/1.015;

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

class Stars {
  private int myX,myY,size;
  Stars(){
    myX = (int)(Math.random()*width);
    myY = (int)(Math.random()*height);
  }
  void show(){
    stroke(255);
    ellipse(myX,myY,2,2);
    if(myX > width){myX = 0;}
    else if(myX < 0){myX = width;}
    if(myY > height){myY = 0;}
    else if(myY < 0){myY = height;}
  }
}

class Asteroids extends Floater {
  private int rotationSpeed;
  Asteroids(){

      myColor = color(200,7,32,70);
      corners = 8;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = 20;
      yCorners[0] = 0;
      xCorners[1] = 15;
      yCorners[1] = 15;
      xCorners[2] = 0;
      yCorners[2] = 20;
      xCorners[3] = -15;
      yCorners[3] = 15;
      xCorners[4] = -20;
      yCorners[4] = 0;
      xCorners[5] = -15;
      yCorners[5] = -15;
      xCorners[6] = 0;
      yCorners[6] = -20;
      xCorners[7] = 15;
      yCorners[7] = -15;
   
      myCenterX = ((int)(Math.random()*599));
      myCenterY = ((int)(Math.random()*599));
      setDirectionX((Math.random()*3-1.5));
      setDirectionY((Math.random()*3-1.5));
      setPointDirection(0); //holds current direction the ship is pointing in degrees
      rotationSpeed = (int)(Math.random()*10-4);    
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

  public void move (){
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     
    myPointDirection+=rotationSpeed;

        //wrap around screen    
    if(myCenterX >width+50)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0-50)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height+50)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0-50)
    {     
      myCenterY = height;    
    }   
  } 
}

class Bullets extends Floater {
  public Bullets(SpaceShip clarkKent){
    setX(clarkKent.getX());
    setY(clarkKent.getY());
    setPointDirection((int)(clarkKent.getPointDirection()));
    double dRadians = myPointDirection*(Math.PI/180);
    setDirectionX(5 * Math.cos(dRadians) + clarkKent.getDirectionX()); 
    setDirectionY(5 * Math.cos(dRadians) + clarkKent.getDirectionY());   
    accelerate(10);
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

  public void move (){
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;
    accelerate(0.5);
  }
  public void show (){
    ellipse(x, y, width, height);
  }
}
abstract class Floater{
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

