int MAX_VALUE = 100;
int MIN_VALUE = -100;
Visualizer v;

/*You are simulating a visualizer of multiple values
 You need to create a display method first. 
 Then you can make a method that changes the values each time the update is called. 
 */
class Visualizer {
  float x, y;
  float [] values;
  float [] speeds;
  Visualizer(float x, float y, int vals) {
    this.x = x;
    this.y = y;
    values = new float[vals];
    speeds = new float[vals];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-99, 99);
      speeds[i] = random(2);
    }
  }

  void display() {
    //draw the bars equally spaced inside this box. 
    //You can assume 10, but it would be even better 
    //if you could modify it to be larger increments.
    fill(255);
    rect(x, y, 400, 200);
    //This is a 200x400 box.
    //The width of the visualizer is 400! This rect is the border

    //the line is the 0 y-value, the top is 100, the bottom is -100
    line(x, y+100, x+400, y+100);

    //You need to use a loop. You need to make the HEIGHT of the bars 
    //the values in the array.
    //Negative values are red, and go below the line.
    //Positive values are green and go above the line.

    //???WRITE THIS METHOD!!!
    //THESE ARE WRONG: They just illustrate how they could look
    int bars = values.length;
    int sep = 400/bars;
    float curX=x-sep; //keep track of where the last bar was placed.
    
    for (float v: values) {
      if (v < 0) { 
        fill(255, 0, 0); //red for negative. 
        if (v > -50) fill(255,165,0);
        rect(curX+=sep, 120, sep, Math.abs(v));
      } else if (v > 0) {
        fill(0, 255, 0); //green for positive.
        if (v < 50) fill(255,255,0);
        rect(curX+=sep, 120-v, sep, v);
      }
    }

    //Width of the visualizer is 400!

  
  }
  void update() {
    //???WRITE THIS METHOD!!!
    for (int i = 0; i < values.length; i++) {
      if (abs(values[i] + speeds[i]) > 100) {
        speeds[i] *= -1;
      }
      values[i] += speeds[i];
        
      //??? keep them values between max/min value
      
      //??? reverse the speeds so they oscillate up/down when they reach max/min

      
    }
  }
}

void setup() {
  size(600, 500);
  v = new Visualizer(20, 20,20);
}
void draw() {
  background(255);
  v.display();
  v.update();
}
