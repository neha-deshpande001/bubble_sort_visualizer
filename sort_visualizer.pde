//bubble sort visualizer

int numElements = 10; // this changes the number of elements to sort. The bar width will changeautomatically
float[] nums = new float[numElements];
int i = 0;
int sorted = 0;
int swaps = 0;
int comparisons = 0;
int worstComp = nums.length * nums.length;
int bestComp = nums.length;

void setup() {
  for (int i = 0; i < nums.length; i++) {
    nums[i] = random(1, 20); // the values here don't matter because they will be scaled up when drawing
  }
  frameRate(60); // speed of sorting - one comparison is one cycle
  size(1000, 1000);
  background(0);
  strokeWeight(10);
  fill(255);
  drawRectangles(0);
}

void draw() {

  // an element has been sorted, so start again from the left
  if (i >= nums.length - sorted - 1) {
    i = 0;
    sorted++;
  }
  background(0);
  drawRectangles(i);
  comparisons++;
  if (nums[i] > nums[i+1]) { //swapping vales
    float temp = nums[i];
    nums[i] = nums[i+1];
    nums[i+1] = temp;
    swaps++;
  }
  if (sorted()) { //list has been sorted
    background(0);
    drawRectangles(-1); //stop drawing the red rectangle

    //print some statistics to the console    
    System.out.println("Comparisons:\n  " + worstComp + " - worst\n  " + comparisons + " - actual\n  " + bestComp + " - best");
    System.out.println("Swaps:\n  " + worstComp + " - worst\n  " + swaps + " - actual\n  " + 1 + " - best");
    System.out.println("List sorted in " + millis() + " milliseconds.");

    noLoop(); //stop looping
  }
  i++;
  //  saveFrame("frames//###.png"); // saves one frame per cycle
}

//draw the rectangle to the screen
void drawRectangles(int current) {
  float x1 = 0;
  float x2 = width/nums.length;
  float y;

  //determine the height of the largest bar
  float biggest = -1;
  for (int i = 0; i < nums.length; i++) {
    if (nums[i] > biggest)
      biggest = nums[i];
  }

  for (int i = 0; i < nums.length; i++) {
    if (i == current)
      fill(255, 0, 0); //red
    else
      fill(255); //white

    //determine height of each bar for normalizing
    //ensure that the largest bar is always the height of the screen
    y = height-(nums[i] * height/biggest);
    rect(x1, height, x2-x1, y-height);    
    x1 += width/nums.length; //update x values
    x2 += width/nums.length;
  }
}

//determines if the list has been sorted
boolean sorted() {
  for (int i = 0; i < nums.length-1; i++) {
    if (nums[i] > nums[i+1])
      return false;
  }
  return true;
}
