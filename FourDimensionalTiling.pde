float Scale = 0.05;
int TileSize = 10;
float XPos = 0;
float YPos = 0;
int XCell;
int YCell;
float XOffset;
float YOffset;
float Colour;
float Z = 0;
float Speed = 0.5;


void setup(){
  size(1920, 1080);
  background(30);
  frameRate(60);
};

void draw(){
  background(30);
  
  
    //gets the input  
  if(keyPressed == true){
    if(key=='w'){YPos = YPos + Speed;};
    if(key=='s'){YPos =  YPos - Speed;};
    if(key=='a'){XPos = XPos + Speed;};
    if(key=='d'){XPos = XPos - Speed;};
    if(key=='q'){Z+=0.1;};
    if(key=='e'){Z-=0.1;};
  };
  
  XCell = floor(XPos);
  YCell = floor(YPos);
  
  XOffset = XPos - XCell;
  YOffset = YPos - YCell;
  
  for(int x=-1; x<width/TileSize; x+=1){
    for(int y=-1; y<height/TileSize; y+=1){
      
      Colour = noise((floor(XPos)-x)*Scale, (floor(YPos)-y)*Scale, Z*Scale);
      
      
      
      if(Colour < 0.4){
        fill(28, 89, 188);
        stroke(28, 89, 188);
      }else if(Colour < 0.5){
        fill(27, 122, 186);
        stroke(27, 122, 186);
      } else if(Colour < 0.55){
        fill(249, 206, 12);
        stroke(249, 206, 12);
      } else {
        fill(110, 216, 10);
        stroke(110, 216, 10);
      };
      
      
      rect((x+XOffset)*TileSize, (y+YOffset)*TileSize, TileSize, TileSize);
    };
  }
  
  fill(200, 0, 0);
  stroke(200, 0, 0);
  circle(width/2, height/2, 10);
  println(frameRate);
};
