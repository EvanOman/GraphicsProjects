/*
  Name: Evan Oman
  Date: 2/12/15
*/

import processing.video.*;

/* Some useful global variables */
Movie myMovie;
int HEIGHT = 450;
int WIDTH = 800;
int counter = 0;

/* The array list which will contain all of our letter instances */
ArrayList<Letter> letters = new ArrayList<Letter>();

/* Boolean array which is used to mark every pixel as above or below the dark threshold*/
boolean[] isDarkEnough = new boolean[WIDTH * HEIGHT];

/* Defines the possible chars to fall from the top */
char[] possibleChars = {
  'E', 'V', 'A', 'N'
};

/* My letter class which represents the text drawn to the screen */
class Letter
{
  /* The char and position of this instance */
  char character;
  int posY, posX;

  /* Simple constructor */
  Letter(char L, int initX, int initY)
  {
    character = L;
    posY = initY;
    posX = initX;
  }

  /* Called every refresh cycle, moves the char down until it hits something dark enough */
  void update()
  {
    /* Moves the char position down */
    posY += 1;

    /* Need the linear(flattened) coordinates of the char's position */
    int arrayPos = xyToLinear(posX, posY);

    /* While our char is over a pixel that is dark enough, we need to move it up */
    while (xyToLinear (posX, posY) >= 0 && xyToLinear(posX, posY) < HEIGHT * WIDTH && isDarkEnough[xyToLinear(posX, posY)])
    {
      posY--;
    }

    /* Actually draws the char to the screen at the correct position */
    text(character, posX, posY);
  }
}

/* Standard setup */
void setup()
{
  size(WIDTH, HEIGHT);
  myMovie = new Movie(this, "Class_1.m2v");
  myMovie.loop();
}

/* Called every refresh */
void draw()
{
  /* Draws the current frame to the screen */
  image(myMovie, 0, 0);

  /* Advances the counter(for timing purposes) */
  counter++;

  /* Makes sure that the letter positions and darkness info is up to date with the current frame */
  updateIsDark();
  updateLetters();
}

/* Called every refresh, updates all of the letter instances and adds new letters at intervals */
void updateLetters()
{
  /* Adds a new letter every 20 refreshes, corresponds to 3 a second */
  if (counter % 20 == 0)
  {
    /* Produces a random char from the list and random x position as required */
    int randX = int(random(width));
    char randChar = possibleChars[int(random(possibleChars.length))];
    letters.add(new Letter(randChar, randX, 0));
  }

  /* Effectively removes letters that have been around for 20 seconds */
  if (letters.size() > 60)
  {
    letters.remove(0);
  }

  /* Need to loop over all letters instances to update their position and remove letters that are off the screen */
  for (int i = 0; i < letters.size (); i++)
  {
    /* Gets the ith letter */
    Letter letter = letters.get(i);

    /* If the letter is off screen, remove it, otherwise update its position */
    if (letter.posX > width || letter.posY > height)
    {
      letters.remove(i);
    } else
    {
      letter.update();
    }
  }
}

/* Updates the boolean array determining whether or not a pixel is dark enough for a letter to rest on */
void updateIsDark()
{
  /* Grabs the (flattened)dimensions of the pixel array */
  int dimension = WIDTH * HEIGHT;
  myMovie.loadPixels();

  /* Loops over all pixels */
  for (int i = 0; i < dimension; i ++)
  {
    /* Gets color values of the pixel */
    int r = (int)red(myMovie.pixels[i]);
    int g = (int)green(myMovie.pixels[i]);
    int b = (int)blue(myMovie.pixels[i]);

    /* 
     Here I use a brightness function suggested here: http://stackoverflow.com/questions/596216/formula-to-determine-brightness-of-rgb-color
     If we are below a threshold(which was experimentally derived) we are dark enough, otherwise we are not dark enough
     */
    isDarkEnough[i] = (boolean)(sqrt( 0.299*r*r + 0.587*g*g + 0.114*b*b ) < 85 );
  }
}

/* Utility function to get the flattened version of a coordinate pair */
int xyToLinear(int x, int y)
{
  /* 
   Since the height x width matrix is flattened such that rows are traversed and then columns, we simply multiply by the row,
   (the height) and then add the column(the width)
   */
  return y * WIDTH + x;
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}


