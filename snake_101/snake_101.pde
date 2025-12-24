
// Screen Variables
final int PIXEL_SIZE = 20;
final int TOP_MARGIN_SIZE = 20;

final int GAME_WIDTH = 32;
final int GAME_HEIGHT = 16;

// Colors
final color BLACK = color(0);
final color BLUE = color(0,0,255);
final color GREEN = color(0,255,0);
final color RED = color(255,0,0);
final color GRAY = color(200, 200, 200);

// Game State Machine
final int GAME_STATE_READY = 0;
final int GAME_STATE_PLAYING = 1;
final int GAME_STATE_GAME_OVER = 2;

int game_state = GAME_STATE_READY;

// Game Variables
String GAME_NAME = "SNAKE";
int game_points = 0;

// Direction
final int DIRECTION_NONE = 0;
final int DIRECTION_UP = 1;
final int DIRECTION_DOWN = 2;
final int DIRECTION_LEFT = 3;
final int DIRECTION_RIGHT = 4;

int snake_direction = DIRECTION_NONE;

// Debug - Helpers
int snake_head_x = 0;
int snake_head_y = 0;

void settings() { 
  size(GAME_WIDTH * PIXEL_SIZE,
       (GAME_HEIGHT * PIXEL_SIZE) + TOP_MARGIN_SIZE);
}

void drawMarginText(String margin_text)
{
  fill(BLACK);
  textSize(15);
  text(margin_text,5,PIXEL_SIZE-5);
}

void drawGamePixel(int x, int y, color c) {
  if (x < 0 || x >= GAME_WIDTH || y < 0 || y >= GAME_HEIGHT) 
  {
    return;
  }

  fill(c);
  noStroke();
  rect(x * PIXEL_SIZE,
       (y * PIXEL_SIZE) + TOP_MARGIN_SIZE,
       PIXEL_SIZE,
       PIXEL_SIZE);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP)        snake_direction = DIRECTION_UP;
    else if (keyCode == DOWN) snake_direction = DIRECTION_DOWN;
    else if (keyCode == LEFT) snake_direction = DIRECTION_LEFT;
    else if (keyCode == RIGHT)snake_direction = DIRECTION_RIGHT;
  }
}

void setup() {

}

void draw() {
  background(GRAY);
  drawMarginText(GAME_NAME + " - Game State: " + game_state + " - Points: " + game_points + " - Direction: " + snake_direction + " - S_X: " + snake_head_x+ " - S_Y: " + snake_head_y);
  
  // Calculate new snake position
  switch (snake_direction)
  {
    case DIRECTION_UP:
    if (snake_head_y > 0)
    {
     snake_head_y--; 
    }
    break;
    
    case DIRECTION_DOWN:
    if (snake_head_y < (GAME_HEIGHT - 1))
    {
     snake_head_y++; 
    }
    break;
    
    case DIRECTION_LEFT:
    if (snake_head_x > 0)
    {
     snake_head_x--; 
    }
    break;
    
    case DIRECTION_RIGHT:
    if (snake_head_x < (GAME_WIDTH - 1))
    {
     snake_head_x++; 
    }
    break;
    
    default:
    break;
  }
  
  drawGamePixel(snake_head_x, snake_head_y, GREEN);
  
  // Add ticks with millis
}
