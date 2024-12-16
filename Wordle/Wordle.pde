import java.io.*;
import java.util.*;

char[][] lgrid;
int[][] cgrid;
char[] guess;
char[] word;
String[] answers;
String[] guesses;
int res = 72;
int col;
int row;
boolean gameover;

void settings() {
  size(5*res, 6*res);
}

void setup() {
  enterdataset();

  lgrid = new char[5][6];
  cgrid = new int[5][6];
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 6; j++) {
      lgrid[i][j] = ' ';
      cgrid[i][j] = -1;
    }
  }

  int temp = (int)(Math.random()*(answers.length + 1));
  guess = new char[5];
  word = new char[5];
  for (int i = 0; i < 5; i++) {
    guess[i] = ' ';
    word[i] = Character.toUpperCase(answers[temp].charAt(i));
  }

  col = 0;
  row = 0;
  gameover = false;
}

void draw() {
  background(18, 18, 19);
  stroke(58, 58, 60);
  strokeWeight(2);

  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 6; j++) {
      switch(cgrid[i][j]) {
      case -1:
        fill(18, 18, 19);
        break;
      case 0:
        fill(58, 58, 60);
        break;
      case 1:
        fill(181, 159, 59);
        break;
      case 2:
        fill(83, 141, 78);
        break;
      }
      rect(i*res + 4, j*res + 4, res - 8, res - 8);
    }
  }

  fill(255);
  textFont(createFont("Arial Bold", res/2));
  textAlign(CENTER, CENTER);
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 6; j++) {
      text(lgrid[i][j], i*res + res/2, j*res + res/2);
    }
  }

  if (gameover) {
    for (int i = 0; i < 5; i++) {
      print(word[i]);
    }
    noLoop();
  }
}

void keyPressed() {
  if (!gameover) {
    if ((col < 5) && Character.isLetter(key)) {
      guess[col] = Character.toUpperCase(key);
      col++;
    }
    if ((col > 0) && (key == BACKSPACE)) {
      guess[col-1] = ' ';
      col--;
    }
    for (int i = 0; i < 5; i++) {
      lgrid[i][row] = guess[i];
    }
    if ((key == ENTER) && (col == 5)) {
      check();
    }
  }
}

void check() {
  String temp = "";
  for (int i = 0; i < 5; i++) {
    temp += guess[i];
  }
  for (int i = 0; i < guesses.length; i++) {
    if (guesses[i].equalsIgnoreCase(temp)) {
  modify();
  row++;
      break;
    }
  }
  for (int i = 0; i < 5; i++) {
    guess[i] = ' ';
  }
  col = 0;
  if (row >= 6) {
    gameover = true;
  }
}

void modify() {
  char[] temp = new char[5];
  for (int i = 0; i < 5; i++) {
    temp[i] = word[i];
  }
  for (int i = 0; i < 5; i++) {
    if (guess[i] == temp[i]) {
      cgrid[i][row] = 2;
      temp[i] = ' ';
    }
  }
  for (int i = 0; i < 5; i++) {
    if (cgrid[i][row] == -1) {
      for (int j = 0; j < 5; j++) {
        if (guess[i] == temp[j]) {
          cgrid[i][row] = 1;
          temp[j] = ' ';
          break;
        }
      }
    }
  }
  for (int i = 0; i < 5; i++) {
    if (cgrid[i][row] == -1) {
      cgrid[i][row] = 0;
      temp[i] = ' ';
    }
  }
  gameover = true;
  for (int i = 0; i < 5; i++) {
    if (cgrid[i][row] != 2) {
      gameover = false;
    }
  }
}

void enterdataset() {
  ArrayList<String> temp = new ArrayList<String>();
  Scanner sc;

  try {
    sc = new Scanner(new File("C:/Users/sd/Documents/Processing/Wordle/words.txt"));
    while (sc.hasNextLine()) {
      temp.add(sc.nextLine());
    }
    sc.close();
    answers = temp.toArray(new String[0]);
    temp.clear();
  }
  catch(FileNotFoundException e) {
    e.printStackTrace();
  }

  try {
    sc = new Scanner(new File("C:/Users/sd/Documents/Processing/Wordle/words.txt"));
    while (sc.hasNext()) {
      temp.add(sc.nextLine());
    }
    sc.close();
    guesses = temp.toArray(new String[0]);
    temp.clear();
  }
  catch(FileNotFoundException e) {
    e.printStackTrace();
  }
}
