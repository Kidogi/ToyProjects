

void setup() {
  String cypherText = "eva krc beoa trnzeva cpr bwtfcowv ob dk \n" +
  "vw urevb bw aollogftc eb kwf uonpc dr \n"
  + "tra cw ouenovr lzwu cpr lozbc pebck \n" +
  "ovbxrgcowv wl cpr cpezegrzb cprbr \n"
  +"gpezegcrzb eb evk wvr uonpc zreaotk \n"
  +"nfrbb lwzu e goxprz cpec ob cw bek cprk \n"
  +"gwvhrk e urevovn dfc cprv lzwu ipec ob \n"
  +"svwiv wl soaa o gwfta vwc bfxxwbr pou \n"
  +"gexedtr wl gwvbczfgcovn evk wl cpr \n"
  +"uwzr edbczfbr gzkxcwnzexpb o uear fx \n"
  +"uk uova ec wvgr cepec cpob iev wl e bouxtr \n"
  +"bxrgorb bfgp pwirhz eb iwfta exxrez cw \n"+
  "cpr gzfar ovcrttrgc wl cpr beotwz \n" +
  "edbwtfcrtk ovbwtfdtr iocpwfc cpr srk \n" +
  "lzwu cpr nwta dfn dk ranez ettev xwr \n";
  //String plainText = "";
  
  String plainText = cypherText;
  
  int[] freqAnalys = new int[26];
  CipherLetter[] analysis = new CipherLetter[26];
  
  println(cypherText);
  cypherText = cypherText.toLowerCase();
  cypherText = cypherText.replaceAll("\\s+","");
  plainText.toLowerCase();
  
  int size = cypherText.length();
  
  for(int i = 0; i < cypherText.length(); i++) {
    freqAnalys[((int)(cypherText.charAt(i)))-97]++;
  }
  
  for(int i = 0; i < freqAnalys.length; i++) {
    print("(" + char(i+97) + ":" + (float)freqAnalys[i]/size*100 + "), ");
    analysis[i] = new CipherLetter(freqAnalys[i], char(i+97));
  }
  
  println();
  int biggest = analysis[0].x;
  CipherLetter carry = analysis[0];
  int  hold = 0;
  for(int i = 0; i < analysis.length; i++) {
    biggest = analysis[i].x;
    for(int j = i; j < analysis.length; j++) {
      if(analysis[j].x > biggest) {
        biggest = analysis[j].x;
        hold = j;
      }
    }
    carry = analysis[i];
    analysis[i] = analysis[hold];
    analysis[hold] = carry;
  }
  
  println();
  for(int i = 0; i < analysis.length; i++) {
    print("(" + analysis[i].some + ":" + (float)analysis[i].x/size*100 + "), ");
  }
  
}

class CipherLetter {
  int x;
  char some;
  
  CipherLetter(int n_x, char n_some) {
    x = n_x;
    some = n_some;
  }
  
}

void draw() {
  
}
