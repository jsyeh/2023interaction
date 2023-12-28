class Player {
  ArrayList<Ball> balls;
  String name;
  int windowShift = 0; //right: 600
  float[] xPositions = {100, 300, 500}; // 左邊玩家的X軸交會點  {700, 900, 1100}; // 右邊玩家的X軸交會點
  float[] yPositions = {50, 150, 250, 350, 450, 550, 650, 750}; // Y軸位置
  float timer = 30.0;
  int removedBallsCount = 0; // 紀錄左邊玩家消失的紅球和紫球數量
  int score = 0;
  boolean GameIsOver = false; // 左邊玩家遊戲是否結束
  
  Player(String _name, int _windowShift){
    name = _name;
    windowShift = _windowShift;
    resetGame();
  }
  void resetGame() {
    balls = new ArrayList<Ball>();
    float y = yPositions[0];
    boolean isRed = true;
    boolean isPurple = random(5) < 1;
  
    float x = xPositions[(int) random(columnCount)];
    Ball ball = new Ball(x + windowShift, y, isRed, isPurple);
    balls.add(ball);
  
    for (int i = 1; i < yPositions.length; i++) {
      x = xPositions[(int) random(columnCount)];
      y = yPositions[i];
      isRed = true;
      isPurple = false;
      ball = new Ball(x + windowShift, y, isRed, isPurple);
      balls.add(ball);
    }
  }
  void drawBalls() {
    for (Ball ball : balls) {
      if (ball.isRed) {
        image(img1, ball.x - ballSize / 2, ball.y - ballSize / 2, ballSize, ballSize);
      } else if (ball.isPurple) {
        image(img2, ball.x - ballSize / 2, ball.y - ballSize / 2, ballSize, ballSize);
      }
    }
    generateBall();
  }
  void generateBall(){
    // 自動產生球的機制，左邊玩家
    if (removedBallsCount > 0) {
      float newX = xPositions[(int) random(xPositions.length)] + windowShift;
      float newY = yPositions[0];
      boolean isPurple = random(5) < 1;
      balls.add(new Ball(newX, newY, !isPurple, isPurple));
      removedBallsCount--;
  
      for (Ball ball : balls) {
        if (ball.y == 750 && ball.isPurple) {
          ball.x = xPositions[(int) random(xPositions.length)] + windowShift;
        }
      }
    }
  }
  void testGameOver(){
    // 檢查是否遊戲時間結束
    if (timer > 0 && !GameIsOver) {
      //leftTimer -= 1.0 / frameRate; // 每畫面減少一秒
      timer = 30 - (millis()-startT)/1000.0;   // here!!!
    } else if (!GameIsOver) {
      // 遊戲結束的處理
      fill(255, 0, 0);
      textSize(40);
      text(name + " Game Over", windowShift + 170, height / 2);
      text(name + " Score: " + score, windowShift + 170, height / 2 + 50);
      GameIsOver = true;
    }
  }
}
Player leftPlayer, rightPlayer;

int rowCount = 8; // 行數
int columnCount = 3; // 列數
int ballSize = 90; // 球的大小

PImage img1, img2, img3, img4,img5,img6;
boolean gameStarted = false;

void setup() {
  size(1200, 800); // 調整畫布大小
  img1 = loadImage("zombie1.png");
  img2 = loadImage("zombie2.png");
  img3 = loadImage("halloween.jpg");
  img4 = loadImage("tt.png");
  img5 = loadImage("H.jpg");
  img6= loadImage("BG.jpg");
  leftPlayer = new Player("Left", 0);
  rightPlayer = new Player("Right", 600);
  noLoop(); // 初始停止畫面更新
}
void drawStartScreen() {
  background(0);
  image(img5, 0, 0, 1200, 750);
  textSize(35);
  fill(0);
  textAlign(CENTER, CENTER);
  text("Click to Start", width / 2, height / 2);
}
int startT=-1;  // here!!!
void mouseClicked() {
  gameStarted = true;
  startT = millis();  // here!!!
  loop(); // 開始畫面更新
}
void draw() {
  println(leftPlayer.timer + " " + rightPlayer.timer + " frameRate:" + frameRate);  // here!!! Debug
  if (!gameStarted) {
    drawStartScreen();
    return;
  }

  if (leftPlayer.GameIsOver && rightPlayer.GameIsOver) {
    // 左右兩邊都結束
    showEndScreen();
    return;
  }

  background(255);
  image(img3, 0, 0);
  image(img4, 600, 0, 600, 900);
 
  leftPlayer.drawBalls(); // 繪製左邊玩家的球
  rightPlayer.drawBalls(); // 繪製右邊玩家的球
  
  // 繪製直線
  stroke(0); // 設定線的顏色（黑色）
  for (float x = 200; x <= 1000; x += 200) {
    line(x, 0, x, height);
  }

  // 顯示倒數計時器和分數
  fill(255);
  textSize(20);
  text("Left Time: " + ceil(leftPlayer.timer), 70, 40);
  text("Left Score: " + leftPlayer.score, 70, 60); // 顯示左邊玩家的分數
  text("Right Time: " + ceil(rightPlayer.timer),  1110, 40);
  text("Right Score: " + rightPlayer.score, 1107, 60); // 顯示右邊玩家的分數

  leftPlayer.testGameOver();
  rightPlayer.testGameOver();
}
void showEndScreen() {
  // 結尾介面
  background(255);
  image(img6, 0, 0, 1200, 800);
  textSize(50);
  fill(0);
  textAlign(CENTER, CENTER);

  if (leftPlayer.GameIsOver && rightPlayer.GameIsOver) {
    // 左右兩邊都結束，顯示整體結果
    text("Game Over", width / 2, height / 2 - 50);
    text("Left Score: " + leftPlayer.score, width / 2, height / 2);
    text("Right Score: " + rightPlayer.score, width / 2, height / 2 + 50);
  } else if (leftPlayer.GameIsOver) {
    // 左邊結束，等待右邊結束
    text("Left Game Over", width / 4, height / 2 - 50);
    text("Left Score: " + leftPlayer.score, width / 4, height / 2);
  } else if (rightPlayer.GameIsOver) {
    // 右邊結束，等待左邊結束
    text("Right Game Over", 3 * width / 4, height / 2 - 50);
    text("Right Score: " + rightPlayer.score, 3 * width / 4, height / 2);
  }
  noLoop();  // 增加這一行來停止畫面更新
}

class Ball {
  float x;
  float y;
  boolean isRed;
  boolean isPurple;

  Ball(float x, float y, boolean isRed, boolean isPurple) {
    this.x = x;
    this.y = y;
    this.isRed = isRed;
    this.isPurple = isPurple;
  }
}

void keyPressed() {
  // 如果左邊玩家的遊戲結束，則只處理右邊玩家的按鍵事件
  if ( ! rightPlayer.GameIsOver) {
    if (key == 'j' || key == 'J') {
      removeBall(700, rightPlayer.balls);
    } else if (key == 'k' || key == 'K') {
      removeBall(900, rightPlayer.balls);
    } else if (key == 'l' || key == 'L') {
      removeBall(1100, rightPlayer.balls);
    }
  }
  if ( ! leftPlayer.GameIsOver) {
    if (key == 'a' || key == 'A') {
      removeBall(100, leftPlayer.balls);
    } else if (key == 's' || key == 'S') {
      removeBall(300, leftPlayer.balls);
    } else if (key == 'd' || key == 'D') {
      removeBall(500, leftPlayer.balls);
    }
  }
}


void removeBall(float targetX, ArrayList<Ball> currentBalls) {
  boolean isRemoveValid = false;
  for (int i = currentBalls.size() - 1; i >= 0; i--) {
    Ball ball = currentBalls.get(i);
    if (ball.x == targetX && ball.y == 750) {
      isRemoveValid = true;
      boolean isRed = ball.isRed;
      boolean isPurple = ball.isPurple;
      currentBalls.remove(i);

      for (Ball otherBall : currentBalls) {
        if (otherBall.y < 750) {
          otherBall.y += 100;
        }
      }

      if (isRed) {
        if (currentBalls == leftPlayer.balls) {
          leftPlayer.removedBallsCount++;
          leftPlayer.score += 10;
        } else if (currentBalls == rightPlayer.balls) {
          rightPlayer.removedBallsCount++;
          rightPlayer.score += 10;
        }
      } else if (isPurple) {
        if (currentBalls == leftPlayer.balls) {
          leftPlayer.removedBallsCount++;
          leftPlayer.score += 20;
        } else if (currentBalls == rightPlayer.balls) {
          rightPlayer.removedBallsCount++;
          rightPlayer.score += 20;
        }
      }
    }
  }
println("isRemoveValid");
  if (!isRemoveValid) {
    if (currentBalls == leftPlayer.balls) {
      leftPlayer.timer -= 1;
    } else if (currentBalls == rightPlayer.balls) {
      rightPlayer.timer -= 1;
    }
  }
}
