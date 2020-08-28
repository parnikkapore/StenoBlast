/*
String[] words = {
  "the", "pup", "sat", "sap", "hull", "is", "tough", "tap",
  "pull", "pal", "had", "it", "you", "hut", "salt", "staff" };
*/

String getCurS(){
  // return "cat";
  // return "supercalifragilisticexpialidocious";
  
  if(curDeck.size()==0) return "";
  curR = randDeckItem();
  return curR.getString("word");
}
