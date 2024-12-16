import java.util.*;

class System {
  int choice;
  String axiom;
  Hashtable<Character, String> rules;
  String str;
  float len;
  float angle;
  float factor;

  System(int choice) {
    str = "";
    rules = new Hashtable<Character, String>();
    switch(choice) {
    case 1:
      axiom = "B";
      rules.put('B', "A[-B]+B");
      rules.put('A', "AA");
      len = 512;
      angle = PI/4;
      factor = 1.0/2.0;
      break;
    case 2:
      axiom = "B-A-A";
      rules.put('B', "B-A+B+A-B");
      rules.put('A', "AA");
      len = 512;
      angle = 2*PI/3;
      factor = 1.0/2.0;
      break;
    case 3:
      axiom = "X";
      rules.put('X', "A+[[X]-X]-A[-AX]+X");
      rules.put('A', "AA");
      len = 180;
      angle = 5*PI/36;
      factor = 1.0/2.0;
      break;
    }
  }
}
