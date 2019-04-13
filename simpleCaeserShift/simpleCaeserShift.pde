int offPut = 0;
ArrayList<Integer> message = new ArrayList<Integer>();

void setup() {
  String code = "lzwu cpr nwta dfn dk ranez ettev";
  int current = -1;
  for(int i = 0; i < code.length(); i++) message.add((int)code.charAt(i));
  for(int k = 0; k < 26; k++) {
  for(int i = 0; i < message.size(); i++) {
    current = message.get(i);
    if(current == 32) {
      print(char(current));
    }
    else if(current + offPut + k > 122) {
      print(char(97 + current + offPut + k - 123));
    }
    else print(char(current + offPut + k));
  } println(); println();
  }
}

void draw() {
  
}
