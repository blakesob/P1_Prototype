  int[] barH = new int[10];
  int[] divX = new int[10];
 
  int downCount = 0;
  int upCount = 0;
  int[] boxYcor = new int[10];
  int y = 30;
  int boxNr = 0;
  int[] boxVal = new int[10];
  
void setup(){
  size(600, 600);
}

void draw(){
  background(255);
  boxColor();
  displayBoxes();
  displayNumbers();
  valLineX(110, 370, 370, 9);
  valLineY(110, 370, 290, 5);
  bars();
  fill(0);
  text("Use up & down keys to navigate the boxes, type in numbers from 0 till 5", 20, 30);
  
  
}

void keyPressed(){
jumpBox();

}


void displayBoxes(){
for(int i=0; i<=9; i++){
  
  y = (i+1) * 30;
  noFill();
  rect(50, 50 + y, 20, 20);
  
  boxYcor[i] = 50 + y;
  
  }
}//end of display boxes

void displayNumbers(){
  //checks nr. 1-5
if(keyCode == '0' || keyCode == '1' || keyCode == '2' || keyCode == '3' || keyCode == '4' || keyCode == '5'){

//saves the value in boxVal array
boxVal[boxNr] = keyCode-48;


  
}
//writes all the array values in the respective boxes
for(int i = 0; i <=9; i++){
fill(0);
text(boxVal[i], 55, boxYcor[i]+18);}

}//end of display numbers

void jumpBox(){
  //goes down to next box
if(keyCode == DOWN && boxNr <= 8){
  keyCode = 0;
  boxNr++;
  println(boxNr);
  
}
  //goes up to prior box
if(keyCode == UP && boxNr >= 1){
  keyCode = 0;
  boxNr--;
  println(boxNr);
  
}

}//end of jumpBox

void boxColor(){
  //changes the color of the box selected
fill(#A6FCF2);
rect(50, boxYcor[boxNr], 20 , 20);

}//end of boxColor


void valLineX(int x, int y, int l, int div){
  //draws x axis and 10 lines along it
for(int i = 0; i <= div; i++){

line(x, y, x+l, y);
line(((((l-30)/div)*i)+x+30), y, ((((l-30)/div)*i)+x+30), y+5);
divX[i] = ((((l-30)/div)*i)+x+30);

}

}//end of valLineX



void valLineY(int x, int y, int l, int div){
  //draws y axis and 6 lines along it
for(int i = 0; i <= div; i++){

line(x, y, x, y-l);
line( x, (y-((l/div)*i)), x-5, (y-((l/div)*i)));


}

}//end of valLineY

void bars (){
  //draws the bars  
for(int i = 0; i <= 9; i++){
  //determines the height based on box values
barH[i] = (290/5)*-boxVal[i];
rect(divX[i]-10, 370, 20, barH[i]);
  

}
}// end of bars